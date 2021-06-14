<%-- 
    Document   : SalesClerkHome
    Created on : 9 Feb, 2021, 3:48:12 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="index.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SalesClerk Page</title>
        <script>
		function myFunction() {
  var txt;
  var r = confirm("No assigned orders available");
  if (r == true) {
    txt = "You pressed OK!";
  }
  document.getElementById("demo").innerHTML = txt;
}
			
		</script>
    </head>
    <body>
    <nav class="fixed-nav-bar-top">
		<ul class="nav">
			<li><a href="home.html" target="">Home</a></li>
                        <li><a href="ViewAssignedOrders.jsp"> View Assigned orders</a></li>
			<li><a href="home.html" target="">Logout</a></li>	
		</ul>
		</nav>
  
    </body>
</html>
