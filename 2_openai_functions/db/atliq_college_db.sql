##### Schema creation #####

CREATE TABLE marks (
    student_name VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    gpa DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (student_name, semester)
);

CREATE TABLE fees (
    student_name VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    total_fees DECIMAL(10,2) NOT NULL,
    paid DECIMAL(10,2) NOT NULL,
    pending DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (student_name, semester)
);

##### Insert records #####

INSERT INTO marks (student_name, semester, gpa)
VALUES
('Wanda Mishra', 1, 3.5),
('Lauki Lal', 1, 3.6),
('Peter Pandey', 1, 3.7),
('Thor Hathodawala', 1, 3.8),
('Virat Kohli', 1, 3.9),

('Sachin Tendulkar', 2, 3.2),
('Tom Cruise', 2, 3.3),
('Robert Downey', 2, 3.4),
('Steve Jobs', 2, 3.1),
('Bill Gates', 2, 3.0),

('Elon Musk', 3, 2.7),
('Tim Cook', 3, 2.6),
('Jeff Bezos', 3, 2.5),
('Mark Zuckerberg', 3, 2.8),
('Larry Page', 3, 2.9),

('Sergey Brin', 4, 3.1),
('Satya Nadella', 4, 3.2),
('Jack Ma', 4, 3.3),
('Sundar Pichai', 4, 3.4),
('Michael Dell', 4, 3.5);

INSERT INTO fees (student_name, semester, total_fees, paid, pending)
VALUES
('Wanda Mishra', 1, 5000, 2000, 3000),
('Lauki Lal', 1, 5000, 2500, 2500),
('Peter Pandey', 1, 5000, 3000, 2000),
('Thor Hathodawala', 1, 5000, 3500, 1500),
('Virat Kohli', 1, 5000, 4000, 1000),

('Sachin Tendulkar', 2, 6000, 2000, 4000),
('Tom Cruise', 2, 6000, 3000, 3000),
('Robert Downey', 2, 6000, 4000, 2000),
('Steve Jobs', 2, 6000, 5000, 1000),
('Bill Gates', 2, 6000, 6000, 0),

('Elon Musk', 3, 7000, 2000, 5000),
('Tim Cook', 3, 7000, 3000, 4000),
('Jeff Bezos', 3, 7000, 4000, 3000),
('Mark Zuckerberg', 3, 7000, 5000, 2000),
('Larry Page', 3, 7000, 6000, 1000),

('Sergey Brin', 4, 8000, 2000, 6000),
('Satya Nadella', 4, 8000, 3000, 5000),
('Jack Ma', 4, 8000, 4000, 4000),
('Sundar Pichai', 4, 8000, 5000, 3000),
('Michael Dell', 4, 8000, 6000, 2000);

### stored procedure ####

DELIMITER $$
CREATE PROCEDURE get_marks (IN student_name VARCHAR(100), IN semester INT, IN operation VARCHAR(10))
BEGIN
    DECLARE result DECIMAL(3,2);

    IF student_name <> '' THEN
        SELECT gpa INTO result
        FROM marks
        WHERE LOWER(marks.student_name) = LOWER(student_name) AND marks.semester = semester;
    ELSEIF operation = 'max' THEN
        SELECT MAX(gpa) INTO result
        FROM marks
        WHERE marks.semester = semester;
    ELSEIF operation = 'min' THEN
        SELECT MIN(gpa) INTO result
        FROM marks
        WHERE marks.semester = semester;
    ELSEIF operation = 'avg' THEN
        SELECT AVG(gpa) INTO result
        FROM marks
        WHERE marks.semester = semester;
    END IF;

    -- Handling when no records are found
    IF result IS NULL THEN
        SET result = -1;
    END IF;

    SELECT result AS GPA;
END$$
DELIMITER ;

### Stored procedure for fees ### 
DELIMITER $$
CREATE PROCEDURE get_fees (IN student_name VARCHAR(100), IN semester INT, IN fees_type VARCHAR(10))
BEGIN
    DECLARE result INT;

    IF student_name <> '' THEN
        IF fees_type = 'paid' THEN
            SELECT paid INTO result
            FROM fees
            WHERE LOWER(fees.student_name) = LOWER(student_name) AND fees.semester = semester;
        ELSEIF fees_type = 'pending' THEN
            SELECT pending INTO result
            FROM fees
            WHERE LOWER(fees.student_name) = LOWER(student_name) AND fees.semester = semester;
        ELSEIF fees_type = 'total' THEN
            SELECT total_fees INTO result
            FROM fees
            WHERE LOWER(fees.student_name) = LOWER(student_name) AND fees.semester = semester;
        END IF;
    ELSE
        IF fees_type = 'paid' THEN
            SELECT SUM(paid) INTO result
            FROM fees
            WHERE fees.semester = semester;
        ELSEIF fees_type = 'pending' THEN
            SELECT SUM(pending) INTO result
            FROM fees
            WHERE fees.semester = semester;
        ELSEIF fees_type = 'total' THEN
            SELECT SUM(total_fees) INTO result
            FROM fees
            WHERE fees.semester = semester;
        END IF;
    END IF;

    -- Handling when no records are found
    IF result IS NULL THEN
        SET result = -1;
    END IF;

    SELECT result AS Fees;
END$$
DELIMITER ;

