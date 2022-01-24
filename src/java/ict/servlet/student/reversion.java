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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author loyee
 */
@WebServlet(urlPatterns = {"/reversion"})
public class reversion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            HttpSession session=request.getSession(false);  
            String Account_ID=(String)session.getAttribute("Account_ID"); 
            
            
            
            
            
                if(Account_ID != null){
                    out.println("<script>alert('servlet:Account_ID = "+Account_ID+"');</script>");
             
                    ResultSet rs= new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "")
                      .queryBySQL("SELECT Reversion_ID, Reversion_Status,Reversion_DateTimeOfCreation FROM `reversion` WHERE Account_ID =" + Account_ID);
           
                    request.setAttribute("ResultSet", rs);
                    RequestDispatcher rd=request.getRequestDispatcher("Student/reversion.jsp");  
                    rd.forward(request, response);  
                }
                
            
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Please login first!');");
               out.println("location='index.jsp';");
               out.println("</script>");
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
