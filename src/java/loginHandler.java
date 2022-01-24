

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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author loyee
 */
@WebServlet(urlPatterns = {"/loginHandler"})
public class loginHandler extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        String email = req.getParameterValues("email")[0];
        String password = req.getParameterValues("password")[0];
        PrintWriter out = res.getWriter();
        String name = "";
        out.println("<html>");
        out.println("<head><title>hello, " + email + password + "</title></head><body>");
        
        ResultSet rs= new TechDB("jdbc:mysql://localhost:3306/itp4511_project", "root", "")
            .queryBySQL("SELECT * FROM Account WHERE Account_Email = '" + email + "' AND Account_Password = '" + password + "'");
        
        out.println("<script type=\"text/javascript\">");
        
        HttpSession session=req.getSession();  
        
        String account_Role = "";
        boolean found = false;
        try{
         if (rs.next()) {
                found = true;
                session.setAttribute("Account_ID",rs.getString(1));
                session.setAttribute("Account_Role",rs.getString(6));
                
                account_Role = rs.getString(6);
                String alert = (String)session.getAttribute("Account_ID") + ", Welcome!";
                
                out.println("alert('" + alert + "');");
                //out.println("location='index.jsp';");
            }
        }catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        }
        
        if(!found){
            out.println("alert('Sorry:Email or password not found!');");
            out.println("location='index.jsp';");
            
            
            
        }
        else
        {
            
            switch(account_Role){
                case "Student":
                     out.println("location='Student/Student.jsp'");
                     break;
                    
                case "Technician":
                    out.println("location='Tech/Tech.jsp'");
                    break;
                case "Senior Technician":
                    out.println("location='STech/Tech.jsp'");
                    break;
                    
            }
        }
        out.println("</script>");
        
        
    }
}
