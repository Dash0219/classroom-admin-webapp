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
    <h2>Add Class</h2>
    <%
    boolean isAddSuccessful = (boolean) request.getAttribute("isAddSuccessful");
    if (isAddSuccessful){%>
        <a>Class added!</a>
    <%}
    else {%>
        <a>Class not added due to invalid input</a>
    <%}%>
    <div>
        <a href="addClass.jsp">Add another class</a>
    </div>
    <div>
        <a href="viewClassList.jsp">View, edit and delete classes</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>