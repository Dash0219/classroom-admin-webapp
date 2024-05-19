package app.model;

import app.model.Student;
import java.util.ArrayList;

public class Classs {
    private String className;
    private ArrayList<Student> members;

    public Classs(String className, ArrayList<Student> members){
        this.className = className;
        this.members = members;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public ArrayList<Student> getMembers() {
        return members;
    }

    public void setMembers(ArrayList<Student> members) {
        this.members = members;
    }
}
