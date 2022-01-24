/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;
import java.io.Serializable;
/**
 *
 * @author simon
 */
public class EquipmentBean implements Serializable {
    private int equipment_ID;
    private String equipment_Name;
    private String equipment_Type;
    private String Equipment_DateTimeOfCreation;
    public EquipmentBean(){}

    public void setEquipment_Type(String equipment_Type) {
        this.equipment_Type = equipment_Type;
    }

    public void setEquipment_ID(int equipment_ID) {
        this.equipment_ID = equipment_ID;
    }

    public void setEquipment_Name(String equipment_Name) {
        this.equipment_Name = equipment_Name;
    }

    public void setEquipment_DateTimeOfCreation(String equipment_DateTimeOfCreation) {
        Equipment_DateTimeOfCreation = equipment_DateTimeOfCreation;
    }

    public String getEquipment_Type() {
        return equipment_Type;
    }

    public int getEquipment_ID() {
        return equipment_ID;
    }

    public String getEquipment_Name() {
        return equipment_Name;
    }

    public String getEquipment_DateTimeOfCreation() {
        return Equipment_DateTimeOfCreation;
    }
}
