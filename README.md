# Advanced-SQL-Queries-for-Social-Media-Analysis
This repository contains a collection of advanced SQL queries designed for analyzing social media data, specifically tailored for a social media platform similar to Instagram (referred to as ig_clone in the database). These queries are part of a project to explore complex SQL operations and their applications in real-world scenarios.

# Average User Posts

Description: This query uses AVG() to calculate the average number of posts per user. It employs GROUP BY to aggregate users and COUNT() to count their posts.

Purpose: The purpose is to understand user engagement by averaging the content creation across all users.

# Top 5 Hashtags

Description: It utilizes COUNT() to tally occurrences of each hashtag, ORDER BY to sort them, and LIMIT to restrict the output to the top 5.

Purpose: This query aims to identify trending topics and popular interests on the platform.

# Active Likers

Description: The query combines user and likes data using JOIN, groups them by user with GROUP BY, and filters using HAVING to find users who liked all photos.

Purpose: To spot highly engaged users who may influence others or serve as key platform supporters.

# User Account Rankings

Description: Uses ROW_NUMBER() to rank users based on account creation date and ORDER BY to sort these dates.

Purpose: The goal is to identify and rank early adopters and potentially influential longstanding users.

# Photo Comments Analysis

Description: Employs JOIN to merge comments with user and photo data and SELECT to choose relevant fields for analysis.

Purpose: To analyze user interactions and engagement with specific content regarding comments.

# Tag Popularity

Description: This query uses COUNT() and GROUP BY to determine the number of photos per tag, and ORDER BY to rank tags by popularity.

Purpose: To understand what themes or subjects are most engaging or popular on the platform.

# User Photo Post Count

Description: It counts the number of photos posted by each user using COUNT(), groups them by the user with GROUP BY, and orders them by post count using ORDER BY.

Purpose: To identify the most prolific content creators on the platform.

# User Photo Timeline

Description: Utilizes MIN() to find the first photo date, and LEAD() or LAG() to fetch subsequent or previous photo dates.

Purpose: To study user posting behaviour and patterns over time.

# Comment Sequence

Description: Uses LAG() to retrieve the previous comment and JOIN to connect comments with user information.

Purpose: To analyze conversation threads and interactions on individual posts.

# User Photo Posting Trends

Description: Employs COUNT() to tally user posts and a WINDOW function to compare posting trends with other users.

Purpose: To understand how users influence each other's posting behaviour and overall trends on the platform.
