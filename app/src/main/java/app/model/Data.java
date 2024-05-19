package app.model;

import app.model.Student;
import app.model.Classs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.BufferedReader;
import java.io.FileReader;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.JsonNode;

public class Data {
    public static ArrayList<Student> students = new ArrayList<>();    
    public static ArrayList<Classs> classes = new ArrayList<>();    
 
    public static ArrayList<Student> getStudents() {
        return students;
    }

    public static ArrayList<Classs> getClasses() {
        return classes;
    }

    public static boolean studentSafeAdd(Student student){
        if (students.contains(student)) {
            return false;
        }
        for (Student s : students){
            if (s != student && s.getStudentID().compareTo(student.getStudentID()) == 0){
                return false;
            }
        }
        students.add(student);
        return true;
    }

    public static boolean deleteStudent(String ID){
        boolean successful = false;
        for (Student s : Data.students){
            if (s.getStudentID().compareTo(ID) == 0){
                Data.students.remove(s);
                successful = true;
                break;
            }
        }
        return successful;
    }

    public static Student searchStudent(String ID){
        for (Student s : students){
            if (s.getStudentID().compareTo(ID) == 0){
                return s;
            }
        }
        return new Student(null, null, null, null, null, null, null);
    }

    public static ArrayList<Student> filteredStudentList(String type, String keyword, ArrayList<Student> list){
        ArrayList<Student> filtered = new ArrayList<>();
        switch (type) {
            case "firstName":
            for (Student s : list){
                    if (s.getFirstName().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            case "lastName":
                for (Student s : list){
                    if (s.getLastName().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            case "studentAge":
                for (Student s : list){
                    if (s.getStudentAge().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            case "studentGender":
                for (Student s : list){
                    if (s.getStudentGender().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            case "studentID":
                for (Student s : list){
                    if (s.getStudentID().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            case "studentClass":
                for (Student s : list){
                    if (s.getStudentClass().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            case "studentImageURL":
                for (Student s : list){
                    if (s.getStudentImageURL().compareTo(keyword) == 0){
                        filtered.add(s);
                    }
                }
                break;
            default:
                break;
        }
        return filtered;
    }

    public static boolean classSafeAdd(Classs classs){
        for (Classs c : classes){
            if (c.getClassName().compareTo(classs.getClassName()) == 0){
                return false;
            }
        }
        classes.add(classs);
        return true;
    }

    public static boolean deleteClass(String name){
        boolean successful = false;
        for (Classs c : classes){
            if (c.getClassName().compareTo(name) == 0){
                classes.remove(c);
                successful = true;
                break;
            }
        }
        return successful;
    }

    public static Classs searchClass(String name){
        for (Classs c : classes){
            if (c.getClassName().compareTo(name) == 0){
                return c;
            }
        }
        return new Classs("NOT ASSIGNED", null);
    }

    public static void updateJSON()throws IOException{
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        
        Map<String, ArrayList<Student>> dataMapStudent = new HashMap<>();
        dataMapStudent.put("students", students);
        String jsonPathStudent = System.getProperty("user.dir") + "/src/main/webapp/data/students.json";
        objectMapper.writeValue(new File(jsonPathStudent), dataMapStudent);

        Map<String, ArrayList<Classs>> dataMapClasss = new HashMap<>();
        dataMapClasss.put("classes", classes);
        String jsonPathClasss = System.getProperty("user.dir") + "/src/main/webapp/data/classes.json";
        objectMapper.writeValue(new File(jsonPathClasss), dataMapClasss);
    }

    public static String jsonFileToString(String filePath) throws IOException, FileNotFoundException {
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String jsonString = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonString += line;
        }
        reader.close();
        return jsonString;
    }

    public static void loadStudents(JsonNode node){

        if (!Data.students.isEmpty()){
            Data.students.clear();
        }
        for (JsonNode studentNode : node) {
            String firstName = studentNode.get("firstName").asText();
            String lastName = studentNode.get("lastName").asText();
            String studentAge = studentNode.get("studentAge").asText();
            String studentGender = studentNode.get("studentGender").asText();
            String studentID = studentNode.get("studentID").asText();
            String studentClass = studentNode.get("studentClass").asText();
            String studentImageURL = studentNode.get("studentImageURL").asText();
            Student student = new Student(firstName, lastName, studentAge, studentGender, studentID, studentClass, studentImageURL);
            Data.studentSafeAdd(student);
        }
    }

    public static void loadClasses(JsonNode node, ObjectMapper objectMapper){
        if (!Data.classes.isEmpty()){
            Data.classes.clear();
        }
        for (JsonNode classNode : node) {
            String className = classNode.get("className").asText();
            JsonNode membersNode = classNode.get("members");
            ArrayList<Student> members = loadStudentsToClass(membersNode);
            Classs classs = new Classs(className, members);
            Data.classes.add(classs);
        }
    }

    private static ArrayList<Student> loadStudentsToClass(JsonNode node) {
        ArrayList<Student> list = new ArrayList<>();
        for (JsonNode studentNode : node) {
            String studentID = studentNode.get("studentID").asText();
            Student student = Data.searchStudent(studentID);
            list.add(student);
        }
        return list;
    }

}