/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author student
 */
public class validate {

    public static boolean LoginChecking(String name, String pass,String type) { //,String type 
        {
            boolean st = false;
            try {

                //loading drivers for mysql
                Class.forName("com.mysql.jdbc.Driver");

                //creating connection with the database
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS", "root", "");
                PreparedStatement ps = con.prepareStatement("select * from credential where name=? and pass=? and usertype=?");
                ps.setString(1, name);
                ps.setString(2, pass);
                ps.setString(3, type);
                ResultSet rs = ps.executeQuery();
                st = rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
            return st;
        }
    }
}
