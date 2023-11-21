<%@page import="com.dcms.connection.GetConnection"%>
<%@page import="com.dcms.bean.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<%@ include file="connection.jsp"%>

<%@ page isErrorPage="true"%>

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
<title>E-Distributed Channel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript"
	src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript"
	src="layout/scripts/jquery.jcarousel.setup.js"></script>
<script>
	function printDiv(print) {
		//Get the HTML of div
		var divElements = document.getElementById(print).innerHTML;
		//Get the HTML of whole page
		var oldPage = document.body.innerHTML;

		//Reset the page's HTML with div's HTML only
		document.body.innerHTML = "<html><head><title></title></head><body>"
				+ divElements + "</body>";

		//Print Page
		window.print();

		//Restore orignal HTML
		document.body.innerHTML = oldPage;

	}
</script>
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
        <li class="active"><a href="temp.jsp">Home</a></li>
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
            <li><a href="ManufactureSelectAll2.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Manufacturers</a></li>
            <li><a href="DealerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Dealers</a></li>
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
   </div>
   <%
}else{
	%>
	
	<jsp:forward page="AdminLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
						 <br class="clear" /> <%
 	if (request.getParameter("msg") != null) {
 		out.println("<h4 align='center' style='color: #B2C629;'> " + request.getParameter("msg"));
 	}
 %>
			
		<div align="center">
			<h2>
				<br></br><b>Retailer Product Detail</b>
			</h2>
		</div>
		<form method="post">
			<table align="center">
				<tr>
					<br><br><td><h5>Date From</h5></td>
					<td><input type=date name="search"></td>
					<td><h5>To</h5></td>
					<td><input type=date name="search1"></td>
					<td><input type=submit value="search"></td>
				</tr>
			</table>
			<div id="print" style="height: 360px; overflow: auto">
				<table align="center" border="1" bordercolor="#B2C629">
					<br></br><tr bgcolor="black">
						<th style="color: #B2C629;">Retailer Name</th>
						<th style="color: #B2C629;">Retailer Email Id</th>
						<th style="color: #B2C629;">Retailer Phone Number</th>
						<th style="color: #B2C629;">Product Name</th>
						<th style="color: #B2C629;">Quantity</th>
						<th style="color: #B2C629;">Retailer Price</th>
						<th style="color: #B2C629;">Date Of Purchase</th>
					</tr>


					<%
						String search = request.getParameter("search");
						String search1 = request.getParameter("search1");
						String nam = "select r.rname,r.remail,r.rphone,p.pname,rp.rqty,p.rprice,rp.rpodate from rpur_order rp,prod_mrf_detail pf,retailer r,product p where rp.rid=r.rid and rp.rpmid=pf.pmid and pf.pid=p.pid and rp.rpodate>='"
								+ search + "' and rp.rpodate<='" + search1 + "'";

						Statement st=conn.createStatement();
						ResultSet rs=st.executeQuery(nam);
						{
							rs.previous();
							if(rs.next())
							{
							%>


					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getLong(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getInt(5)%></td>
						<td><%=rs.getFloat(6)%></td>
						<td><%=rs.getString(7)%></td>
					</tr>

					<%
						}
						}
					%>


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