CREATE TABLE contact_categories(
id SERIAL PRIMARY KEY,
contact_category varchar(30) NOT NULL
);

CREATE TABLE contact_types(
id SERIAL PRIMARY KEY,
contact_type varchar(30) NOT NULL
);

CREATE TABLE contacts(
id SERIAL PRIMARY KEY,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
title varchar(40),
organization varchar(50)
);

CREATE TABLE items(
id SERIAL PRIMARY KEY,
contact varchar(30),
contact_id INTEGER,
contact_type_id INTEGER,
contact_category_id INTEGER,
FOREIGN KEY (contact_id) REFERENCES contacts(id),
FOREIGN KEY (contact_type_id) REFERENCES contact_types(id),
FOREIGN KEY (contact_category_id) REFERENCES contact_categories(id)
);

-- 1.4
INSERT INTO contacts (first_name,last_name,title,organization)
VALUES ('Erik', 'Eriksson','Teacher','Utbildning AB'),
('Anna', 'Sundh',NULL,NULL),
('Goran', 'Dregovic','Coach','Dalens IK'),
('Ann-Marie','Bergqvist','Cousin',NULL),
('Herman', 'Appelkvist',NULL,NULL)
;

INSERT INTO contact_categories (contact_category)
VALUES ('Home'),('Work'),('Fax')
;

INSERT INTO contact_types (contact_type)
VALUES ('Email'),('Phone'),('Skype'),('Instagram')
;

INSERT INTO items (contact,contact_id,contact_type_id,contact_category_id)
VALUES ('011-12 33 45',3,2,1),
('goran@infoab.se',3,1,2),
('010-88 55 44',4,2,2),
('erik57@hotmail.com',1,1,1),
('@annapanna99',2,4,1),
('077-563578',2,2,1),
('070-156 22 78',3,2,2)
;

--1.5
INSERT INTO contacts (first_name,last_name,title,organization)
VALUES ('Mats', 'Sundin','Captain','Toronto Maple Leafs'),
('Robert', 'Johansson','Student','AW')
;

--1.6
SELECT contact_types.contact_type
FROM contact_types
WHERE contact_types.id NOT IN (
    SELECT DISTINCT items.contact_type_id
    FROM items
    WHERE items.contact_type_id IS NOT NULL
);

--1.7
CREATE VIEW V AS
    SELECT first_name, last_name,contact,contact_type,contact_category
    FROM (((contacts NATURAL FULL OUTER JOIN contact_types)
    NATURAL FULL OUTER JOIN contact_categories)
	NATURAL FULL OUTER JOIN items);
	
--1.8
SELECT contacts.first_name,
contacts.last_name,
contacts.title,
contacts.organization,
items.contact,
items.contact_id,
items.contact_type_id,
items.contact_category_id,
contact_types.contact_type,
contact_categories.contact_category
FROM contacts
JOIN items ON items.contact_id = contacts.id
JOIN contact_types ON items.contact_type_id = contact_types.id
JOIN contact_categories ON items.contact_category_id = contact_categories.id


















































































































