CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each student
    user_id INT NOT NULL,                       -- Link to the Users table
    enrollment_no VARCHAR(20) UNIQUE NOT NULL,  -- Student's enrollment number
    department VARCHAR(50) NOT NULL,           -- Department of the student
    semester INT CHECK (semester BETWEEN 1 AND 8), -- Current semester (1-8)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    -- Timestamp of creation
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Timestamp of last update
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE -- Link to Users
);
