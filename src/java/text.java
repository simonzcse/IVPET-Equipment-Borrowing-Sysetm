/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import ict.db.TechDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ict.db.TechDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class text {
    
public static void main(String[] args){
    String url;  
            Connection con = null;  
            try {  
                Class.forName("com.mysql.jdbc.Driver");  
                url="jdbc:mysql://localhost:3306/";  
                con = DriverManager.getConnection(url,"root","");  
                System.out.println("Connection created");  
                con.close();  
                System.out.println("Connection closed");  
                }  
                catch (Exception e) {  
                System.out.println(e.toString());  
            }  
}
}
