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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author loyee
 */
@WebServlet(urlPatterns = {"/addReversionEQ"})
public class addReversionEQ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
            /* TODO output your page here. You may use following sample code. */
            ResultSet rs= new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "")
            .queryBySQL("SELECT MAX(Reversion_ID) FROM `reversion`");
         
            PrintWriter out = res.getWriter();
            String reversion_ID = "";
            
            try{
                if (rs.next())
                {
                   reversion_ID = rs.getString(1);
                }
            }catch (SQLException ex) {
                while (ex != null) {
                    ex.printStackTrace();
                    ex = ex.getNextException();
                }
            }
            
            String studentID = req.getParameter("studentID");
            String EID = req.getParameter("id");
            String ECount = req.getParameter("count");
            
            new TechDB("jdbc:mysql://localhost:3306/itp4511_project", "root", "")
                .updateSQL("INSERT INTO `reversion_equipment` (`Reversion_ID`, `Equipment_ID`, `Equipment_Count`) VALUES ('"+reversion_ID+"', '"+EID+"', '"+ECount+"')");
            
            out.println("<script>alert('Reservation_ID = "+reversion_ID+", record successfully updated');</script>");
        
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
