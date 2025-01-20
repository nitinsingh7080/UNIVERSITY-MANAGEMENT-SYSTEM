CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Unique identifier for each user
    name VARCHAR(50) NOT NULL,                  -- User's full name
    email VARCHAR(50) NOT NULL UNIQUE,          -- Email address (must be unique)
    password VARCHAR(255) NOT NULL,             -- Encrypted password
    role ENUM('admin', 'faculty', 'student') NOT NULL,  -- Role of the user
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     -- Timestamp of creation
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- Timestamp of last update
);
