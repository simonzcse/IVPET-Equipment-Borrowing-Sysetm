package ict.servlet.student;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ict.db.TechDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author loyee
 */
@WebServlet(urlPatterns = {"/alert"})
public class alert extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);  
            String Account_ID=(String)session.getAttribute("Account_ID"); 
        
        /*ResultSet as= new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "")
            .queryBySQL("SELECT borrow.Borrow_ID ,borrow.Borrow_ExpirationDate,DATEDIFF(NOW(), borrow.Borrow_ExpirationDate)FROM `borrow`,`borrow_equipment` WHERE NOW() > borrow.Borrow_ExpirationDate and borrow_equipment.Borrow_ID = borrow.Borrow_ID and borrow_equipment.Borrow_Equipment_Status = 'Borrowing' and borrow.Account_ID="
                    + Account_ID + "GROUP by Borrow_ID");*/
         PrintWriter out = response.getWriter();
         out.println("<script type=\"text/javascript\">alert('123');</script>");
        ResultSet as= new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "")
            .queryBySQL("SELECT borrow.Borrow_ID ,borrow.Borrow_ExpirationDate,DATEDIFF(NOW(), borrow.Borrow_ExpirationDate)FROM `borrow`,`borrow_equipment` WHERE NOW() > borrow.Borrow_ExpirationDate and borrow_equipment.Borrow_ID = borrow.Borrow_ID and borrow_equipment.Borrow_Equipment_Status = 'Borrowing' and borrow.Account_ID = " 
                    + Account_ID +" GROUP by Borrow_ID");
        
        try{
        while (as.next())
            {
                
                request.setAttribute("alertID",as.getString(1));
                request.setAttribute("alertDateDiff",as.getString(3));
            }
        }catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        }
    }

}
