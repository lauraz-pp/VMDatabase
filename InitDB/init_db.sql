-- Check if the database exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = N'MyDatabase')
BEGIN
    -- Prepare to drop the database
    ALTER DATABASE MyDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    -- Drop the database if it exists
    DROP DATABASE MyDatabase;
END


-- Create the database
CREATE DATABASE MyDatabase;
GO

-- Switch to the new database context
USE MyDatabase;
GO

-- Create a tables
CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT
);
GO

-- Insert Student data
BULK INSERT Students FROM '/usr/src/app/Student.csv'
WITH
(
    FIELDTERMINATOR = ',',  -- Specify your CSV delimiter
    ROWTERMINATOR = '\n',   -- Specify your row terminator
    FIRSTROW = 2            -- If your CSV file includes a header row
);
Go