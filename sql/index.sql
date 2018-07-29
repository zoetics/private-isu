-- users WHERE account_name = ? AND del_flg = 0
-- users WHERE `account_name` = ?
-- `users` WHERE `authority` = 0 AND `del_flg` = 0 ORDER BY `created_at` DESC
-- alter table users
--  add index account_name(`account_name`);
use isuconp;
alter table users
 drop index account_name,
 add index users_1(`account_name`, `del_flg`),
 add index users_2(`authority`, `del_flg`, `created_at`);

-- `comments` WHERE `user_id` = ?
-- `comments` WHERE `post_id` IN ("+placeholder+")"
-- `comments` WHERE `post_id` = ? ORDER BY `created_at` DESC
alter table comments
 add index comments_1(`user_id`),
 add index comments_2(`post_id`, `created_at`);

-- `posts` ORDER BY `created_at` DESC
-- `posts` WHERE `created_at` <= ? ORDER BY `created_at` DESC
-- `posts` WHERE `user_id` = ? ORDER BY `created_at` DESC
-- `posts` WHERE `user_id` = ?
alter table posts
 add index posts_1(`user_id`, `created_at`),
 add index posts_2(`created_at`);