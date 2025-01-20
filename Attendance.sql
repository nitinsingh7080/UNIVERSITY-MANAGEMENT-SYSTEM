CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each record
    student_id INT NOT NULL,                      -- Link to the Students table
    course_id INT NOT NULL,                       -- Link to the Courses table
    attendance_date DATE NOT NULL,                -- Date of attendance
    status ENUM('present', 'absent', 'late') NOT NULL,  -- Attendance status
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);
