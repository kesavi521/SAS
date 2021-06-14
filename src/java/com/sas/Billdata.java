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
public class Billdata extends HttpServlet {

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
        ResultSet rs=null;
        int i=0,j=0,k=0;
        String username="";
        String id=request.getParameter("txt_hide");
        HttpSession session=request.getSession();
        session.setAttribute("orderid",id);
        session.setAttribute("check","true");
        String name=request.getParameter("txt_name");
        String price=request.getParameter("txt_price");
         String qty=request.getParameter("txt_quantity");
         String address=request.getParameter("address");
         String bill=request.getParameter("total");
         HttpSession session1=request.getSession();
         if(session1.getAttribute("login")!=null){
             username=(String) session1.getAttribute("username");
         }
         int ii=Integer.parseInt(id);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root","");
            String query="insert into billdata values(?,?,?,?,?,?)";
           String query1="insert into Approvedorders values(?,?,?,?,?)";
           String query2="insert into userorderid values(?,?)";
             PreparedStatement ps2=con.prepareStatement(query2);
             ps2.setString(1,username);
             ps2.setInt(2, ii);
             k=ps2.executeUpdate();
            PreparedStatement ps1=con.prepareStatement(query1);
            ps1.setString(1, id);
            ps1.setString(2, name);
            ps1.setString(3, price);
             ps1.setString(4, qty);
             ps1.setString(5, address);
             j=ps1.executeUpdate();
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, price);
             ps.setString(4, qty);
             ps.setString(5, address);
             ps.setString(6,bill);
            i=ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Billdata.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Billdata.class.getName()).log(Level.SEVERE, null, ex);
        }
         if(i>0 && j>0 && k>0){
            JOptionPane.showMessageDialog(null,"success");
             RequestDispatcher rd=request.getRequestDispatcher("Vieworders.jsp");
             rd.forward(request, response);
      
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Billdata</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Billdata at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
