USE [Day 1];

-- ==========================================
-- SQL Learning Journey
-- Day 1 & Day 2
-- Topics: DDL, DML, DQL
-- ==========================================


-- ==========================================
-- DDL Queries
-- ==========================================

-- Create Table

CREATE TABLE emplo
(
    eid INT,
    ename VARCHAR(20),
    eage INT,
    eadd VARCHAR(20),
    hiring_date DATE,
    DEPNUM INT
);

SELECT * FROM emplo;


-- ==========================================
-- ALTER TABLE
-- ==========================================

-- Add Column

ALTER TABLE emplo
ADD salary INT;

SELECT * FROM emplo;


-- Drop Column

ALTER TABLE emplo
DROP COLUMN salary;

SELECT * FROM emplo;


-- Change Data Type

ALTER TABLE emplo
ALTER COLUMN salary BIGINT;

SELECT * FROM emplo;


-- Drop Table
-- DROP TABLE emplo;


-- ==========================================
-- DML Queries
-- INSERT - UPDATE - DELETE
-- ==========================================

-- INSERT

INSERT INTO emplo
VALUES (1, 'ali', 10, 'alex', '2020-01-01', 2, 2000);

SELECT * FROM emplo;


-- INSERT with specific columns

INSERT INTO emplo (ename, eid)
VALUES ('eman', 22);

INSERT INTO emplo (ename, eid)
VALUES ('enas', 23);

SELECT * FROM emplo;


-- Insert multiple rows

INSERT INTO emplo (ename, eid)
VALUES
    ('ali', 25),
    ('ahmed', 26),
    ('mira', 27);

SELECT * FROM emplo;


-- UPDATE

UPDATE emplo
SET ename = 'omar'
WHERE eid = 1;

SELECT * FROM emplo;


-- DELETE
-- DELETE FROM emplo WHERE eid = 1;


-- ==========================================
-- DQL Queries
-- ==========================================

SELECT * FROM emplo;

SELECT eid, ename, eage
FROM emplo
WHERE eid >= 22;


-- ==========================================
-- CONCAT Columns
-- ==========================================

SELECT ename + ' ' + eadd
FROM emplo;


-- ==========================================
-- FILTER
-- ==========================================

SELECT *
FROM emplo
WHERE eadd IS NOT NULL;


-- DISTINCT
-- Get unique names

SELECT DISTINCT ename
FROM emplo;


SELECT *
FROM emplo
WHERE eadd = 'alex';


SELECT *
FROM emplo
WHERE eid > 25;

-- ==========================================
-- What I Learned
-- ==========================================

-- 1. DDL is used to define/change database structure.
-- 2. DML is used to manipulate data.
-- 3. DQL is used to retrieve data.
-- 4. WHERE helps filter specific rows.
-- 5. DISTINCT returns unique values.
