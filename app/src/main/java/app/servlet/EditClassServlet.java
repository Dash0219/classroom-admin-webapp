package app.servlet;

import app.model.Data;
import app.model.Student;
import app.model.Classs;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editClass.html")
public class EditClassServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String className = request.getParameter("className");
        String originalClassName = request.getParameter("originalClassName");
        Classs target = Data.searchClass(originalClassName);

        boolean isEditSuccessful = true;
        if (originalClassName.compareTo(className) != 0){
            for (Classs c : Data.classes){
                if (c.getClassName().compareTo(className) == 0){
                    isEditSuccessful = false;
                    break;
                }
            }
        }
        if (isEditSuccessful){
            target.setClassName(className);
            Data.updateJSON();
        }
        request.setAttribute("isEditSuccessful", isEditSuccessful);

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/editClassResult.jsp");
        dispatch.forward(request, response);
    }
}
