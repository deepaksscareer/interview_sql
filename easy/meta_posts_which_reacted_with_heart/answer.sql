
SELECT post.*
FROM facebook_posts post
JOIN facebook_reactions rec
ON post.post_id = rec.post_id
AND rec.reaction = 'heart'

/*
DROP TABLE facebook_reactions;
DROP TABLE facebook_posts;
*/