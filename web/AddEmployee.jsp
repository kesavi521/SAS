<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); //create connection 

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String name ,email,pass,usertype;
		
                
                name=request.getParameter("txt_name");
		email=request.getParameter("txt_email"); 
		pass=request.getParameter("txt_pass"); 
                usertype=request.getParameter("txt_usertype");
		
		PreparedStatement pstmt=null; 
		
		pstmt=con.prepareStatement("insert into Employees(name,email,pass,usertype)values(?,?,?,?)"); 
                pstmt.setString(1,name);
		pstmt.setString(2,email); 
		pstmt.setString(3,pass);	
                pstmt.setString(4,usertype);
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Add employess</title>
		
		<!--css for div main class and table -->
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
			border: 5px solid grey;
			
		}
</style>
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var name = document.myform.txt_name;
				var email = document.myform.txt_email;
                                var pass = document.myform.txt_pass;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (email.value == "")
				{
					window.alert("please enter email ?");
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
				<h1>Insert Record</h1>
			</center>
		
			
			<table>	
                            <tr>
					<td>Name</td>
					<td><input type="text" name="txt_name"></td>
				</tr>
		
				<tr>
					<td>Email</td>
					<td><input type="text" name="txt_email"></td>
				</tr>
				
				<tr>
					<td>Password</td>
					<td><input type="text" name="txt_pass"></td>
				</tr>	
                                
                                <tr>
					<td>Usertype</td>
					<td><input type="text" name="txt_usertype"></td>
				</tr>	
				
				<tr>
					<td><input type="submit" name="btn_add" value="Insert"></td>	
				</tr>
				
			</table>
			
				<center>
					<h1><a href="Employees.jsp">Back</a></h1>
				</center>
				
		</form>
		
		</div>
		
		

</body>

</html>

