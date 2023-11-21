<%@page import="com.dcms.bean.Retailer"%>
<%@page import="com.dcms.dao.RetailerDAO"%>
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
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="#">Manufacture</a>
          <ul>
            <li><a href="ManufactureInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Manufacture</a></li>
            <li><a href="ManufactureEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Manufacture</a></li>
            <li><a href="SelectManufacture.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select Manufacture</a></li>
            </ul>      
        </li>
        <li><a href="#">Dealer</a>
          <ul>
            <li><a href="DealerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Dealer</a></li>
            <li><a href="DealerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Dealer</a></li>
            <li><a href="SelectDealer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select Dealer</a></li>
            </ul>      
        </li>
        <li><a href="#">Retailer</a>
          <ul>
            <li><a href="RetailerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Retailer</a></li>
            <li><a href="RetailerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Retailer</a></li>
            <li><a href="Selectretailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select retailer</a></li>
            </ul>      
        </li>
                 
       <li><a href="#">View</a>
          <ul>
            <li><a href="ProductSelectAll5.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Product</a></li>
            <li><a href="ManufactureSelectAll2.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Manufacturers</a></li>
            <li><a href="DealerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Dealers</a></li>
            <li><a href="RetailerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Retailers</a></li>
            <li><a href="CustomerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Customers</a></li>
            </ul>      
          </li>
           <li><a href="#">Report</a>
          <ul>
            <li><a href="ManuSelectForm2.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacture Report</a></li>
            <li><a href="ManuProduct.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacture Product Report</a></li>
            <li><a href="RetailerPurOrder.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Purchase Order</a></li>
            <li><a href="RetailerProduct.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Product Report</a></li>
            
            </ul>      
          </li>
     </div>
   
  </div>

<%
		int rid=Integer.parseInt(request.getParameter("rid"));
         Retailer user = new RetailerDAO().getRet(rid) ;
%>

<form name="form" action="retailerupdate" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center"cellpading=20px cellspacing=30px border=6 bordercolor=white>
		<tr>
		<td align="center" colspan=2 style="color:black; background:orange;"> <big><b>Retailer Update</b></big></td></tr>

    

<tr><td>Retailer ID</td><td><input type="text" name="rid" readonly value="<%=user.getRid() %>"></td></tr>
<tr><td>Retailer Name</td><td><input type="text" name="rname" readonly value="<%=user.getRname() %>"></td></tr>
<tr><td> Address</td><td><input type="text" name="raddress" value="<%=user.getRaddress() %>"></td></tr>
<tr><td> City</td><td><input type="text" name="city" value="<%=user.getCity() %>"></td></tr>
<tr><td>Email Id </td><td><input type="text" name="remail" value="<%=user.getRemail() %>"></td></tr>
<tr><td> Phone Number</td><td><input type="text" name="rphone" value="<%=user.getRphone() %>"></td></tr>
<tr><td>Registration date</td><td><input type="text" name="reg_date" value="<%=user.getReg_date() %>"></td></tr>
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