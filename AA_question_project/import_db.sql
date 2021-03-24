PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS users;

CREATE TABLE users ( 
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions ( 
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    associated_author_id INTEGER,
    FOREIGN KEY(associated_author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows ( 
    id INTEGER PRIMARY KEY 
    question_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies ( 
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_reply_id INTEGER NOT NULL,
    parent_reply_id INTEGER, 
    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(user_reply_id) REFERENCES users(id),
    FOREIGN KEY(parent_reply_id) REFERENCES replies(id),
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes ( 
    id INTEGER PRIMARY KEY,
    liked_question_id INTEGER NOT NULL,
    liked_users_id INTEGER NOT NULL,
    FOREIGN KEY(liked_question_id) REFERENCES questions(id),
    FOREIGN KEY(liked_users_id) REFERENCES users(id)
);

INSERT INTO 
    users (id, fname, lname)
VALUES 
    (1, 'Beyonce', 'Knowles')

INSERT INTO 
    questions (id, title, body, associated_author_id)
VALUES 
    (1, 'Beyonce Question', 'Where''s Jay-Z', 1)

INSERT INTO 
    quesiton_follows (id, question_id, users_id)
VALUES 
    (1, 1, 1)

INSERT INTO 
    replies (id, quesiton_id, user_reply_id, parent_reply_id)
VALUES 
    (1, 1, 1)

INSERT INTO 
    quesiton_likes (id, liked_quesiton_id, liked_user_id)
VALUES 
    (1, 1, 1)