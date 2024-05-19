<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Object" %>
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
  <h2>View, edit and delete students</h2>
  <div>
    <a href="viewStudentList.jsp">View all students</a>
  </div>

  <form method="POST" action="/filterStudent.html">
    <div>
        <a>Search for:</a>
        <select name="type" required>
            <option value="" disabled selected>--select option--</option>
            <option value="firstName">First Name</option>
            <option value="lastName">Last Name</option>
            <option value="studentAge">Age</option>
            <option value="studentGender">Gender</option>
            <option value="studentID">Student ID</option>
            <option value="studentClass">Class</option>
            <option value="studentImageURL">Image URL</option>
        </select>
    </div>
    <div>
    <input type="text" name="keyword" placeholder="Enter search keyword here"/ required>
    <input type="hidden" name="action" value="searchStudent" required/>
    <input type="submit" value="Search"/>
    </div>
  </form>
  <%
  ArrayList<Student> display = Data.students;
  if (request.getAttribute("viewFilteredList") != null){
    display = (ArrayList<Student>) request.getAttribute("filteredList");
  }
  
    if (display != null) { 
        for (Student student : display) {
            %>
            <hr>
            <div>
                <a><%=student.getFirstName() + " " + student.getLastName()%></a>
                <% 
                String url = student.getStudentImageURL();
                if (url.compareTo("null") == 0) { 
                url = "/assets/noImageAvailable.jpg";
                } %>
                <img src="<%=url%>" style="max-width: 215px;" height="215" align="right">
            </div>
    <ul>
        <div>
            <a><%="Age: " + student.getStudentAge()%></a>
        </div>
        <div>
            <a><%="Gender: " + student.getStudentGender()%></a>
        </div>
        <div>
            <a><%="Student ID: " + student.getStudentID()%></a>
        </div>
        <div>
            <a><%="Class: " + student.getStudentClass()%></a>
        </div>
        <div>
            <a href="editStudent.jsp?id=<%= student.getStudentID() %>">Edit</a>
        </div>
        <br>
        <div>
            <a href="deleteStudent.jsp?id=<%= student.getStudentID() %>">Delete</a>
        </div>
        </ul>
        <% } 
    } else {
    %>
        <p>There are no students to show</p>
        <a href="addStudent.jsp">Add student</a>
    <% } %>
    <hr>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>
