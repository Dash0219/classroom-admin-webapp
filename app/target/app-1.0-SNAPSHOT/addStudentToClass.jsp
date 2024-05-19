<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Object" %>
<%@ page import="app.model.*" %>
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
            <%String className = (String) request.getParameter("name");%>
            <a href="viewStudentListOfClass.jsp?name=<%=className%>">Back</a>
            <h2>Add students to <%=className%></h2>
  
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
            <input type="text" name="keyword" placeholder="Enter search keyword here" required/>
            <input type="hidden" name="action" value="searchStudentWhenAddingToClass" required/>
            <input type="hidden" name="className" value=<%=className%> required/>
            <input type="submit" value="Search"/>
        </div>
    </form>
    <%
    
    ArrayList<Student> display = new ArrayList<>();
        for (Classs c : Data.classes){
            if (c.getClassName().compareTo(className) != 0){
                display.addAll(c.getMembers());
            }
        }
            
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
            <%String thisStudentClassName = student.getStudentClass();%>
            <a><%="Class: " + thisStudentClassName%></a>
        </div>
        <br>
        <br>

        <div>
            <a href="addStudentToClassResult.jsp?id=<%= student.getStudentID()%>&name=<%=className%>&originalName=<%=thisStudentClassName%>">Add to this class</a>
        </div>
        </ul>
        <% } 
    } else {
    %>
        <p>There are no students to show</p>
        <% } %>
    <hr>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>
