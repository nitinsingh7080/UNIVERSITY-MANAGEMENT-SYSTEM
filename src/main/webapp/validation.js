// University Management System

// Arrays to store data
const students = [];
const courses = [];
const faculty = [];

// Add a student
function addStudent(name, id, course) {
    students.push({ name, id, course });
    displayMessage(`Student ${name} added successfully.`);
}

// Add a course
function addCourse(courseName, courseCode) {
    courses.push({ courseName, courseCode });
    displayMessage(`Course ${courseName} added successfully.`);
}

// Add a faculty member
function addFaculty(name, department) {
    faculty.push({ name, department });
    displayMessage(`Faculty ${name} added successfully.`);
}

// Display students
function displayStudents() {
    const studentList = students.map((s, index) => `${index + 1}. ${s.name} (ID: ${s.id}, Course: ${s.course})`).join("\n");
    alert("Students:\n" + (studentList || "No students available."));
}

// Display courses
function displayCourses() {
    const courseList = courses.map((c, index) => `${index + 1}. ${c.courseName} (Code: ${c.courseCode})`).join("\n");
    alert("Courses:\n" + (courseList || "No courses available."));
}

// Display faculty
function displayFaculty() {
    const facultyList = faculty.map((f, index) => `${index + 1}. ${f.name} (Department: ${f.department})`).join("\n");
    alert("Faculty:\n" + (facultyList || "No faculty available."));
}

// Utility function to display messages
function displayMessage(message) {
    const messageBox = document.getElementById("message");
    messageBox.innerText = message;
    setTimeout(() => (messageBox.innerText = ""), 3000);
}

// Event listeners for form actions
document.getElementById("addStudentForm").addEventListener("submit", function (e) {
    e.preventDefault();
    const name = document.getElementById("studentName").value;
    const id = document.getElementById("studentId").value;
    const course = document.getElementById("studentCourse").value;
    addStudent(name, id, course);
    this.reset();
});

document.getElementById("addCourseForm").addEventListener("submit", function (e) {
    e.preventDefault();
    const courseName = document.getElementById("courseName").value;
    const courseCode = document.getElementById("courseCode").value;
    addCourse(courseName, courseCode);
    this.reset();
});

document.getElementById("addFacultyForm").addEventListener("submit", function (e) {
    e.preventDefault();
    const name = document.getElementById("facultyName").value;
    const department = document.getElementById("facultyDepartment").value;
    addFaculty(name, department);
    this.reset();
});
