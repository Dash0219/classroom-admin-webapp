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
    <a href="viewClassList.jsp">Back</a>
    <h2>Edit Class</h2>
    <%
    String className = request.getParameter("name");
    Classs classs = Data.searchClass(className);
    %>
    <%
    request.setAttribute("classs", classs);
    %>
    <form method="POST" action="/editClass.html">
        <div>
            <a>Class Name*:</a>
            <input type="text" name="className" value="<%=classs.getClassName()%>" required/>
        </div>
        <input type="hidden" name="originalClassName" value="<%=classs.getClassName()%>" required/>
        <input type="submit" value="Edit"/>
    </form>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>