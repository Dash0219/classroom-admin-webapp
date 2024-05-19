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

@WebServlet("/editStudent.html")
public class EditStudentServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String studentAge = request.getParameter("studentAge");
        String studentGender = request.getParameter("studentGender");
        String studentID = request.getParameter("studentID");
        String studentClass = request.getParameter("studentClass");
        String studentImageURL;
        String url = request.getParameter("studentImageURL");
        if (url == null || url.compareTo("") == 0 || url.isEmpty()){
            studentImageURL = "null";
        }
        else {
            studentImageURL = url;
        }
        String originalStudentID = request.getParameter("originalStudentID");
        Student target = Data.searchStudent(originalStudentID);

        boolean isEditSuccessful = true;
        if (originalStudentID.compareTo(studentID) != 0){
            for (Student s : Data.students){
                if (s.getStudentID().compareTo(studentID) == 0){
                    isEditSuccessful = false;
                    break;
                }
            }
        }
        if (isEditSuccessful){
            target.setFirstName(firstName);
            target.setLastName(lastName);
            target.setStudentAge(studentAge);
            target.setStudentGender(studentGender);
            target.setStudentID(studentID);
            target.setStudentClass(studentClass);
            target.setStudentImageURL(studentImageURL);
            Data.updateJSON();
        }
        request.setAttribute("isEditSuccessful", isEditSuccessful);

        // Invoke the JSP page.
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/editStudentResult.jsp");
        dispatch.forward(request, response);
    }
}
