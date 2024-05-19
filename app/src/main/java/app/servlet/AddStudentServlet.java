package app.servlet;

import app.model.Data;
import app.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addStudent.html")
public class AddStudentServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String studentAge = request.getParameter("studentAge");
        String studentGender = request.getParameter("studentGender");
        String studentID = request.getParameter("studentID");
        // initialize all new students to the hidden NOT ASSIGNED classs
        String studentClass = "NOT ASSIGNED";
        String studentImageURL;
        String url = request.getParameter("studentImageURL");
        if (url == null || url.compareTo("") == 0 || url.isEmpty()){
            studentImageURL = "null";
        }
        else {
            studentImageURL = url;
        }

        Student newStudent = new Student(firstName, lastName, studentAge, studentGender, studentID, studentClass, studentImageURL);
        boolean isAddSuccessful = Data.studentSafeAdd(newStudent);
        if (isAddSuccessful){
            Data.searchClass("NOT ASSIGNED").getMembers().add(newStudent);
        }
        request.setAttribute("isAddSuccessful", isAddSuccessful);
        Data.updateJSON();

        // Invoke the JSP page.
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/addStudentResult.jsp");
        dispatch.forward(request, response);
    }
}
