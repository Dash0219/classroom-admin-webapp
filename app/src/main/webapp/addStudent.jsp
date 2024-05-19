<%@ page import="java.util.ArrayList" %>
<%@ page import="app.model.Data" %>
<%@ page import="app.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>School Administration App</title>
</head>
<body>  
<jsp:include page="/meta.jsp"/>
<jsp:include page="/header.jsp"/>
<div class="main">
    <a href="menu.jsp">Back</a>
    <h2>Add Student</h2>
    <form method="POST" action="/addStudent.html">
        <div>
            <a>First Name*:</a>
            <input type="text" name="firstName" placeholder="Enter first name" required/>
        </div>
        <div>
            <a>Last Name*:</a>
            <input type="text" name="lastName" placeholder="Enter last name" required/>
        </div>
        <div>
            <a>Age*:</a>
            <input type="number" name="studentAge" placeholder="Enter age" required min="0"/>
        </div>
        <div>
            <a>Gender:</a>
            <select name="studentGender" required>
                <option value="" disabled selected>--select option--</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        
        
        <div>
            <a>Student ID*:</a>
            <input type="text" name="studentID" placeholder="Enter student ID" required/>
        </div>
        <div>
            <a>Image URL (in JPG, PNG, GIF or WEBP):</a>
            <input type="text" name="studentImageURL" placeholder="Enter URL"/>
        </div>
        <div>
            <a>(fields marked with a * are mandatory)</a>
        </div>
        <input type="submit" value="Add"/>
    </form>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>