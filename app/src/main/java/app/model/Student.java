package app.model;

public class Student {
    public String firstName;
    public String lastName;
    public String studentAge;
    public String studentGender;
    public String studentID;
    public String studentClass;
    public String studentImageURL;

    public Student(String firstName, String lastName, String studentAge, String studentGender, String studentID, String studentClass, String studentImageURL) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.studentAge = studentAge;
        this.studentGender = studentGender;
        this.studentID = studentID;
        this.studentClass = studentClass;
        this.studentImageURL = studentImageURL;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(String studentAge) {
        this.studentAge = studentAge;
    }

    public String getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(String studentGender) {
        this.studentGender = studentGender;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public String getStudentImageURL() {
        if (studentImageURL == null){
            return null;
        }
        return studentImageURL;
    }

    public void setStudentImageURL(String studentImageURL) {
        this.studentImageURL = studentImageURL;
    }
}
