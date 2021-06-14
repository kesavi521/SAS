<%-- 
    Document   : SignUp
    Created on : 2 Feb, 2021, 6:28:17 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
        <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 10px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
 .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
  
  .btn {
  background-color: black;
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
button{
  background-color: blue;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
input[type=submit]
{
    background-color: blue;
}

}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
        
    </head>
     <script>
        function validate()
        {
          var  name=document.registerform.name.value;
            var pass=document.registerform.pass.value;
            var pass1=document.registerform.pass1.value;
            var phone=document.registerform.phone.value;
            //var email=document.registerform.email.
          // var pw=document.login.pwd.value;
           if(name==null||name==""||name==" ")
           {
               alert("name should not be empty");
               return false;
           }
            else if(pass.length<8 && pass1.length<8)
           {
                alert("password shoud contain atleast 8 characters");
               return false;
           }
           else if(pass!=pass1)
           {
               alert("passwords should be equal");
               return false;
           }
           else if(isNaN(phone))
           {
               document.getElementById("number").innerHTML="Enter numeric key only";
               return false;
           }
           else if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(registerform.email.value))
                {
                    return (true);
                 }
                 else{
                         alert("You have entered an invalid email address!");
                         return (false);
                 }
               
             return true;
            
        }
           
        
    </script>
    <body>
    <center><h1>Register Your Details Here!!</h1></center>
    <center>
    <div>
        <form class="modal-content" action="Register" method="POST" name="registerform" onsubmit="return validate()">
            <table>
                <tr>
                    <td><b>Select Category</b></td>
                        <td> <select id="type" name="usertype">
                             <option value="">Select type</option>
                             <option value="User">User</option>
                            </select></td>
                    </tr>
                     <tr>
                        <td><b>User name</b></td>
                        <td> <input type="text" class="form-control" name="name" placeholder="Enter username"></td>
                    </tr>
                    <tr>
                        <td><b>Password</b></td>
                        <td> <input type="password"  class="form-control" name="pass" placeholder="Enter password"></td>
                    </tr> 
                   
                    <tr>
                        <td><b>Re-Enter password</b></td>
                        <td><input type="password" class="form-control" name="pass1" value="" placeholder="Re Enter password"></td>
                    </tr>
                    <tr>
                        <td><b>Email</b></td>
                        <td> <input type="text" class="form-control" name="email" placeholder="Enter Emailid"></td>
                    </tr>
                    <tr>
                        <td><b>Phone</b></td>
                        <td><input type="text" class="form-control" name="phone" value="" placeholder="Enter Phone number"><span id="number"></span></td>
                    </tr>
                    <tr>
                        <td><b>Already Existing user?</b></td>
                        <td><a href="SignIn.jsp">SignIn</a></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <input type="submit" value="submit"></td>
                    </tr>
                    
            </table>
        </form>
    </div>
    </center>
    </body>
</html>
