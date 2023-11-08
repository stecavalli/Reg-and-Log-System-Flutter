CREATE TABLE users (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(45) NOT NULL,
    lastname varchar(45) NOT NULL,
    mail varchar(45) NOT NULL,
    username varchar(45) NOT NULL,
	password varchar(255) NOT NULL,
	active char(1) NOT NULL DEFAULT '0'
);

CREATE TABLE users_activation (
    username varchar(45) PRIMARY KEY NOT NULL,
	token varchar(255) NOT NULL,
	created_at Date NOT NULL
);