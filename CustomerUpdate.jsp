<%@page import="com.dcms.bean.Customer"%>
<%@page import="com.dcms.dao.CustomerDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dcms.bean.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-DISTRIBUTED</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<link rel="stylesheet" href="./css/tables.css" type="text/css" />
<link rel="stylesheet" href="./css/forms.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
</head>
<body id="top" bgcolor="gray">

<!-- ####################################################################################################### -->
<div class="wrapper col1">
<h1><a href="index.jsp"></a><img src="images/dclog.jpg"width=1340 height=150></img></h1>
  <div id="header">
   
    <div id="topnav">
         <ul>
          <li><a href="ManufactureSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Manufacturer</a></li>
         <li><a href="#">Product Manage</a>
        <ul>
         <li><a href="ProInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Product</a></li>
         <li><a href="ProductEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit Product</a></li>
          <li><a href="ProductSelectAll.jsp">Select All Product</a></li>
</ul>
         <li><a href="#">Product Manufacture Detail </a> 
         <ul>
        <li><a href="ProdManufDetailInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacturer Detail</a></li>
        <li><a href="ManuSelectForm.jsp">Select Manufacturer On Product</a></li>
        </ul>
         <li><a href="temp.jsp?sessionId=<%=request.getParameter("sessionId")%>">Home</a></li>
         <li><a href="Logout.jsp">Logout</a></li>
      </ul>
     </div>
<%
		int cid=Integer.parseInt(request.getParameter("cid"));
         Customer user = new CustomerDAO().getCus(cid) ;
%>

<form name="form" action="customerupdate" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center"cellpading=20px cellspacing=30px border=6 bordercolor=white>
		<tr>
		<td align="center" colspan=2 style="color:black; background:orange;"> <big><b>Customer Update</b></big></td></tr>

<tr><td>Customer ID</td><td><input type="text" name="cid" readonly value="<%=user.getCid() %>"></td></tr>
<tr><td>Customer Name</td><td><input type="text" name="cname" readonly value="<%=user.getCname() %>"></td></tr>
<tr><td>Gender</td><td><input type="text" name="cgender" readonly value="<%=user.getCgender() %>"></td></tr>
<tr><td>Customer Address</td><td><input type="text" row=4 col=4 name="caddress" readonly value="<%=user.getCaddress() %>"></td></tr>
<tr><td>Email Id</td><td><input type="text" name="cemail" value="<%=user.getCemail() %>"></td></tr>
<tr><td> Phone Number</td><td><input type="text" name="cphone" value="<%=user.getCphone() %>"></td></tr>

<tr><td>Registration Date</td><td><input type="text" name="reg_date" value="<%=user.getReg_date() %>"></td></tr>

<tr><td><input type="submit" value="UPDATE"></td><td><input type="reset" value="CANCEL"></td></tr>
</table></div>
</form>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer" >
  </div>
</div>

		<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">E-Distributed Channel</a></p>
    <br class="clear" />
  </div>
</div>  
	</br>
</body>
</html>