/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;
import java.util.ArrayList;
import java.io.Serializable;
/**
 *
 * @author simon
 */
public class BorrowBeans implements Serializable{
    private ArrayList<BorrowBean> borrowBeans;
    

public void add(BorrowBean borrowBean) {
        this.borrowBeans.add(borrowBean);}

    public ArrayList<BorrowBean> getBorrowBeans() {
        return borrowBeans;
    }

    public void setBorrowBeans(ArrayList<BorrowBean> borrowBeans) {
        this.borrowBeans = borrowBeans;
    }
    public BorrowBeans (){
     this.borrowBeans= new ArrayList<BorrowBean>();
    }
}
