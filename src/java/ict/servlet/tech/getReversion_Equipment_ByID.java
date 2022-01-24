/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet.tech;

import ict.DBResultToJsonArray;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ict.db.TechDB;
import java.sql.ResultSet;
import org.json.JSONArray;

/**
 *
 * @author simon
 */
@WebServlet(name = "getReversion_Equipment_ByID", urlPatterns = {"/getReversion_Equipment_ByID"})
public class getReversion_Equipment_ByID extends HttpServlet {
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
        String username = this.getServletContext().getInitParameter("dbUser");
        String password = this.getServletContext().getInitParameter("dbPassword");
        String url = this.getServletContext().getInitParameter("dbUrl");
        
        db = new TechDB(url, username, password);

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
        
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)//Ajax
            throws ServletException, IOException , Exception{
            int Reversion_ID = Integer.parseInt(request.getParameter("Reversion_ID"));
            ResultSet rs = db.queryBySQL("SELECT re.Reversion_ID, re.Equipment_ID, e.Equipment_Name, e.Equipment_Type, re.Equipment_Count  FROM Reversion_Equipment re, Equipment e WHERE re.Equipment_ID=e.Equipment_ID and re.Reversion_ID="+Reversion_ID+";");
            JSONArray jArray = new DBResultToJsonArray().convert(rs);
            PrintWriter out = response.getWriter();
            out.println(jArray.toString());
     }   
        
}
