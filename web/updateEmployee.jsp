
<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		String name; 
		
		String email,pass;
		String usertype;
		name=request.getParameter("txt_name"); //it is hidden id get for update record
		email=request.getParameter("txt_email");  //txt_name
		pass=request.getParameter("txt_pass"); //txt_owner
                usertype=request.getParameter("txt_usertype");
                
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update Employees set email=?, pass=?,usertype=? where name=?"); //sql update query 
                pstmt.setString(4,name);
		pstmt.setString(1,email);
		pstmt.setString(2,pass);
		pstmt.setString(3,usertype);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>JSP:Insert, Update, Delete using MySQL</title>
		
	<!--css for div main class and table-->
	<style type="text/css">
		
		
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
			border: 5px solid grey;
			
		}
</style>
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var name = document.myform.txt_name;
				var price = document.myform.txt_price;
				var quantity = document.myform.txt_quantity;
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (price.value == "")
				{
					window.alert("please enter owner ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
<body>

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
			<h1>Update Record</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				String name=request.getParameter("edit");
                                
		
				String email,pass;
                                 String usertype;
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from Employees where name=?"); // sql select query
				pstmt.setString(1,name);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					name=rs.getString(1);
					email=rs.getString(2);
					pass=rs.getString(3);
                                        usertype=rs.getString(4);
                                        
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="txt_name" value="<%=name%>"></td>
			</tr>
			
			<tr>
				<td>Email</td>
				<td><input type="text" name="txt_email" value="<%=email%>"></td>
			</tr>	
                        
                        <tr>
				<td>Password</td>
				<td><input type="text" name="txt_pass" value="<%=pass%>"></td>
			</tr>	
			
                         <tr>
				<td>Usertype</td>
                                <td><input type="text" name="txt_usertype" value="<%=usertype%>"></td>
			</tr>
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
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
				<h1><a href="Employees.jsp">Back</a></h1>
		</center>
		
	</form>

	</div>
	

</body>

</html>
