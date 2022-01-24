/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet.sniorTech;

import ict.bean.ReturnBean;
import ict.db.TechDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author simon
 */
@WebServlet(name = "handleAnalyticForSTech", urlPatterns = {"/STech/handleAnalytic"})
public class handleAnalyticForSTech extends HttpServlet {
    private TechDB db;

public void init() {
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        
        db = new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "");

    }
        protected void doGet(HttpServletRequest request, HttpServletResponse
        response)throws ServletException, IOException {
            try{processRequest(request, response);}catch (Exception ex) {
        Logger.getLogger(handleReversionForSTech.class.getName()).log(Level.SEVERE, null, ex);}
        }
        protected void doPost(HttpServletRequest request, HttpServletResponse
        response)throws ServletException, IOException {
            try{processRequest(request, response);}catch (Exception ex) {
        Logger.getLogger(handleReversionForSTech.class.getName()).log(Level.SEVERE, null, ex);}
        }
        
        
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , Exception{
            PrintWriter out = response.getWriter();
            String action = request.getParameter("Action");
            if ("Reject".equalsIgnoreCase(action)) {
                int reversion_ID = Integer.parseInt(request.getParameter("Reversion_ID"));
                int isEdit = db.updateSQL("UPDATE reversion SET Reversion_Status='Reject' WHERE Reversion_ID="+reversion_ID+";");
                if (isEdit!=0){
                    out.println("Reject Request ID:"+reversion_ID+" Successfully");
                }
                else{
                    out.println("Database No Change");
                }
            }else if ("Record".equalsIgnoreCase(action)) {
                ResultSet rs= db.queryBySQL("SELECT b.Borrow_ID, b.Account_ID, a.Account_Name, be.Equipment_Each_ID, ee.Equipment_ID, e.Equipment_Name, e.Equipment_Type, b.Borrow_StartDate, b.Borrow_ExpirationDate, be.Borrow_Equipment_Status FROM Borrow b, Account a, Borrow_Equipment be, Equipment e, Equipment_Each ee WHERE b.Borrow_ID=be.Borrow_ID and b.Account_ID=a.Account_ID and be.Equipment_Each_ID=ee.Equipment_Each_ID and e.Equipment_ID=ee.Equipment_ID ORDER BY a.Account_Name ASC;");
                ArrayList<ReturnBean> returnBeans = new ArrayList<ReturnBean>();
                while (rs.next()){
                    ReturnBean returnBean = new ReturnBean();
                    returnBean.setBorrowID(rs.getInt(1));
                    returnBean.setStudentID(+rs.getInt(2));
                    returnBean.setStudentName(rs.getString(3));
                    returnBean.setEquipmentEachID(rs.getInt(4));
                    returnBean.setEquipmentID(rs.getInt(5));
                    returnBean.setEquipmentName(rs.getString(6));
                    returnBean.setEquipmentType(rs.getString(7));
                    returnBean.setBorrowStartDate(rs.getString(8));
                    returnBean.setBorrowExpirationDate(rs.getString(9));
                    returnBean.setBorrowEquipmentStatus(rs.getString(10));
                    returnBeans.add(returnBean);
               }
               request.setAttribute("returnBeans", returnBeans);
               RequestDispatcher rd;
               rd = getServletContext().getRequestDispatcher("/STech/Tech_Borrow_Record.jsp");
               out.println("Database No Change");
               rd.forward(request, response);
           }else if ("Overdue".equalsIgnoreCase(action)) {
                long currentTimeMillis=System.currentTimeMillis();  
                java.sql.Date today=new java.sql.Date(currentTimeMillis);  
                ResultSet rs= db.queryBySQL("SELECT b.Borrow_ID, b.Account_ID, a.Account_Name, be.Equipment_Each_ID, ee.Equipment_ID, e.Equipment_Name, e.Equipment_Type, b.Borrow_StartDate, b.Borrow_ExpirationDate, be.Borrow_Equipment_Status FROM Borrow b, Account a, Borrow_Equipment be, Equipment e, Equipment_Each ee WHERE b.Borrow_ID=be.Borrow_ID and b.Account_ID=a.Account_ID and be.Equipment_Each_ID=ee.Equipment_Each_ID and e.Equipment_ID=ee.Equipment_ID and b.Borrow_ExpirationDate<'"+today+"' ORDER BY b.Borrow_ExpirationDate DESC;");
                ArrayList<ReturnBean> returnBeans = new ArrayList<ReturnBean>();
                while (rs.next()){
                    ReturnBean returnBean = new ReturnBean();
                    returnBean.setBorrowID(rs.getInt(1));
                    returnBean.setStudentID(+rs.getInt(2));
                    returnBean.setStudentName(rs.getString(3));
                    returnBean.setEquipmentEachID(rs.getInt(4));
                    returnBean.setEquipmentID(rs.getInt(5));
                    returnBean.setEquipmentName(rs.getString(6));
                    returnBean.setEquipmentType(rs.getString(7));
                    returnBean.setBorrowStartDate(rs.getString(8));
                    returnBean.setBorrowExpirationDate(rs.getString(9));
                    returnBean.setBorrowEquipmentStatus(rs.getString(10));
                    returnBeans.add(returnBean);
               }
               request.setAttribute("returnBeans", returnBeans);
               RequestDispatcher rd;
               rd = getServletContext().getRequestDispatcher("/STech/Tech_Overdue_Borrow_Record.jsp");
               out.println("Database No Change");
               rd.forward(request, response);
           }
        }
}
