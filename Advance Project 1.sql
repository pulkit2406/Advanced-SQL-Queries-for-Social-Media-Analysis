
use ig_clone;

-- 1.How many times does the average user post?

WITH count_post as(
 select user_id, count(*) as ct from photos
 group by user_id)
select avg(ct) as avg_post from count_post ;

-- 2.Find the top 5 most used hashtags.

 SELECT t.tag_name
FROM photo_tags pt
JOIN tags t ON pt.tag_id = t.id
GROUP BY pt.tag_id, t.tag_name
ORDER BY COUNT(pt.tag_id) DESC
LIMIT 5;

-- 3.Find users who have liked every single photo on the site

select username from users where id=any
(select l.user_id
from likes l 
join photos p on l.photo_id=p.id
group by l.user_id
having count(l.user_id) = 
(select count(id) from photos));

-- 4.Retrieve a list of users along with their usernames and the rank of their account creation, ordered by the creation date in ascending order

select username, rank() over (order by created_at) as RK from users;

-- 5.List the comments made on photos with their comment texts, photo URLs, and usernames of users who posted the comments. Include the comment count for each photo

select c.comment_text, p.image_url,u.username, count(comment_text) over(partition by p.id) AS comment_count
FROM comments c
JOIN photos p ON c.photo_id = p.id
JOIN users u ON c.user_id = u.id
ORDER BY p.id, comment_count DESC;

-- 6.For each tag, show the tag name and the number of photos associated with that tag. Rank the tags by the number of photos in descending order.

select t.tag_name, count(pt.tag_id) as count_photo, rank() over( order by count(pt.tag_id) desc) as RK
from photo_tags pt
join tags t on pt.tag_id = t.id
group by pt.tag_id; 

-- 7.List the usernames of users who have posted photos along with the count of photos they have posted. Rank them by the number of photos in descending order.

select u.username, count(p.user_id) as photo_count, rank() over(order by count(p.user_id) desc ) as rk
from photos p 
join users u on p.user_id= u.id
group by p.user_id;

-- 8.Display the username of each user along with the creation date of their first posted photo and the creation date of their next posted photo.

select u.username,p.created_at as first_photo_date, lead(p.created_at) over( partition by p.user_id ) as Next_photo_date
from photos p 
join users u on p.user_id=u.id
;

-- 9.For each comment, show the comment text, the username of the commenter, and the comment text of the previous comment made on the same photo.

select c.comment_text, u.username, lead(c.comment_text) over(partition by c.user_id ) as previous_comment
from comments c 
join users u on c.user_id=u.id
order by u.username asc;

-- 10.Show the username of each user along with the number of photos they have posted and the number of photos posted by the user before them and after them, based on the creation date.
select u.username,count(p.id) as no_of_photo, lead(count(p.id)) over(order by username ) as before_them, lag(count(p.id)) over(order by username) as after_them
from photos p 
join users u on p.user_id=u.id
group by p.user_id, p.created_at
order by p.created_at;