<%@ page errorPage="LoginError.jsp" %>
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
<link rel="stylesheet" href="./css/forms.css" type="text/css" />
<link rel="stylesheet" href="./css/tables.css" type="text/css" />
<link rel="stylesheet" href="./css/featured_slide.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
</head>
<body id="top">
<!-- ####################################################################################################### -->
<div class="wrapper col1">
<h1><a href="index.jsp"></a><img src="images/dclog.jpg"width=1500 height=150></img></h1>
  <div id="header">
    
    
   
    <div id="topnav">
      <ul>
        <li><a href="temp.jsp">USER PAGE</a></li>
         <li><a href="index.jsp">LOGOUT</a></li>
      </ul>
    </div>
    <br class="clear" />
    
  </div>
</div>

	<form action="manulogconn.jsp" method="post">
		<table  height="135%" width="50%" cellspacing="18"> 
			<tr>
			<td rowspan="6">
			<img alt="Web Store" src="./images/Login-Icon.jpg" width="700" height="500"></img>
			</td>
			
			<td align="center" colspan=2 style="color:white; background:red; border-radius: 40px; font: italic"> <big>MANUFACTURE LOGIN</big></td></tr>
			<tr>
			<td style="color:black;">Manufacture Name </td>
			<td ><input type="text" name="uname"  placeholder="Enter Manufacture Name"  required="required" autofocus /></td>
			</tr>
			<tr>
				<td>Enter Password</td>
				<td><input type="password" name="pwd"  placeholder="Enter Password"  required="required" />
			</tr>
			<tr>
				<td align="center" style="color:black;"><input type="reset"/></td>
				<td align="center"><input type="submit" value="Login" /></td>
			</tr>
			<tr></tr>
			<tr></tr>		
</td>	
</tr>
</table>
<input type="hidden" name="role" value="manufacture">
</form>
    <br class="clear" />
		<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">E-DISTRIBUTED CHANNEL</a></p>
    <br class="clear" />
  </div>
</div>  	
</body>
</html>