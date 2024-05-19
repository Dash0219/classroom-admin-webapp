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
    <%
    boolean isAddSuccessful = (boolean) request.getAttribute("isAddSuccessful");
    if (isAddSuccessful){%>
        <a>Student added!</a>
    <%}
    else {%>
        <a>Student not added due to invalid input</a>
    <%}%>
    <div>
        <a href="addStudent.jsp">Add another student</a>
    </div>
    <div>
        <a href="viewStudentList.jsp">View, edit and delete students</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>