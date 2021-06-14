<%-- 
    Document   : ApprovedOrders
    Created on : 27 Feb, 2021, 9:04:17 PM
    Author     : student
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	
		<title>Packed Items</title>
		
	<!--css for div main class and table-->
	<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: black;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: black;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid ;
			
		}
</style>
		
		<!-- javascript for form validation-->
		<script>
		function myFunction() {
  var txt;
  var r = confirm("Packed Successfully");
  if (r == true) {
    txt = "You pressed OK!";
  }
  document.getElementById("demo").innerHTML = txt;
}
			
		</script>
		
	</head>
	
<body>

	<div class="main">
            <center>
                <form   action="Packeditems" method="post" onsubmit="return myFunction();">
	
		<center>
			<h1>Pack Here</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				String pid=request.getParameter("edit");
                                
		
				String pname,price;
                                 String qty;
                                 String address;
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from Assignedorders where pid=?"); // sql select query
				pstmt.setString(1,pid);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					pid=rs.getString(1);
					pname=rs.getString(2);
					price=rs.getString(3);
                                        qty=rs.getString(4);
                                        address=rs.getString(5);
                                        
			%>
                        <tr>
                            <td><input type="text" name="txt_hide" value="<%= pid%>"></td>
                        </tr>
			<tr>
				<td>Product_Name</td>
				<td><input type="text" name="txt_name" value="<%= pname%>"></td>
			</tr>
			
			<tr>
				<td>Price</td>
				<td><input type="number" name="txt_price" value="<%= price%>"></td>
			</tr>	
                        
                        <tr>
				<td>Quantity</td>
                                <td><input type="number" name="txt_quantity" value="<%= qty%>"></td>
			</tr>	
                        <tr>
                            <td>Address</td>
                            <td> <input type="text" name="address" value="<%= address%>"></td>
                        </tr>
			<tr>
				<td><input type="submit" name="btn_update" value="Pack" ></td>	
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
				<h1><a href="ViewAssignedOrders.jsp">Back</a></h1>
		</center>
		
	</form>
            </center>
	</div>
	

</body>

</html>


