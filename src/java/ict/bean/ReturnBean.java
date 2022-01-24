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
public class ReturnBean implements Serializable {

    
    private int borrowID;
    private int studentID;
    private int equipmentEachID;
    private int equipmentID;
    private String studentName;
    private String equipmentName;
    private String equipmentType;
    private String borrowStartDate;
    private String borrowExpirationDate;
    private String borrowEquipmentStatus;

    public ReturnBean(){
    }

    public int getBorrowID() {
        return borrowID;
    }

    public int getEquipmentEachID() {
        return equipmentEachID;
    }

    public int getEquipmentID() {
        return equipmentID;
    }

    public int getStudentID() {
        return studentID;
    }

    public String getBorrowExpirationDate() {
        return borrowExpirationDate;
    }

    public String getBorrowEquipmentStatus() {
        return borrowEquipmentStatus;
    }

    public void setBorrowEquipmentStatus(String borrowEquipmentStatus) {
        this.borrowEquipmentStatus = borrowEquipmentStatus;
    }

    public String getBorrowStartDate() {
        return borrowStartDate;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public String getEquipmentType() {
        return equipmentType;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setBorrowExpirationDate(String borrowExpirationDate) {
        this.borrowExpirationDate = borrowExpirationDate;
    }

    public void setBorrowID(int borrowID) {
        this.borrowID = borrowID;
    }

    public void setBorrowStartDate(String borrowStartDate) {
        this.borrowStartDate = borrowStartDate;
    }

    public void setEquipmentEachID(int equipmentEachID) {
        this.equipmentEachID = equipmentEachID;
    }

    public void setEquipmentID(int equipmentID) {
        this.equipmentID = equipmentID;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public void setEquipmentType(String equipmentType) {
        this.equipmentType = equipmentType;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

}
