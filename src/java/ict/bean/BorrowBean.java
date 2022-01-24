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
public class BorrowBean implements Serializable{
    private int reversionID;
    private int equipmentEachID;
    public BorrowBean(){}

    public void setEquipmentEachID(int equipmentEachID) {
        this.equipmentEachID = equipmentEachID;
    }

    public int getEquipmentEachID() {
        return equipmentEachID;
    }

    public int getReversionID() {
        return reversionID;
    }

    public void setReversionID(int reversionID) {
        this.reversionID = reversionID;
    }
}
