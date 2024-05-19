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
    <a href="menu.jsp">Back</a>
    <h2>Add Class</h2>
    <form method="POST" action="/addClass.html">
        <div>
            <a>Class Name*:</a>
            <input type="text" name="className" placeholder="Enter class name" required/>
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