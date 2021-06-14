<%-- 
    Document   : check
    Created on : 27 Feb, 2021, 9:25:52 AM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* This first section is a simple "reset". It allows the navbar to push up against the top of the browser window with no white space around it. This code also sets the default font for your whole page. Put it at the very top of your css page.  */
html, body, div, p, ul, li {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  font-family: 'Roboto', sans-serif;
  font-weight: 100;
}

/* This class is applied to the containing div <div class="nav"> and is used to set the background color and height of the navbar */
.nav {
  background: #000;
  height: 60px; /* set same as height & line-height below */
}

/* This rule centers the nav items verticaly in the bar with the height and line height properties. Spacing between the nav items is controlled by setting right and left padding.  */
.nav li {
  display: inline-block;
  list-style: none;
  height: 60px; /* should be the same as line-height */
  line-height: 60px; /* should be the same as height */
  padding: 0 40px; /* "0" sets top and bottom padding to none */
}

/* :hover allows you change the background color of the nav items when you mouse over them. Play around with the transition value to change the speed of the hover transition. */
.nav li:hover {
  background: red;
  transition: background .3s;
}

/* This rule is applied to the link <a> tag. It lets you turn off the link underline and set the link text color. */
.nav-link {
  color: #fff;
  text-decoration: none;
}
        </style>
    </head>
    <body>
        
        <div class="nav">
  <ul>
    <li><a href="#" class="nav-link">Home</a></li>
    <li><a href="#" class="nav-link"><em>Act Now!</em></a></li>
    <li><a href="#" class="nav-link">FAQ</a></li>
    <li><a href="#" class="nav-link">Contact Us</a></li>
  </ul>
</div>
    </body>
</html>
