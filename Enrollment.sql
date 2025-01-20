CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each enrollment
    student_id INT NOT NULL,                       -- Link to the Students table
    course_id INT NOT NULL,                        -- Link to the Courses table
    enrollment_date DATE DEFAULT CURRENT_DATE,     -- Date of enrollment
    grade VARCHAR(2),                              -- Grade obtained by the student
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);
