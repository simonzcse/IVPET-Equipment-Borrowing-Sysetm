package ict.tag;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ict.db.TechDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author loyee
 */
public class alert extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
     public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            // TODO: insert code to write html before writing the body content.
            // e.g.:
            //
            // out.println("<strong>" + attribute_1 + "</strong>");
            // out.println("    <blockquote>");

            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }

            // TODO: insert code to write html after writing the body content.
            // e.g.:
            //
            // out.println("    </blockquote>");
            PageContext pageContext = (PageContext) getJspContext();
            HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
            HttpSession session = request.getSession();
            
            String Account_ID = (String)session.getAttribute("Account_ID"); 
            ResultSet as= new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "")
            .queryBySQL("SELECT borrow.Borrow_ID ,borrow.Borrow_ExpirationDate,DATEDIFF(NOW(), borrow.Borrow_ExpirationDate)FROM `borrow`,`borrow_equipment` WHERE NOW() > borrow.Borrow_ExpirationDate and borrow_equipment.Borrow_ID = borrow.Borrow_ID and borrow_equipment.Borrow_Equipment_Status = 'Borrowing' and borrow.Account_ID = " 
                    + Account_ID +" GROUP by Borrow_ID");
                int size =0;
              if (as != null) 
              {
                as.last();    // moves cursor to the last row
                size = as.getRow(); // get row id 
              }


                  out.print(size);
                  
                  
  } catch (java.io.IOException ex) {
    throw new JspException("Error in alert_count tag", ex);
    }   catch (SQLException ex) {
                ex.printStackTrace();
                ex = ex.getNextException();
        }
    }
    
}
