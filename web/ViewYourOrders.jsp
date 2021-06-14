<%-- 
    Document   : ViewYourOrders
    Created on : 5 Mar, 2021, 11:39:52 AM
    Author     : student
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            HttpSession se=request.getSession();
            String name=null;
            if(se.getAttribute("login")!=null){
               name=(String)se.getAttribute("username");
            }
        %>


<html>

	<head>
	
		<title>JSP:view products</title>
		
		<!--css for div main class and table -->
		<style>
                    table{
                        margin-left: 120px;
                    }
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: black;
  color: white;
}
</style>
		
		
	</head>	
	
<body>
		<div class="main">
		
			
		
		<table id="customers">
		
			<tr>
				
				<th>Orderid</th>
				<th>Productname</th>
                                <th>price</th>
				<th>Quantity</th>
                                <th>TotalBill</th>
                                <th>Status</th>
				
			</tr>
		<%
		
		try
		{	
                    
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root","");  //creat connection 

			PreparedStatement pstmt=null,pstmt2=null; //create statement
		
			pstmt=con.prepareStatement("select orderid from userorderid where username=?");
                        pstmt.setString(1,name);//sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
				<tr>
					
                                        <%
                                            pstmt2=con.prepareStatement("select * from billdata where pid=?");
                                            pstmt2.setString(1, Integer.toString(rs.getInt("orderid")));
                                            ResultSet rs1=pstmt2.executeQuery();
                                            while(rs1.next()){
                                                
                                            
                                        %>
                                        
					<td><%=rs1.getString(1)%></td>
					<td><%=rs1.getString(2)%></td>
                                        <td><%=rs1.getString(3)%></td>
                                        <td><%=rs1.getString(4)%></td>
                                        
                                        <td><%=rs1.getString(6)%></td>
					
					<td><a href="status2.html">Status</a></td>
					
					
				</tr>
		<%
                    }
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
                <center>
				<h1><a href="UserHome.jsp">Back</a></h1>	
			</center>
		
		</div>
		
			
		
</body>

</html>
