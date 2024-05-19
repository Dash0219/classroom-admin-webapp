<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>School Administration App</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<h2>Menu</h2>
<hr>
<img src="assets/class.png" style="max-height: 50px;" align="left">
    <h2>Manage Classes</h2>
    <nav>
        <ul>
            <li>
                <a href="viewClassList.jsp">View, edit and delete classes</a>
            </li>
            <li>
                <a href="addClass.jsp">Add class</a>
            </li>
        </ul>
    </nav>
<hr>
<img src="assets/student.png" style="max-height: 50px;" align="left">
    <h2>Manage Students</h2>
    <nav>
        <ul>
            <li>
                <a href="viewStudentList.jsp">View, edit and delete students</a>
            </li>
            <li>
                <a href="addStudent.jsp">Add student</a>
            </li>
        </ul>
    </nav>
<jsp:include page="/footer.jsp"/>
</body>
</html>