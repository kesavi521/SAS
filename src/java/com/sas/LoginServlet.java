/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sas;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author student
 */
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String type = request.getParameter("type");
        if (type.matches("Admin")) {
            if (validate.LoginChecking(name, pass, type)) {
                out.println("Welcome  " + name);
                RequestDispatcher rs = request.getRequestDispatcher("AdminPage.jsp");
                rs.include(request, response);
            }
            else {
            out.println("Username or Password incorrect");
            RequestDispatcher rs = request.getRequestDispatcher("SignIn.jsp");
            rs.include(request, response);
        }
        } else if (type.matches("User")) {
            if (validate.LoginChecking(name, pass, type)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("login", "true");
                out.println("Welcome " + name);
                RequestDispatcher rs = request.getRequestDispatcher("UserHome.jsp");
                rs.include(request, response);
            }
            else {
            out.println("Username or Password incorrect");
            RequestDispatcher rs = request.getRequestDispatcher("SignIn.jsp");
            rs.include(request, response);
        }
        } else if (type.matches("Cashier")) {
            if (validate.LoginChecking(name, pass, type)) {
                out.println("Welcome " + name);
                RequestDispatcher rs = request.getRequestDispatcher("Cashier.jsp");
                rs.include(request, response);
            }
            else {
            out.println("Username or Password incorrect");
            RequestDispatcher rs = request.getRequestDispatcher("SignIn.jsp");
            rs.include(request, response);
        }
        } else if (type.matches("SalesClerk")) {
            if (validate.LoginChecking(name, pass, type)) {
                out.println("Welcome " + name);
                RequestDispatcher rs = request.getRequestDispatcher("SalesClerkHome.jsp");
                rs.include(request, response);
            }
            else {
            out.println("Username or Password incorrect");
            RequestDispatcher rs = request.getRequestDispatcher("SignIn.jsp");
            rs.include(request, response);
        }
        } else if (type.matches("Deliveryman")) {
            if (validate.LoginChecking(name, pass, type)) {
                out.println("Welcome " + name);
                RequestDispatcher rs = request.getRequestDispatcher("DeliveryHome.jsp");
                rs.include(request, response);
            }
            else {
            out.println("Username or Password incorrect");
            RequestDispatcher rs = request.getRequestDispatcher("SignIn.jsp");
            rs.include(request, response);
        }
        } 
    }

}

/*@Override
    /*protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("name");
        String pass=request.getParameter("pass");
        //String type=request.getParameter("type");
        if(validate.LoginChecking(name,pass)){
            System.out.println("login Success");
        }
        else{
            System.out.println("invalid");
        }
            
        }
    }
       if(request.getParameter("submit")!=null){
             
               if(type.matches("Admin")==true)
               {
                   if((validate.LoginChecking(name, pass,type)))
                {
               
                    RequestDispatcher rd=request.getRequestDispatcher("AdminPage.jsp");
                    rd.forward(request, response);
                }
                else{
                    JOptionPane.showMessageDialog(null, "New User has to SignUp");
                    RequestDispatcher rd=request.getRequestDispatcher("SignIn.jsp");
                    rd.forward(request, response);
                }
     
            }
                        if(type.matches("User")==true)
            {
                 if((validate.LoginChecking(name, pass,type)))
                {


                     HttpSession session=request.getSession();
                    session.setAttribute("username", name);
                    session.setAttribute("logged-in","true");
                    System.out.println("user page");
                    RequestDispatcher rd=request.getRequestDispatcher("UserHome.jsp");
                    rd.forward(request, response);
                    response.sendRedirect("UserHome.jsp");
                }
                else{
                    JOptionPane.showMessageDialog(null, "New User has to SignUp");
                    RequestDispatcher rd=request.getRequestDispatcher("SignIn.jsp");
                    rd.forward(request, response);
                }
     
            }
             
            if(type.matches("Cashier")==true)
            {
                 if((validate.LoginChecking(name, pass,type)))
                {

                                   HttpSession session=request.getSession();
                    session.setAttribute("username", name);
                    session.setAttribute("logged-in","true");
                    RequestDispatcher rd=request.getRequestDispatcher("Cashier.jsp");
                    rd.forward(request, response);
                }
                else{
                    JOptionPane.showMessageDialog(null, "New User has to SignUp");
                    RequestDispatcher rd=request.getRequestDispatcher("SignIn.jsp");
                    rd.forward(request, response);
                }
     
            }
              
            if(type.matches("SalesClerk")==true)
            {
                 if((validate.LoginChecking(name,pass,type)))
                {             
                    RequestDispatcher rd=request.getRequestDispatcher("SalesClerkHome.jsp");
                    rd.forward(request, response);
                }
                else{
                    JOptionPane.showMessageDialog(null, "New User has to SignUp");
                    RequestDispatcher rd=request.getRequestDispatcher("SignIn.jsp");
                    rd.forward(request, response);
                }
     
            }
               
            if(type.matches("Deliveryman")==true)
            {
               if((validate.LoginChecking(name,pass,type)))
                {
                     
                    RequestDispatcher rd=request.getRequestDispatcher("Deliveryman.jsp");
                    rd.forward(request, response);
                }
                else{
                    JOptionPane.showMessageDialog(null, "New User has to SignUp");
                    RequestDispatcher rd=request.getRequestDispatcher("SignIn.jsp");
                    rd.forward(request, response);
                }
     
            }
        
             }
    }
}*/
