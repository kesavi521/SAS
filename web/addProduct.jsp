<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS","root",""); //create connection 

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String product_name ,price,quantity;
		String id;
                
                //id=request.getParameter("txt_id");
		product_name=request.getParameter("txt_name"); //txt_name 
		price=request.getParameter("txt_price"); //txt_owner
                quantity=request.getParameter("txt_quantity");
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into products(product_name,price,quantity)values(?,?,?)"); //sql insert query 
                //pstmt.setString(1,id);
		pstmt.setString(1,product_name); 
		pstmt.setString(2,price);	
                pstmt.setString(3,quantity);
                
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
	
		<title>Add Product</title>
		
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
                    <center>
		<form method="post" name="myform"  onsubmit="return validate();">
	
			<center>
				<h1>Insert Record</h1>
			</center>
		
			
			<table>	
                          
		
				<tr>
					<td>Product_Name</td>
					<td><input type="text" name="txt_name"></td>
				</tr>
				
				<tr>
					<td>Price</td>
					<td><input type="number" name="txt_price"></td>
				</tr>	
                                
                                <tr>
					<td>Quantity</td>
					<td><input type="number" name="txt_quantity"></td>
				</tr>	
				
				<tr>
					<td><input type="submit" name="btn_add" value="Insert"></td>	
				</tr>
				
			</table>
			
				<center>
					<h1><a href="ProductList.jsp">Back</a></h1>
				</center>
				
		</form>
                    </center>
		</div>
		
		

</body>

</html>
