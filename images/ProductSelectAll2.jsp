<%@ page import= "com.dcms.bean.Prod"%>
<%@ page import= "com.dcms.dao.ProDAO" %>
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
<body  bgcolor="blue">
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="index.jsp">E-DISTRIBUTED CHANNEL</a></h1>
    </div>
  <div align="right">
    <h3>You Logged In As:manu</h3>
</div>
    <div id="topnav">
      <ul>
        <li><a href="DealerInsert.jsp">Dealer Registration</a></li>
         <li><a href="ProductSelectAll2.jsp">View Product</a></li>
         <li><a href="DPurOrderInsert.jsp">Purchase Order</a></li>
         <li><a href="DBill.jsp">Dealer Bill</a></li>
        <li><a href="RetailerInsert.jsp">Add Retailer</a></li>
         <li><a href="index.jsp">Home</a></li>
         <li><a href="temp.jsp">Logout</a></li>
      </ul>
    </div> 
   
  </div>
<br>
<table align="center" border="10" bordercolor="orange">
<tr>
<th>Product Name</th>
<th>Product Model</th>
<th>product color</th>
<th>Product dealer price</th>
<th>Product reatailer price</th>
<th>Product Customer price</th>
</tr>
<%
     for(Prod temp : new ProDAO().getAllProd()){
%>
<tr>
   <td><%=temp.getPname() %></td>
   <td><%=temp.getModel() %></td>
  <td><%=temp.getProd_color() %></td>
   <td><%=temp.getDprice() %></td> 
    <td><%=temp.getRprice() %></td> 
    <td><%=temp.getCprice() %></td> 
    </tr>
    <%
     }
    %>
</table>
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