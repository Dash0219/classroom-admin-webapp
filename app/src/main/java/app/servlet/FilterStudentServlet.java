package app.servlet;

import app.model.Data;
import app.model.Student;
import app.model.Classs;

import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/filterStudent.html")
public class FilterStudentServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String type = (String) request.getParameter("type");
        String keyword = (String) request.getParameter("keyword");
        String action = (String) request.getParameter("action");
        String className = (String) request.getParameter("className");
        
        ServletContext context = getServletContext();

        if (action.compareTo("searchStudent") == 0){
            ArrayList<Student> filtered = Data.filteredStudentList(type, keyword, Data.students);
            request.setAttribute("viewFilteredList", true);
            request.setAttribute("filteredList", filtered);
            // request.setAttribute("from", "searchInAllStudents");
            RequestDispatcher dispatch = context.getRequestDispatcher("/viewStudentList.jsp");
            dispatch.forward(request, response);
        }
        else if (action.compareTo("searchStudentInOneClass") == 0){
            ArrayList<Student> studentsOfOneClass = Data.filteredStudentList("studentClass", className, Data.students);
            ArrayList<Student> filtered = Data.filteredStudentList(type, keyword, studentsOfOneClass);
            request.setAttribute("viewFilteredList", true);
            request.setAttribute("filteredList", filtered);
            request.setAttribute("name", className);
            // request.setAttribute("from", "searchInClass");
            String url = request.getContextPath() + "/viewStudentListOfClass.jsp?name=" + className;

            RequestDispatcher dispatch = context.getRequestDispatcher(url);
            dispatch.forward(request, response);
        }
        else if (action.compareTo("searchStudentWhenAddingToClass") == 0){
            // String originalClassName = (String) request.getParameter("originalClassName");
            ArrayList<Student> studentsNotInThisClass = new ArrayList<>();
            for (Classs c : Data.classes){
                if (c.getClassName().compareTo(className) != 0){
                    studentsNotInThisClass.addAll(c.getMembers());
                }
            }
            ArrayList<Student> filtered = Data.filteredStudentList(type, keyword, studentsNotInThisClass);
            request.setAttribute("viewFilteredList", true);
            request.setAttribute("filteredList", filtered);
            request.setAttribute("name", className);
            String url = request.getContextPath() + "/addStudentToClass.jsp?name=" + className;

            RequestDispatcher dispatch = context.getRequestDispatcher(url);
            dispatch.forward(request, response);
        }
    }
}
