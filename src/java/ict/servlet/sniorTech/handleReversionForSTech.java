/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet.sniorTech;

import ict.servlet.tech.*;
import ict.DBResultToJsonArray;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import ict.db.TechDB;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.json.JSONArray;
import ict.bean.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author simon
 */
@WebServlet(name = "handleReversionForSTech", urlPatterns = {"/STech/handleReversion"})
public class handleReversionForSTech extends HttpServlet {
private TechDB db;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
public void init() {
        db = new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "");

    }
        protected void doGet(HttpServletRequest request, HttpServletResponse
        response)throws ServletException, IOException {
            try{
                processRequest(request, response);
            } catch (Exception ex) {
        Logger.getLogger(handleReversionForSTech.class.getName()).log(Level.SEVERE, null, ex);
    }
            //catch(Exception e){}
            //catch(Exception e){}
            //catch(Exception e){}
            //catch(Exception e){}
        }
        protected void doPost(HttpServletRequest request, HttpServletResponse
        response)throws ServletException, IOException {
            try{processRequest(
                    request, response);
            } catch (Exception ex) {
        Logger.getLogger(handleReversionForSTech.class.getName()).log(Level.SEVERE, null, ex);
    }
            //catch(Exception e){}
            //catch(Exception e){}
            //catch(Exception e){}
            //catch(Exception e){}
        }
        
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , Exception{
            PrintWriter out = response.getWriter();
            out.print("<script>123</script>");
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
            }else if ("Approve".equalsIgnoreCase(action)){
                int reversion_ID = Integer.parseInt(request.getParameter("Reversion_ID"));
                int isEdit = db.updateSQL("UPDATE reversion SET Reversion_Status='Approve' WHERE Reversion_ID="+reversion_ID+";");
                if (isEdit!=0){
                    out.println("Approve Request ID:"+reversion_ID+" Successfully");
                }
                else{
                    out.println("Database No Change");
                }
            }
            else if ("Return".equalsIgnoreCase(action)){
                int borrow_ID = Integer.parseInt(request.getParameter("Borrow_ID"));
                int equipment_Each_ID = Integer.parseInt(request.getParameter("Equipment_Each_ID"));
                int isEdit = db.updateSQL("UPDATE Borrow_Equipment SET Borrow_Equipment_Status='Returned' WHERE Borrow_ID="+borrow_ID+" and Equipment_Each_ID="+equipment_Each_ID+";");
                if (isEdit!=0){
                    int isEdit2 = db.updateSQL("UPDATE Equipment_Each SET Equipment_Each_isBorow=false WHERE Equipment_Each_ID="+equipment_Each_ID+";");
                    out.println("Return Equipment Each ID:"+equipment_Each_ID+" Successfully");
                }
                else{
                    out.println("Database No Change");
                }
            }
            else if ("Reversion".equalsIgnoreCase(action)) {
                
                 ResultSet rs= db.queryBySQL("SELECT r.Reversion_ID, r.Account_ID, a.Account_Name, r.Reversion_DateTimeOfCreation  FROM Reversion r, Account a WHERE r.Account_ID=a.Account_ID and r.Reversion_Status='To be Confirmed' ORDER BY r.Reversion_DateTimeOfCreation DESC;");
                 ArrayList<ReversionBean> reversionBeans = new ArrayList<ReversionBean>();
                 while (rs.next()){
                     ReversionBean reversionBean = new ReversionBean();
                     reversionBean.setReversionId(rs.getInt(1));
                     reversionBean.setStudentID(+rs.getInt(2));
                     reversionBean.setStudentName(rs.getString(3));
                     reversionBean.setCreationDateTime(rs.getString(4));
                     reversionBeans.add(reversionBean);
                }
                request.setAttribute("reversionBeans", reversionBeans);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/STech/Tech_Borrowing_Request.jsp");
                out.println("Database No Change");
                rd.forward(request, response);
            }
            else if ("Borrow".equalsIgnoreCase(action)) {
                 ResultSet rs= db.queryBySQL("SELECT r.Reversion_ID, r.Account_ID, a.Account_Name, r.Reversion_DateTimeOfCreation  FROM Reversion r, Account a WHERE r.Account_ID=a.Account_ID and r.Reversion_Status='Approve' ORDER BY r.Reversion_DateTimeOfCreation DESC;");
                 ArrayList<ReversionBean> reversionBeans = new ArrayList<ReversionBean>();
                 while (rs.next()){
                     ReversionBean reversionBean = new ReversionBean();
                     reversionBean.setReversionId(rs.getInt(1));
                     reversionBean.setStudentID(+rs.getInt(2));
                     reversionBean.setStudentName(rs.getString(3));
                     reversionBean.setCreationDateTime(rs.getString(4));
                     reversionBeans.add(reversionBean);
                }
                request.setAttribute("reversionBeans", reversionBeans);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/STech/Tech_Borrow.jsp");
                out.println("Database No Change");
                rd.forward(request, response);
            }
            else if ("BorrowSelectEach".equalsIgnoreCase(action)) {
                int reversion_ID = Integer.parseInt(request.getParameter("Reversion_ID"));
                 ResultSet rs= db.queryBySQL("SELECT Reversion_ID, Equipment_ID, Equipment_Count FROM Reversion_Equipment WHERE Reversion_ID="+reversion_ID+";");
                 ArrayList<ReversionEquipmentBean> reversionEquipmentBeans = new ArrayList<ReversionEquipmentBean>();
                 ArrayList<EquipmentListBean> equipmentListBeans = new ArrayList<EquipmentListBean>();   
                 while (rs.next()){
                     ReversionEquipmentBean reversionEquipmentBean = new ReversionEquipmentBean();
                     reversionEquipmentBean.setReversion_ID(rs.getInt(1));
                     ResultSet rs2= db.queryBySQL("SELECT Equipment_Each_ID, Equipment_ID FROM Equipment_Each WHERE Equipment_ID="+rs.getInt(2)+" and Equipment_Each_isBorow=0 and Equipment_Each_isAvailable=1;");                     
                     while (rs2.next()){
                         EquipmentListBean equipmentListBean = new EquipmentListBean();                       
                         equipmentListBean.setEquipment_Each_ID(rs2.getInt(1));
                         equipmentListBean.setEquipment_ID(rs2.getInt(2));
                         equipmentListBeans.add(equipmentListBean);
                     }
                     reversionEquipmentBean.setEquipment_ID(+rs.getInt(2));
                     reversionEquipmentBean.setEquipment_Count(rs.getInt(3));
                     reversionEquipmentBeans.add(reversionEquipmentBean);
                }
                request.setAttribute("reversionEquipmentBeans", reversionEquipmentBeans);
                request.setAttribute("equipmentListBeans", equipmentListBeans);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/STech/Tech_BorrowSelectEach.jsp");
                rd.forward(request, response);
            }else if ("HandleEquipmentBorrow".equalsIgnoreCase(action)) {
                BorrowBeans borrowBeans = (BorrowBeans)request.getSession().getAttribute("borrowBeans");
                String expirationDate= request.getParameter("ExpirationDate");
                if(borrowBeans!= null){
                    long currentTimeMillis=System.currentTimeMillis();  
                    java.sql.Date today=new java.sql.Date(currentTimeMillis); 
                    
                    ArrayList<BorrowBean> borrowBeanList = borrowBeans.getBorrowBeans();
                    int RreversionID= borrowBeanList.get(0).getReversionID();
                    ResultSet rs= db.queryBySQL("SELECT Account_ID FROM Reversion WHERE Reversion_ID="+RreversionID+";");
                    int account_ID=0;
                    while (rs.next()){
                    account_ID=rs.getInt(1);}
                    db.updateSQL("insert into Borrow(Account_ID, Reversion_ID, Borrow_StartDate, Borrow_ExpirationDate) values("+account_ID+", "+RreversionID+",'"+today+"', '"+expirationDate+"');");
                    db.updateSQL("UPDATE Reversion SET Reversion_Status='Borrowed' WHERE Reversion_ID="+RreversionID+";");
                    
                    ResultSet rs2= db.queryBySQL("SELECT MAX(Borrow_ID) FROM Borrow;");
                    int maxBorrow_ID=0;
                    while (rs.next()){maxBorrow_ID=rs.getInt(1);}
                    for (int i = 0; i<borrowBeanList.size();i++) {
                        BorrowBean b = borrowBeanList.get(i);
                        int isupdate=db.updateSQL("insert into Borrow_Equipment values("+maxBorrow_ID+", "+b.getEquipmentEachID()+", 'Borrowing');");
                        out.println(b.getEquipmentEachID());
                        if(isupdate>0){
                        db.updateSQL("UPDATE Equipment_Each SET Equipment_Each_isBorow=1 WHERE Equipment_Each_ID="+b.getEquipmentEachID()+";");}
                    }
                    out.println("<script>alert('Successfully')</script>");
                    response.sendRedirect("handleAnalytic?Action=Record");
                    
                }
                else{out.print("null");}
            }
            
            else if ("EquipmentReturn".equalsIgnoreCase(action)) {
                ResultSet rs= db.queryBySQL("SELECT b.Borrow_ID, b.Account_ID, a.Account_Name, be.Equipment_Each_ID, ee.Equipment_ID, e.Equipment_Name, e.Equipment_Type, b.Borrow_StartDate, b.Borrow_ExpirationDate FROM Borrow b, Account a, Borrow_Equipment be, Equipment e, Equipment_Each ee WHERE b.Borrow_ID=be.Borrow_ID and b.Account_ID=a.Account_ID and be.Equipment_Each_ID=ee.Equipment_Each_ID and e.Equipment_ID=ee.Equipment_ID and be.Borrow_Equipment_Status='Borrowing' ORDER BY b.Borrow_StartDate ASC;");
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
                    returnBeans.add(returnBean);
               }
               request.setAttribute("returnBeans", returnBeans);
               RequestDispatcher rd;
               rd = getServletContext().getRequestDispatcher("/STech/Tech_Return.jsp");
               out.println("Database No Change");
               rd.forward(request, response);
           }


     }   
        
}
