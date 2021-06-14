<%-- 
    Document   : AdminPage
    Created on : 3 Feb, 2021, 8:39:09 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="index.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminPage</title>
    </head>
    <body>
        <% 
            
//            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//http1.1
//            response.setHeader("Pragma","no-cache");//http 1.0
//            response.setHeader("Expires","0");//proxies
//            if(session.getAttribute("username")==null)
//            {
//                response.sendRedirect("SignIn.jsp");
//          }
        %>
        <!--Welcome ${username}-->
        <nav class="fixed-nav-bar-top">
		<ul class="nav">
			<li><a href="home.html" target="">Home</a></li>
                        <li><a href="ProductList.jsp" target="">ViewProducts</a></li>
                        <li><a href="Employees.jsp" target="">Employees</a></li>
                        <li><a href="ViewApprovedOrders.jsp" target="">View Approved Orders</a></li>
                        <li><a href="ViewBills.jsp" target="">Yearly Sales</a></li>
			<li><a href="home.html" target="">Logout</a></li>	
		</ul>
		</nav>
        <h1></h1>
        <!--<form action="index.html">
            <input type="submit" value="logout">
        </form>
        -->
    </body>
</html>

