<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Template Name: PlusBusiness
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>E-DISTRIBUTED CHANNEL</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<link rel="stylesheet" href="./css/tables.css" type="text/css" />
<link rel="stylesheet" href="./css/forms.css" type="text/css" />
<link rel="stylesheet" href="./css/bootstarp.table.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
</head>
<body id="top" bgcolor="gray">

<!-- ####################################################################################################### -->
<div class="wrapper col1">
<h1><a href="index.jsp"></a><img src="images/dclog.jpg"width=1340 height=150></img></h1>
  <div id="header">
   
     <%
	if(request.getParameter("msg") != null){
		out.println("<h4 align='center' style='color: #B2C629;'> "+request.getParameter("msg"));	
	}
    
%>  
   
  
    <div id="topnav">
      <ul>
        <li class="active" ><a href="index.jsp">Home</a></li>     
        <li><a href="aboutus1.jsp">About Us</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>

		<table align="right" cellspacing="40"  width="10%" style="background-color:black; " > 
			<tr>
			<td><img alt="Web Store" src="./images/dcms1.jpg" width="1430" height="500"></td>
			
			<div id="topnav">
      <ul>
			
			
			<td><li><a href="AdminLogin.jsp">ADMIN</a></li></td>
			
			<td><li><a href="temp.jsp">USER</a></li></td>
			</ul>
			
			 
			
			</tr>
			
			
</table>



<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer" >
  </div>
</div>

		<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">E-DISTRIBUTED CHANNEL</a></p>
    <br class="clear" />
  </div>
</div>  
	</br>
</body>
</html>