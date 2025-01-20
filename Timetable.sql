CREATE TABLE Timetable (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for each schedule
    course_id INT NOT NULL,                       -- Link to the Courses table
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    start_time TIME NOT NULL,                     -- Class start time
    end_time TIME NOT NULL,                       -- Class end time
    room_number VARCHAR(20),                      -- Room where the class is held
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);
