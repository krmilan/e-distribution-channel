<%@page import="com.dcms.bean.Prod"%>
<%@page import="com.dcms.dao.ProDAO"%>
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
   
  </div>
  <%
		int pid=Integer.parseInt(request.getParameter("pid"));
         Prod user1 = new ProDAO().getPro(pid);
%>
       <form name="form" action="proupdate" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center"cellpading=20px cellspacing=30px border=6 bordercolor=white>
		<tr>
		<td align="center" colspan=2 style="color:black; background:orange;"> <big><b>Product Update</b></big></td></tr>

    


	
				<tr>
					<td>Product ID</td>
					<td><input type="text" name="pid" readonly value="<%=user1.getPid() %>"></td>
				</tr>
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="pname" readonly value="<%=user1.getPname() %>"></td>
				</tr>
				<tr>
					<td>Model</td>
					<td><input type="text" name="model" readonly value=" <%=user1.getModel() %>"></td>
				</tr>
				<tr>
					<td>Product Color</td>
					<td><input type="text" name="prod_color" readonly value=" <%=user1.getProd_color() %>"></td>
					
				</tr>
				<tr>
					<td>Dealer Price</td>
					<td><input type="text" name="dprice" value=" <%=user1.getDprice() %>"></td>
				</tr>
				<tr>
					<td>Retailer Price</td>
					<td><input type="text" name="rprice" value="<%=user1.getRprice() %> "></td>
				</tr>
				<tr>
					<td>Customer Price</td>
					<td><input type="text" name="cprice"  value="<%=user1.getCprice() %> "></td>
				</tr>
				
					<td style="color:black; background:orange;"><button type="submit">Save</button></td>
					<td style="color:black; background:orange;"><button type="reset">Clear</button></td>
				</tr>
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