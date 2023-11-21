<%@ page import= "com.dcms.bean.Dealer"%>
<%@ page import= "com.dcms.dao.DealerDAO" %>
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
	Login user = (Login)session.getAttribute("USER");

if(user!=(null)){
	%>
	<div align="right">you logged in as <%=user.getUname() %>
	 <a class=a href="index.jsp">LogOut</a>
	  </div>

    <div id="topnav">
      <ul>
        <li ><a href="temp.jsp">Home</a></li>
        <li><a href="#">Manufacture</a>
          <ul>
            <li><a href="ManufactureInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Manufacture</a></li>
            <li><a href="ManufactureEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Manufacture</a></li>
            <li><a href="SelectManufacture.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Manufacture</a></li>
            </ul>      
        </li>
        <li><a href="#">Dealer</a>
          <ul>
            <li><a href="DealerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Dealer</a></li>
            <li><a href="DealerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Dealer</a></li>
            <li><a href="SelectDealer.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Dealer</a></li>
            </ul>      
        </li>
        <li><a href="#">Retailer</a>
          <ul>
            <li><a href="RetailerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Retailer</a></li>
            <li><a href="RetailerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Retailer</a></li>
            <li><a href="Selectretailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">View retailer</a></li>
            </ul>      
        </li>
                 
       <li><a href="#">View All</a>
          <ul>
            <li><a href="ProductSelectAll5.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Product</a></li>
            <li><a href="ManufactureSelectAll2.jsp?sessionId=<%=request.getParameter("sessionId")%>">View V Manufacturers</a></li>
            <li class="active"><a href="DealerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Dealers</a></li>
            <li><a href="RetailerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Retailers</a></li>
            <li><a href="CustomerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Customers</a></li>
            </ul>      
          </li>
          <li><a href="#">Report</a>
          <ul>
            <li><a href="ManuSelectForm2.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacture Report</a></li>
            <li><a href="ManuProduct.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacture Product Report</a></li>
            <li><a href="RetailerPurOrder.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Purchase Order</a></li>
            <li><a href="RetailerProduct.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Product Report</a></li>
            <li><a href="repdealerdate.jsp?sessionId=<%=request.getParameter("sessionId")%>">Dealer Product Report</a></li>
            <li><a href="repretailerdate.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Product Report</a></li>
             <li><a href="repcustomerdate.jsp?sessionId=<%=request.getParameter("sessionId")%>">Customer Product Report</a></li>
            
            </ul>      
            </ul>
    </div>
    <%
}else{
	%>
	
	<jsp:forward page="AdminLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
 
<body><br><br>
<table align="center" border="10" bordercolor="black"><br><br>
<tr style="color:purple;font-size:100%">
<th>Dealer Name</th>
<th>Dealer Address</th>
<th>Dealer Email ID</th>
<th>Dealer Phone Number</th>
<th>Registration Date</th>
<th>dealer City</th>
</tr>
<%
     for(Dealer temp : new DealerDAO().getAllDeal()){
%>
<tr style="color:white">
   <td><%=temp.getDname()%></td>
    
    <td><%=temp.getDaddress() %></td>
    <td><%=temp.getDemail() %></td> 
    <td><%=temp.getDphone() %></td> 
    <td><%=temp.getReg_date() %></td> 
    <td><%=temp.getCity() %></td> 
        </tr>
    <%
     }
    %>
</table><br><br><br>
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