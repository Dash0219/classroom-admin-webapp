<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Object" %>
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
  <h2>View, edit and delete Classes</h2>
  <div>
    <a href="viewClassList.jsp">View all Classes</a>
  </div>

  <form method="POST" action="/filterClass.html">
    <div>
        <a>Search for class name:</a>
    </div>
    <div>
    <input type="text" name="keyword" placeholder="Enter search keyword here"/ required>
    <input type="submit" value="Search"/>
    </div>
  </form>
  <%
  ArrayList<Classs> display = (ArrayList<Classs>) Data.classes.clone();
  Classs notAssignedClass = Data.searchClass("NOT ASSIGNED");
  display.remove(notAssignedClass);
  if (request.getAttribute("viewFilteredList") != null){
    ArrayList<Classs> list = (ArrayList<Classs>) request.getAttribute("filteredList");
    if (list.get(0).getClassName().compareTo("NOT ASSIGNED") == 0){
        display = null;
    }
    else{
        display = list;
    }
  }
  
    if (display != null) { 
        for (Classs classs : display) {
            String className = classs.getClassName();%>
        <hr>
        <div>
            <a><%=className%></a>
        </div>
    <ul>
        <div>
            <a href="viewStudentListOfClass.jsp?name=<%=className%>">Manage students in this class</a>
        </div>
        <div>
            <a href="editClass.jsp?name=<%=className%>">Edit class name</a>
        </div>
        <br>
        <div>
            <a href="deleteClass.jsp?name=<%=className%>">Delete</a>
        </div>
        </ul>
        <% } 
    } else {
    %>
        <p>There are no classes to show</p>
        <a href="addClass.jsp">Add class</a>
    <% } %>
    <hr>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>
