<%@page import="com.dcms.connection.GetConnection"%>
<%@page import="com.dcms.bean.Manufacture"%>
<%@ page import="com.dcms.dao.ManufactureDAO" %>
<%@page import="com.dcms.dao.DealerDAO"%>
<%@page import="com.dcms.bean.Dealer"%>
<%@page import="com.dcms.bean.ProdManuDetail" %>
<%@page import="com.dcms.dao.ProdManufDetailDAO" %>
<%@page import="com.dcms.bean.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="connection.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<link rel="stylesheet" href="./css/tables.css" type="text/css" />
<link rel="stylesheet" href="./css/forms.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>

<script type="text/javascript">
	function fnSubmitProj(){
		// this is submitting page to the servlet... 
		document.empform.action ="DPurView.jsp";
		document.empform.submit();
		
	}
</script></head>
<body id="top" bgcolor="gray">

<!-- ####################################################################################################### -->
<div class="wrapper col1">
<h1><a href="index.jsp"></a><img src="images/dclog.jpg"width=1340 height=150></img></h1>
  <div id="header">
      <%
	Login user = (Login)session.getAttribute("USER");

if(user!=(null)){
	%>
	 <div align="right">you logged in as <%=user.getUname() %> </div>
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
         <li><a href="index.jsp">Home</a></li>
         <li><a href="Logout.jsp">Logout</a></li>
      </ul>
    </div>
    <%
}else{
	%>
	
	<jsp:forward page="DealerLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
  		<form name="empform" action="DPurView" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center" cellpading=20px cellspacing=30px border=6 bordercolor=white>
		<tr>
		<td align="center" colspan=2 style="color:black; background:orange;"> <big><b>Select Dealer Name </b></big></td></tr>
		
			<tr>
<td><select name="pro" onChange="fnSubmitProj()" align="center" >
	<%
		for(Dealer temp : new DealerDAO().getAllDeal()){
	%>

			<option value="<%=temp.getDname() %>"><%=temp.getDname() %></option>	

	<%
		}
	%>
	
 </select></td></tr>
 </table>
 <table align="center" border="1" bordercolor="#B2C629">
	<tr bgcolor="black">
	<th style="color:#B2C629;">Dealer Name</th>
	<th style="color:#B2C629;">Dealer PurchaseOrder Number</th>
	<th style="color:#B2C629;">PurchaseOrder date</th>
	<th style="color:#B2C629;">Product quantity</th>
	<th style="color:#B2C629;">Product Name</th>
	<th style="color:#B2C629;">Manufacture Name</th>
	</tr>
		<tr>	

<%
String nam="select d.dname,dp.dpono,dp.dpodate,dp.dqty,p.pname,m.mname from dpur_order dp,dealer d,prod_mrf_detail pm,product p,manufacture m where dp.did=d.did and dp.dpmid=pm.pmid and pm.pid=p.pid and d.dname='"+ request.getParameter("pro") +"'group by dname";
GetConnection gc = new GetConnection();

gc.ps = GetConnection.getMysqlConnection().prepareStatement(nam);
gc.rs1 = gc.ps.executeQuery();
if(gc.rs1.next())
{
	gc.rs1.previous();

while(gc.rs1.next())
{
	
%>
<tr>
<td><%=gc.rs1.getString(1) %></td>
<td><%=gc.rs1.getInt(2) %></td>
<td><%=gc.rs1.getString(3) %></td>
<td><%=gc.rs1.getInt(4) %></td>
<td><%=gc.rs1.getString(5) %></td>
<td><%=gc.rs1.getString(6) %></td>
</tr>

<%}
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