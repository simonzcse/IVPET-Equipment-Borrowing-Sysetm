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
public class EquipmentListBean implements Serializable {

    
    private int equipment_Each_ID;
    private int equipment_ID;
    private String equipment_Name;
    private String equipment_Type;
    private String equipment_Each_isBorow;
    private String equipment_Each_isAvailable;


    public EquipmentListBean(){
    }

    public int getEquipment_Each_ID() {
        return equipment_Each_ID;
    }

    public int getEquipment_ID() {
        return equipment_ID;
    }

    public String getEquipment_Each_isAvailable() {
        return equipment_Each_isAvailable;
    }

    public String getEquipment_Each_isBorow() {
        return equipment_Each_isBorow;
    }

    public String getEquipment_Name() {
        return equipment_Name;
    }

    public String getEquipment_Type() {
        return equipment_Type;
    }

    public void setEquipment_Each_ID(int equipment_Each_ID) {
        this.equipment_Each_ID = equipment_Each_ID;
    }

    public void setEquipment_Each_isAvailable(String equipment_Each_isAvailable) {
        this.equipment_Each_isAvailable = equipment_Each_isAvailable;
    }

    public void setEquipment_Each_isBorow(String equipment_Each_isBorow) {
        this.equipment_Each_isBorow = equipment_Each_isBorow;
    }

    public void setEquipment_ID(int equipment_ID) {
        this.equipment_ID = equipment_ID;
    }

    public void setEquipment_Name(String equipment_Name) {
        this.equipment_Name = equipment_Name;
    }

    public void setEquipment_Type(String equipment_Type) {
        this.equipment_Type = equipment_Type;
    }
}
