<%@ page import= "com.dcms.bean.Prod"%>
<%@ page import= "com.dcms.dao.ProDAO" %>
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
   
  <form name="form" id=payment>
  <h2 align="center" color="blue">View All Product Detail</h2><br><br>
<div id="print" style="height:400px;width:1000px; overflow:auto">
<table  cellspacing=7 cellpadding=5 border=6 bordercolor=white>

<tr style="color:green">
<th>Product Name</th>
<th>Product Model</th>
<th>product color</th>
<th>Product dealer price</th>
<th>Product retailer price</th>
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
</div></div>
</div></form>

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