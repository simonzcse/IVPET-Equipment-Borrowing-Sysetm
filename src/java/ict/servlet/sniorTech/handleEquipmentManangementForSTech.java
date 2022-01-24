/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet.sniorTech;

import ict.servlet.tech.*;
import ict.bean.*;
import ict.db.TechDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
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
@WebServlet(name = "handleEquipmentManangementForSTech", urlPatterns = {"/STech/handleEquipmentManangement"})
public class handleEquipmentManangementForSTech extends HttpServlet {
private TechDB db;

public void init() {
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        
        db = new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "");

    }
        protected void doGet(HttpServletRequest request, HttpServletResponse
        response)throws ServletException, IOException {
            try{processRequest(request, response);}
            catch(Exception e){}
        }
        protected void doPost(HttpServletRequest request, HttpServletResponse
        response)throws ServletException, IOException {
            try{processRequest(request, response);}
            catch(Exception e){}
        }
        
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , Exception{
            PrintWriter out = response.getWriter();
            String action = request.getParameter("Action");
            if ("List".equalsIgnoreCase(action)) {
                ResultSet rs= db.queryBySQL("SELECT ee.Equipment_Each_ID, ee.Equipment_ID, e.Equipment_Name, e.Equipment_Type, ee.Equipment_Each_isBorow, ee.Equipment_Each_isAvailable  FROM Equipment_Each ee, Equipment e WHERE ee.Equipment_ID=e.Equipment_ID ORDER BY ee.Equipment_Each_ID ASC;");
                ArrayList<EquipmentListBean> equipmentListBeans = new ArrayList<EquipmentListBean>();
                while (rs.next()){
                    EquipmentListBean equipmentListBean = new EquipmentListBean();
                    equipmentListBean.setEquipment_Each_ID(rs.getInt(1));
                    equipmentListBean.setEquipment_ID(+rs.getInt(2));
                    equipmentListBean.setEquipment_Name(rs.getString(3));
                    equipmentListBean.setEquipment_Type(rs.getString(4));
                    equipmentListBean.setEquipment_Each_isBorow(toYesNo(rs.getString(5)));
                    equipmentListBean.setEquipment_Each_isAvailable(toYesNo(rs.getString(6)));
                    equipmentListBeans.add(equipmentListBean);
               }
               request.setAttribute("equipmentListBeans", equipmentListBeans);
               RequestDispatcher rd;
               rd = getServletContext().getRequestDispatcher("/STech/Tech_List_All_Equipment.jsp");
               rd.forward(request, response);
            }else if("Edit".equalsIgnoreCase(action)){
                int equipment_ID = Integer.parseInt(request.getParameter("Equipment_ID"));
                ResultSet rs= db.queryBySQL("Select Equipment_ID, Equipment_Name, Equipment_Type, Equipment_DateTimeOfCreation From Equipment WHERE Equipment_ID="+equipment_ID+";");
                while (rs.next()){
                    EquipmentBean equipmentBean = new EquipmentBean();
                    equipmentBean.setEquipment_ID(rs.getInt(1));
                    equipmentBean.setEquipment_Name(rs.getString(2));
                    equipmentBean.setEquipment_Type(rs.getString(3));
                    equipmentBean.setEquipment_DateTimeOfCreation(rs.getString(4));
                    request.setAttribute("equipmentBean", equipmentBean);
                    RequestDispatcher rd;
                    rd = getServletContext().getRequestDispatcher("/STech/Tech_Edit_Equipment.jsp");
                    rd.forward(request, response);
                }
            }
            else if ("Unavailable".equalsIgnoreCase(action)) {
                int equipment_Each_ID = Integer.parseInt(request.getParameter("Equipment_Each_ID"));
                ResultSet rs= db.queryBySQL("SELECT Equipment_Each_isBorow FROM Equipment_Each WHERE Equipment_Each_ID="+equipment_Each_ID+";");
                String isBorow="";
                while (rs.next()){
                    isBorow=rs.getString(1);
                }
                if(isBorow.equals("0")){
                    int isEdit = db.updateSQL("UPDATE Equipment_Each SET Equipment_Each_isAvailable=false WHERE Equipment_Each_ID="+equipment_Each_ID+";");
                if (isEdit!=0){
                    out.println("Unavailable equipment Each ID:"+equipment_Each_ID+" Successfully");
                }
                else{
                    out.println("Database No Change");
                }
                }else if(isBorow.equals("1")){
                    out.println("You cannot Unavailable equipment that is being borrowed out\nDatabase No Change");
                }
            }else if ("Available".equalsIgnoreCase(action)) {
                int equipment_Each_ID = Integer.parseInt(request.getParameter("Equipment_Each_ID"));
                    int isEdit = db.updateSQL("UPDATE Equipment_Each SET Equipment_Each_isAvailable=true WHERE Equipment_Each_ID="+equipment_Each_ID+";");
                if (isEdit!=0){
                    out.println("Available equipment Each ID:"+equipment_Each_ID+" Successfully");
                }
                else{
                    out.println("Database No Change");
                }
            }else if ("Delete".equalsIgnoreCase(action)) {
                int equipment_Each_ID = Integer.parseInt(request.getParameter("Equipment_Each_ID"));
                    int isEdit = db.updateSQL("Delete From Equipment_Each WHERE Equipment_Each_ID="+equipment_Each_ID+";");
                if (isEdit!=0){
                    out.println("Delete equipment Each ID:"+equipment_Each_ID+" Successfully");
                }
                else{
                    out.println("Database No Change");
                }
                
     }else if ("NewEquipment".equalsIgnoreCase(action)) {
                ResultSet rs= db.queryBySQL("Select Equipment_ID, Equipment_Name, Equipment_Type, Equipment_DateTimeOfCreation From Equipment;");
                ArrayList<EquipmentBean> equipmentBeans = new ArrayList();
                while (rs.next()){
                    EquipmentBean equipmentBean = new EquipmentBean();
                    equipmentBean.setEquipment_ID(rs.getInt(1));
                    equipmentBean.setEquipment_Name(rs.getString(2));
                    equipmentBean.setEquipment_Type(rs.getString(3));
                    equipmentBean.setEquipment_DateTimeOfCreation(rs.getString(4));
                    equipmentBeans.add(equipmentBean);
                }
                    request.setAttribute("equipmentBeans", equipmentBeans);
                    RequestDispatcher rd;
                    rd = getServletContext().getRequestDispatcher("/STech/Tech_Add_Equipment.jsp");
                    rd.forward(request, response);
     }  
            else if ("handleNewEquipment".equalsIgnoreCase(action)) {
                String equipment_Name = request.getParameter("Equipment_Name");
                String equipment_Type = request.getParameter("Equipment_Type");
                ResultSet rs= db.queryBySQL("SELECT MAX(Equipment_ID) FROM Equipment;");
                int maxEquipment_ID;
                while (rs.next()){
                maxEquipment_ID=rs.getInt(1);
                maxEquipment_ID+=1;
                String s ="insert into Equipment (Equipment_ID, Equipment_Name, Equipment_Type) VALUES("+maxEquipment_ID+", '"+equipment_Name+"', '"+equipment_Type+"');";
                String s2="insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) VALUES("+maxEquipment_ID+", false, true);";
                int isEdit = db.updateSQL(s);
                if (isEdit!=0){
                    int isEdit2 = db.updateSQL(s2);
                    out.println("<script>alert('Successfully')</script>");
                    response.sendRedirect("handleEquipmentManangement?Action=List");
                    }
                }   
     }else if ("handleNewExistEquipment".equalsIgnoreCase(action)) {
                String equipment_ID = request.getParameter("Equipment_ID");
                int count = Integer.parseInt(request.getParameter("Count"));
                for (int i=0;i<count;i++){
                    db.updateSQL("insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) VALUES("+equipment_ID+", false, true);");
                }
                out.println("Add Equipment with exist Type Successfully, Count = "+count);
                }
     
            else if ("handleEditEquipment".equalsIgnoreCase(action)) {
                String equipment_ID = request.getParameter("eid");
                String equipment_Name = request.getParameter("newEquipmentName");
                String equipment_Type = request.getParameter("newEquipmentType");
                out.println(equipment_ID);
                int isEdit = db.updateSQL("UPDATE Equipment SET Equipment_Name='"+equipment_Name+"', Equipment_Type='"+equipment_Type+"' WHERE Equipment_ID="+equipment_ID+";");
                if (isEdit!=0){
                    out.println("<script>alert('Successfully')</script>");
                    response.sendRedirect("handleEquipmentManangement?Action=List");
                    }
                
     }
     }
     public String toYesNo(String s){
         if(s.equals("0")){
             s="No";
         } else if(s.equals("1")){
             s= "Yes";
         }
        return s;
     }
}
