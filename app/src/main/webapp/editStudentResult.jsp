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
    <h2>Edit Student</h2>
    <%
    boolean isEditSuccessful = (boolean) request.getAttribute("isEditSuccessful");
    if (isEditSuccessful){%>
        <a>Student Edited!</a>
    <%}
    else {%>
        <a>Student not edited due to invalid input</a>
    <%}%>
    <div>
        <a href="viewStudentList.jsp">View, edit and delete students</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>