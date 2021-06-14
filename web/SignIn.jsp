<%-- 
    Document   : Login
    Created on : 2 Feb, 2021, 6:26:33 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <title>Login Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
       <style>
body, html {
  height: 100%;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

.bg-img {
  /* The image used */
  background-image: url("img_nature.jpg");

  min-height: 380px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

/* Add styles to the form container */
.container {
  position: absolute;
  right: 50%;
  margin: 20px;
  max-width: 300px;
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit button */
.btn {
  background-color: blue;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}


</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
    <body>
    

            <div class="bg-img"> 
                <form name="signin"action="LoginServlet" method="POST" class="container">
               <h1>Login</h1>
               <labe><b> Select Category</b></labe>
                         <select id="type" name="type">
                             <option value="Admin">Admin</option>
                             <option value="User">User</option>
                             <option value="Cashier">Cashier</option>
                             <option value="SalesClerk">SalesClerk</option>
                              <option value="Deliveryman">Deliveryman</option>
                         </select><br>
                    
                    
                         <label><b>User name</b></label>
                        <input type="text" class="form-control" name="name" placeholder="username">
                    
                    
                        <label><b>Password</b></label>
                        <input type="password"  class="form-control" name="pass" placeholder="password">
                    
                    
                        <label><b>New user?</b></label>
                        <a href="SignUp.jsp">Register</a>
                   
                   
                        <input  class="btn" name="submit" type="submit" value="submit"></td>
                   
               
                </form>
            </div>
    </body>
</html>
