<%@page import="java.sql.*" %>


<html>

	<head>
	
		<title>View bills</title>
		
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
				<th>ID</th>
				<th>Product_Name</th>
				<th>Price</th>
                                <th>Quantity</th>
                                <th>Address</th>
				<th>Total Bill</th>
				
			</tr>
		<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root","");  //creat connection 

			PreparedStatement pstmt=null; //create statement
		
			pstmt=con.prepareStatement("select * from billdata"); //sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getInt(6)%></td>
					
					
					
					
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
