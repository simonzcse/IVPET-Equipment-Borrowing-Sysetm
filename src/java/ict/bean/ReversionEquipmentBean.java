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
public class ReversionEquipmentBean implements Serializable{
    private int reversion_ID;
    private int equipment_ID;
    private int equipment_Count;
    public ReversionEquipmentBean(){}

    public int getEquipment_ID() {
        return equipment_ID;
    }

    public void setEquipment_ID(int equipment_ID) {
        this.equipment_ID = equipment_ID;
    }

    public int getEquipment_Count() {
        return equipment_Count;
    }

    public int getReversion_ID() {
        return reversion_ID;
    }

    public void setEquipment_Count(int equipment_Count) {
        this.equipment_Count = equipment_Count;
    }

    public void setReversion_ID(int reversion_ID) {
        this.reversion_ID = reversion_ID;
    }
}
