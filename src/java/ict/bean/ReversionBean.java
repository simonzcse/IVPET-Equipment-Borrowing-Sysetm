package ict.bean;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.Serializable;

/**
 *
 * @author a1
 */
public class ReversionBean implements Serializable {

    
    private int reversionId;
    private int studentID;
    private String studentName;
    private String creationDateTime;

    public ReversionBean(){
    }

    public int getReversionId() {
        return reversionId;
    }

    public String getStudentName() {
        return studentName;
    }

    public int getStudentID() {
        return studentID;
    }

    public String getCreationDateTime() {
        return creationDateTime;
    }

    public void setCreationDateTime(String creationDateTime) {
        this.creationDateTime = creationDateTime;
    }

    public void setReversionId(int reversionId) {
        this.reversionId = reversionId;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
}
