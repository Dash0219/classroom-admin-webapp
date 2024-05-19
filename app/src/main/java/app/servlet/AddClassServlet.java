package app.servlet;

import app.model.Classs;
import app.model.Data;
import app.model.Student;

import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addClass.html")
public class AddClassServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String className = request.getParameter("className");
        ArrayList<Student> members = new ArrayList<>();

        Classs newClass = new Classs(className, members);
        boolean isAddSuccessful = Data.classSafeAdd(newClass);
        request.setAttribute("isAddSuccessful", isAddSuccessful);
        Data.updateJSON();
    
        // Invoke the JSP page.
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/addClassResult.jsp");
        dispatch.forward(request, response);
    }
}
