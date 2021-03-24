CREATE TABLE users ( 
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,

);

CREATE TABLE questions ( 
    title TEXT NOT NULL,
    body TEXT,
    associated_author_id INTEGER
    FOREIGN KEY(associated_author_id) REFERENCES users(id)
    
);


CREATE TABLE question_follows ( 
    
);

CREATE TABLE replies ( 
    id INTEGER PRIMARY KEY
    question INTEGER NOT NULL
    user_reply INTEGER NOT NULL
    parent_reply INTEGER 
    FOREIGN KEY(question) REFERENCES questions(associated_author_id)
    FOREIGN KEY(user_reply) REFERENCES users(id)
    FOREIGN KEY(parent_reply) REFERENCES replies(id)

)

CREATE TABLE replies ( 
    reply INTEGER 
    FOREIGN KEY(reply) REFERENCES questions(associated_author_id)
    sub_reply INTEGER
    FOREIGN KEY(sub_reply) REFERENCES replies(reply)

)




CREATE TABLE question_likes ( 
    
)