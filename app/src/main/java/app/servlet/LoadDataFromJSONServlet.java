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

// for the json files
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;

@WebServlet("/loadDataFromJSON.html")
public class LoadDataFromJSONServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dataDirectoryPath = getServletContext().getRealPath("/data");
        String studentsFilePath = dataDirectoryPath + "/students.json";
        String classesFilePath = dataDirectoryPath + "/classes.json";

        String jsonStringStudents = Data.jsonFileToString(studentsFilePath);
        String jsonStringClasses = Data.jsonFileToString(classesFilePath);

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNodeStudents = objectMapper.readTree(jsonStringStudents);
        JsonNode studentsNode = rootNodeStudents.get("students");
        JsonNode rootNodeClasses = objectMapper.readTree(jsonStringClasses);
        JsonNode classesNode = rootNodeClasses.get("classes");
        
        Data.loadStudents(studentsNode);
        Data.loadClasses(classesNode, objectMapper);
        
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/menu.jsp");
        dispatch.forward(request, response);
    
    }
}