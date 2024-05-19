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
    <%
    String studentID = request.getParameter("id");
    String className = request.getParameter("name");
    String originalClassName = request.getParameter("originalName");
    Student student = Data.searchStudent(studentID);

    Classs classs = Data.searchClass(className);
    Classs originalClass = Data.searchClass(originalClassName);

    student.setStudentClass(className);
    classs.getMembers().add(student);
    originalClass.getMembers().remove(student);
    Data.updateJSON();
    %>

    <a href="addStudentToClass.jsp?name=<%=className%>">Back</a>
    <h2>Add students to <%=className%></h2>
        <a>Student added!</a>
    <div>
        <a href="addStudentToClass.jsp?id=<%= student.getStudentID()%>&name=<%=className%>">Add another student to this class</a>
    </div>
    <div>
        <a href="viewStudentListOfClass.jsp?name=<%=className%>">View, edit and delete students from this class</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>