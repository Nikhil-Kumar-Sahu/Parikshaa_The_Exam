/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaFile;

import java.sql.*;

/**
 *
 * @author hp
 */
public class Jconnect {
    
        public static Connection connect() throws Exception
    {
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        
        return con;
    }
        

    
}
