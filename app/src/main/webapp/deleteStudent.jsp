<%@ page import="java.util.ArrayList" %>
<%@ page import="app.model.Data" %>
<%@ page import="app.model.Student" %>
<%@ page import="app.model.Classs" %>
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
    <h2>Delete Student</h2>
    <%
    String studentID = request.getParameter("id");
    Student student = Data.searchStudent(studentID);
    Classs classs = Data.searchClass(student.getStudentClass());

    Data.students.remove(student);
    classs.getMembers().remove(student);
    Data.updateJSON();
    %>
    <div>
        <a>Student deleted</a>
    </div>
    <div>
        <a href="viewStudentList.jsp">View, edit and delete students</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>