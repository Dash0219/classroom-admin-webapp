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
    <h2>Delete Class</h2>
    <%
    String className = request.getParameter("name");
    Classs notAssignedClass = Data.searchClass("NOT ASSIGNED");
    for (Student s : Data.searchClass(className).getMembers()){
        s.setStudentClass("NOT ASSIGNED");
        notAssignedClass.getMembers().add(s);
    }
    Data.deleteClass(className);
    Data.updateJSON();
    %>
    <div>
        <a>Class deleted</a>
    </div>
    <div>
        <a href="viewClassList.jsp">View, edit and delete classes</a>
    </div>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>