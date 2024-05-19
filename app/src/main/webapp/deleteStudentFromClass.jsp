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

    <%String className = (String) request.getParameter("name");
    Classs classs = Data.searchClass(className);
    String studentID = request.getParameter("id");
    Student target = Data.searchStudent(studentID);%>
    <a href="viewStudentListOfClass.jsp?name=<%=className%>">Back</a>
    <h2>Delete Student From Class</h2>
    <%
    classs.getMembers().remove(target);
    Classs notAssignedClass = Data.searchClass("NOT ASSIGNED");
    notAssignedClass.getMembers().add(target);
    target.setStudentClass("NOT ASSIGNED");
    Data.updateJSON();
    %>
    <div>
        <a>Student deleted</a>
    </div>
    <div>
        <a href="viewStudentListOfClass.jsp?name=<%=className%>">View, edit and delete students from this class</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>