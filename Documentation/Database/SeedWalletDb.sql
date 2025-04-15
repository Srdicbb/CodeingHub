-- Users Table
INSERT INTO users (id, name, email, created_at, updated_at) VALUES
(1, 'John Doe', 'john@example.com', NOW(), NOW()),
(2, 'Jane Doe', 'jane@example.com', NOW(), NOW());

-- Posts Table
INSERT INTO posts (id, user_id, title, created_at, updated_at) VALUES
(1, 1, 'First Post', NOW(), NOW()),
(2, 2, 'Another Post', NOW(), NOW());
