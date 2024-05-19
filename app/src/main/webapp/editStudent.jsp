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
    <a href="viewStudentList.jsp">Back</a>
    <h2>Edit Student</h2>
    <%
    String studentID = request.getParameter("id");

    Student student = Data.searchStudent(studentID);
    %>
    <%
    request.setAttribute("student", student);
    %>
    <form method="POST" action="/editStudent.html">
        <div>
            <a>First Name*:</a>
            <input type="text" name="firstName" value="<%=student.getFirstName()%>" required/>
        </div>
        <div>
            <a>Last Name*:</a>
            <input type="text" name="lastName" value="<%=student.getLastName()%>" required/>
        </div>
        <div>
            <a>Age*:</a>
            <input type="number" name="studentAge" value="<%=student.getStudentAge()%>" required min="0"/>
        </div>
        <div>
            <a>Gender:</a>
            <select name="studentGender" required>
                <option value="Male" <% if(student.getStudentGender().compareTo("Male") == 0) { %> selected <% } %> >Male</option>
                <option value="Female" <% if(student.getStudentGender().compareTo("Female") == 0) { %> selected <% } %> >Female</option>
                <option value="Other" <% if(student.getStudentGender().compareTo("Other") == 0) { %> selected <% } %> >Other</option>
            </select>
        </div>
        <div>
            <a>Student ID*:</a>
            <input type="text" name="studentID" value="<%=student.getStudentID()%>" required/>
        </div>
        <div>
            <a>Image URL (in JPG, PNG, GIF or WEBP):</a>
            <input type="text" name="studentImageURL" value="<%=student.getStudentImageURL()%>"/>
        </div>
        <div>
            <a>(fields marked with a * are mandatory)</a>
        </div>
        <input type="hidden" name="studentClass" value="<%=student.getStudentClass()%>" required/>
        <input type="hidden" name="originalStudentID" value="<%=student.getStudentID()%>" required/>
        <input type="submit" value="Edit"/>
    </form>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>