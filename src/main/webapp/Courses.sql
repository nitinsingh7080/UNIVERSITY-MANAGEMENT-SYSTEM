CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for each course
    name VARCHAR(50) NOT NULL,                  -- Course name
    credits INT NOT NULL,                       -- Number of credits for the course
    faculty_id INT,                             -- Faculty responsible for the course
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     -- Timestamp of creation
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Timestamp of last update
    FOREIGN KEY (faculty_id) REFERENCES Users(id) ON DELETE SET NULL ON UPDATE CASCADE -- Link to faculty in Users
);
