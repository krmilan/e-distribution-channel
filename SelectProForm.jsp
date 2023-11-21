<%@page import="com.dcms.bean.Login"%>
<%@page import="com.dcms.bean.Prod"%>
<%@page import="com.dcms.dao.ProDAO"%>
<%@page import="com.dcms.connection.GetConnection"%>
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
     
<script type="text/javascript">
      function fnSubmitPro(){
    	  document.proform.action="proselect.do";
    	  document.proform.submit();
      }
</script>


 <div id="print" style="height:100%;width:100%; ">
					<form name="proform" id=payment>
						<br>
						<br>
						
						<table align="center"><br><br><br>
<tr><td><b>Select Product Name </b></td><td>
<td>
			<select name="search" selected="selected" required="required">
			<%
			
			String sql1 = "select distinct pname from product";
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
								<th style="color: #B2C629;">Product Id</th>
								<th style="color: #B2C629;">Product Name</th>
								<th style="color: #B2C629;">Product Model</th>
								<th style="color: #B2C629;">Product Color</th>
								<th style="color: #B2C629;">Dealer Price</th>
								<th style="color: #B2C629;">Retailer Price</th>
								<th style="color: #B2C629;">Customer Price</th>

							</tr>
							<%
								String search = request.getParameter("search");
								System.out.println(search);
								String sql = "select distinct pid,pname,model,prod_color,dprice,rprice,cprice from product where pname='"+search+"'";
										
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
								<td><%=gc.rs1.getDouble(5)%></td>
								<td><%=gc.rs1.getDouble(6)%></td>
								<td><%=gc.rs1.getDouble(7)%></td>
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