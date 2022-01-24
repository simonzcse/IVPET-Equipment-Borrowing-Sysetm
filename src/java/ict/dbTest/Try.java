


import java.sql.Connection;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
public class Try {
    public Try() {
        
        
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            System.setProperty("jdbc.drivers", "com.mysql.jdbc.Driver");
            cnnct = DriverManager.getConnection("jdbc:mysql://localhost/", "root", "");
            
            String email = "123";
            String password = "234";
            String preQueryStatement = "SELECT * WHERE Account_Email = " + email + " AND Account_Password = " + password;
            
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Cookie c1=new Cookie("ID",rs.getString(1));
                //res.addCookie(c1);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pStmnt != null) {
                try {
                    pStmnt.close();
                } catch (SQLException e) {
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException sqlEx) {
                }
            }
        }
    }
}
