<%@ page import="java.sql.*" %>
<%--
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		String hide; 
		
		String product_name,price;
		String quantity;
		hide=request.getParameter("txt_hide"); //it is hidden id get for update record
		product_name=request.getParameter("txt_name");  //txt_name
		price=request.getParameter("txt_price"); //txt_owner
                quantity=request.getParameter("txt_quantity");
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update products set product_name=?, price=?,quantity=? where id=?"); //sql update query 
                pstmt.setString(4,hide);
		pstmt.setString(1,product_name);
		pstmt.setString(2,price);
		pstmt.setString(3,quantity);
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
--%>
<html>

	<head>
	
		<title>OrderProduct</title>
		
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
  var r = confirm("Your order is successfully ordered! Thanks for using our service!");
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
                <form   action="orderproduct" method="post" onsubmit="return myFunction();" >
	
		<center>
			<h1>Enter your Details</h1>
		</center>
                    
		
		<table>	
		   <%
                       int orderid=0;
                       
                      
                        
                      
                    
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				String id=request.getParameter("edit");
                                
		
				String product_name,price;
                                 String quantity;
				PreparedStatement pstmt=null,pstmt2=null,pstmt3=null; 
                            ResultSet rs=null,rs1=null;// create statement
                                
                            
                                pstmt2=con.prepareStatement("select * from userorders");
                                rs1=pstmt2.executeQuery();
                                while(rs1.next()){
                                    orderid=rs1.getInt("orderid");
                                    
                                }
                                
                               
				
				pstmt=con.prepareStatement("select * from products where product_name=?"); // sql select query
				pstmt.setString(1,id);
				 rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getString(1);
					
					price=rs.getString(2);
                                        //quantity=rs.getString(4);
                                        
			%>
                        
                        <tr>
                            <td><input type="text" name="txt_hide" value="<%= orderid+1%>"></td>
                        </tr>
			<tr>
				<td>Product_Name</td>
				<td><input type="text" name="txt_name" value="<%= id%>"></td>
			</tr>
			
			<tr>
				<td>Price</td>
				<td><input type="number" name="txt_price" value="<%= price%>"></td>
			</tr>	
                        
                        <tr>
				<td>Quantity</td>
				<td><input type="number" name="txt_quantity"></td>
			</tr>	
                        <tr>
                            <td>Enter your Address</td>
                            <td> <input type="text" name="address" ></td>
                        </tr>
			<tr>
				<td><input type="submit" name="btn_update" value="order" ></td>	
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
				<h1><a href="ViewProducts.jsp">Back</a></h1>
		</center>
		
	</form>
            </center>
	</div>
	

</body>

</html>
