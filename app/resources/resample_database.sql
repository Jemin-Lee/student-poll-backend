INSERT INTO University (university_id, name, abbreviation, city, country, logo_filename)
VALUES (1, 'University of Canterbury', 'UC', 'Christchurch', 'New Zealand', 'UC.jpg');

INSERT INTO Subject (subject_id, name, university_id)
VALUES (1, 'Computer Science', 1),
       (2, 'Software Engineering', 1),
       (3, 'Information Systems', 1),
       (4, 'Data Science', 1),
       (5, 'Accounting', 1),
       (6, 'Psychology', 1);

INSERT INTO Course (course_id, code, title, subject_id)
VALUES (1, 'COSC121', 'Introduction to Computer Programming', 1),
       (2, 'COSC101', 'Working in a Digital World', 1),
       (3, 'COSC122', 'Introduction to Computer Science', 1);
