# MySQL scripts for dropping existing tables and recreating the database table structure


### DROP EVERYTHING ###
# Tables/views must be dropped in reverse order due to referential constraints (foreign keys).
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Subject;
DROP TABLE IF EXISTS University;

### TABLES ###
# Tables must be created in a particular order due to referential constraints i.e. foreign keys.
CREATE TABLE University
(
    university_id  INT(11) NOT NULL AUTO_INCREMENT,
    name           VARCHAR(256) NOT NULL,
    abbreviation   VARCHAR(256) NOT NULL,
    city           VARCHAR(256),
    country        VARCHAR(256) NOT NULL,
    logo_filename  VARCHAR(64),
    PRIMARY KEY (university_id)
);

CREATE TABLE Subject
(
    subject_id     INT(11) NOT NULL AUTO_INCREMENT,
    name           VARCHAR(256) NOT NULL,
    university_id  INT(11) NOT NULL,
    PRIMARY KEY (subject_id),
    FOREIGN KEY (university_id) REFERENCES University (university_id)
);

CREATE TABLE Course
(
    course_id           INT(11) NOT NULL AUTO_INCREMENT,
    code                VARCHAR(7) NOT NULL,
    title               VARCHAR(128) NOT NULL,
    subject_id          INT(11) NOT NULL,
    PRIMARY KEY (course_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id)
);

CREATE TABLE User
(
    user_id        INT(11)      NOT NULL AUTO_INCREMENT,
    username       VARCHAR(128) NOT NULL,
    name           VARCHAR(128),
    email          VARCHAR(128) NOT NULL,
    password       VARCHAR(256) NOT NULL,
    auth_token     VARCHAR(32),
    city           VARCHAR(128),
    country        VARCHAR(128),
    photo_filename VARCHAR(64),
    university_id  INT(11),
    subject_id     INT(11),
    PRIMARY KEY (user_id),
    UNIQUE (name),
    UNIQUE (email),
    UNIQUE (auth_token),
    FOREIGN KEY (university_id) REFERENCES University (university_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id)
);

CREATE TABLE Review
(
    review_id           INT(11) NOT NULL AUTO_INCREMENT,
    user_id             INT(11) NOT NULL,
    course_id           INT(11) NOT NULL,
    lecture_quality     INT(1) NOT NULL,
    course_organisation INT(1) NOT NULL,
    course_relevance    INT(1) NOT NULL,
    student_engagement  INT(1) NOT NULL,
    overall_rating      float NOT NULL,
    PRIMARY KEY (review_id),
    FOREIGN KEY (user_id) REFERENCES User (user_id),
    FOREIGN KEY (course_id) REFERENCES Course (course_id)
);
