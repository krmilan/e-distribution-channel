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
   <%
	if (request.getParameter("msg") != null) {
		out.println("<h4 align='center' style='color: #B2C629;'> " + request.getParameter("msg"));
	}
%>
<%
	try {
		if ((session.getAttribute("user")).equals(null)) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	} catch (NullPointerException npe) {
		npe.printStackTrace();
%>
<jsp:forward page="index.jsp?msg=invalidate user" />
<%
	}
%>
<%
	String user = session.getAttribute("user").toString();
%>
<p style="color: #B2C629;" align="right">
	Logged in as :
	<%=user%>

	<a class=a href="index.jsp">LogOut</a>
</p>
     <div id="topnav">
         <ul>
         <li><a href="ManufactureSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Manufacturer</a></li>
         <li><a href="#">Product Manage</a>
        <ul>
         <li><a href="ProInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Product</a></li>
         <li><a href="ProductEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit Product</a></li>
         <li><a href="SelectProForm.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select Product</a></li>
          <li><a href="ProductSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select All Product</a></li>
</ul>
         <li><a href="#">Product Manufacture Detail </a> 
         <ul>
        <li><a href="ProdManufDetailInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacturer Detail</a></li>
        <li><a href="ManuSelectForm.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select Manufacturer On Product</a></li>
        </ul>
        
           <li><a href="ManufactureHome.jsp">Home</a></li>
      </ul>
    </div>
     
  </div>

<form action="proinsert">
<table align="center" border=3 cellspacing="40"  width="30" style=" bordercolor="white"  > 
			<tr>
		<td rowspan="15">
		<img alt="Ad Store" src="./images/service/2.jpg" width="650" height="540"></img><br></br>
	</td>
		<td align="center" colspan=2 style="color:white; background: #B2C629;"> <big>ENTER PRODUCT DETAILS</big></td></tr>
			<tr>
				<td>Enter product name</td>
				<td><input type="text" name="pname" placeholder="Enter Product Name" required="required"></td>
			</tr>
			<tr>
				<td>Enter product Model</td>
				<td><input type="text" name="model" placeholder="Enter Model" required="required"></td>
			</tr>
			<tr>
				<td>Enter product_color</td>
				<td><input type="text" name="prod_color" placeholder="Enter Product Color" required="required"></td>
			</tr>
			<tr>
				<td>Enter Dealer Price</td>
				<td><input type="text" name="dprice" placeholder="enter Dealer Price" required="required"></td>
			</tr>
			<tr>
				<td>Enter Retailer price</td>
				<td><input type="text" name="rprice" placeholder="enter Retailer Price" required="required"></td>
			</tr>
			<tr>
				<td>Enter Customer Price</td>
				<td><input type="text" name="cprice" placeholder="enter Customer Price" required="required"></td>
			</tr>
			
			
			<tr>
				<td><input type="submit" value="ADD"></td>
				<td><input type="reset" value="CLEAR"></td>
			</tr>
			</table>
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
