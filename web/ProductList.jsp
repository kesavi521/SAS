<%@page import="java.sql.*" %>
<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root","");  //create connection 

	if(request.getParameter("delete")!=null)
	{
		String name=request.getParameter("delete");
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("delete from products where product_name=? "); //sql delete query
		pstmt.setString(1,name);
                
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	

<html>

	<head>
	
		<title>Products</title>
		
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
		
			<center>
				<h1><a href="addProduct.jsp">Add Product</a></h1>	
			</center>
		
		<table id="customers">
		
			<tr>
				
				<th>ProductName</th>
				<th>Price</th>
                                <th>Quantity</th>
				<th>Update</th>
                                <th>Delete</th>
			</tr>
		<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root","");  //creat connection 

			PreparedStatement pstmt=null; //create statement
		
			pstmt=con.prepareStatement("select * from products"); //sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
                                       
                                        
                                        <td><a href="updateProduct.jsp?edit=<%=rs.getString(1)%> " target="_self">Update</a></td>
                                        <td><a href="?delete=<%=rs.getString(1)%> ">Delete</a></td>
					
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
                <center>
				<h1><a href="AdminPage.jsp">Back</a></h1>
		</center>
		
		</div>
		
			
		
</body>

</html>