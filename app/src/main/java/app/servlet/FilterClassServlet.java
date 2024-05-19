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

@WebServlet("/filterClass.html")
public class FilterClassServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String keyword = (String) request.getParameter("keyword");
        
        ServletContext context = getServletContext();

        ArrayList<Classs> filtered = new ArrayList<>();
        filtered.add(Data.searchClass(keyword));
        request.setAttribute("viewFilteredList", true);
        request.setAttribute("filteredList", filtered);
        RequestDispatcher dispatch = context.getRequestDispatcher("/viewClassList.jsp");
        dispatch.forward(request, response);
    }
}
