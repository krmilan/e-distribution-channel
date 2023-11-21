<%@page import="com.dcms.bean.Manufacture"%>
<%@page import="com.dcms.dao.ManufactureDAO"%>
<%@page import="com.dcms.bean.Login"%>
<%@page import="com.dcms.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Distributed</title>
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
            <li><a href="Selectretailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Viewretailer</a></li>
            </ul>      
        </li>
                 
       <li><a href="#">View All</a>
          <ul>
            <li><a href="ProductSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Product</a></li>
            <li><a href="ManufactureSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Manufacturers</a></li>
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
  
    <br class="clear" />
  <% 
     if(request.getParameter("msg") != null){
 		out.println("<h4 align='center' style='color: #B2C629;'> "+request.getParameter("msg"));	
 	}
%>
<%
}else{
	%>
	
	<jsp:forward page="AdminLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
</div>
			
			
			</head>
			
				
					 <div id="print" style="height:100%;width:100%; ">
					<form name="dealform" id=payment>
						<br>
						<br>
						
						<table align="center"><br><br><br>
<tr><td><b>Select Dealer Name </b></td><td>
<td>
			<select name="search" selected="selected" required="required">
			<%
			
			String sql1 = "select distinct dname from dealer";
			GetConnection gc1 = new GetConnection();
			gc1.ps = GetConnection.getMysqlConnection().prepareStatement(sql1);
			gc1.rs1 = gc1.ps.executeQuery();
			while(gc1.rs1.next())
			{
				%>
				<option value="<%=gc1.rs1.getString(1)%>"><%=gc1.rs1.getString(1)%></option><% 
			}
			%>
			
			</select>
		</td><td><input type=submit value="Search" ></td></tr>
				</table><br><br>
					<div id="print" style="height: 360px;">
						<table align="center" border="1" bordercolor="#B2C629">
							<tr bgcolor="black">
								<th style="color: #B2C629;">Dealer Id</th>
								<th style="color: #B2C629;">Dealer Name</th>
								<th style="color: #B2C629;">Dealer Address</th>
								<th style="color: #B2C629;">Dealer Email</th>
								<th style="color: #B2C629;">Dealer Phone</th>
								<th style="color: #B2C629;">Registration Date</th>
<th style="color: #B2C629;">City</th>
							</tr>
							<%
								String search = request.getParameter("search");
								System.out.println(search);
								String sql = "select distinct did,dname,daddress,demail,dphone,reg_date,city from dealer where dname='"+search+"'";
										
								GetConnection gc = new GetConnection();
								gc.ps = GetConnection.getMysqlConnection().prepareStatement(sql);
								gc.rs1 = gc.ps.executeQuery();
								if (gc.rs1.next()) {
									gc.rs1.previous();
									while (gc.rs1.next()) {
							%>
							<tr>
								<td><%=gc.rs1.getInt(1)%></td>
								<td><%=gc.rs1.getString(2)%></td>
							    <td><%=gc.rs1.getString(3)%></td>
								<td><%=gc.rs1.getString(4)%></td>
								<td><%=gc.rs1.getLong(5)%></td>
								<td><%=gc.rs1.getString(6)%></td>
								<td><%=gc.rs1.getString(7)%></td>
							</tr>
							<%
								}
								} 
							%>
							<tr>
						</table>
					</div>
				</form>
				<!-- ####################################################################################################### -->
				<div class="wrapper col4">
					<div id="footer"></div>
				</div>

				<!-- ####################################################################################################### -->
				<div class="wrapper col5">
					<div id="copyright">
						<p class="fl_left">
							Copyright &copy; 2016 - All Rights Reserved - <a href="#">E-Distributed
								Channel</a>
						</p>
						<br class="clear" />
					</div>
				</div>
				</br>
			</body>
</html>