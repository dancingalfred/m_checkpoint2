CREATE TABLE dictionary(
id SERIAL PRIMARY KEY,
word varchar(30) NOT NULL,
translation varchar(49) NOT NULL
);

INSERT INTO dictionary (word, translation)
VALUES ('Hello','Hej')
;

SELECT * 
FROM dictionary