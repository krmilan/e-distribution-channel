<%@page import="com.dcms.connection.GetConnection"%>
<%@page import="com.dcms.bean.Manufacture"%>
<%@ page import="com.dcms.dao.ManufactureDAO" %>
<%@page import="com.dcms.dao.ProDAO"%>
<%@page import="com.dcms.bean.Prod"%>
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
		document.empform.action ="ManuProduct.jsp";
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
            <li><a href="SelectDealer.jsp?sessionId=<%=request.getParameter("sessionId")%>">View  Dealer</a></li>
            </ul>      
        </li>
        <li><a href="#">Retailer</a>
          <ul>
            <li><a href="RetailerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Retailer</a></li>
            <li><a href="RetailerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Retailer</a></li>
            <li><a href="Selectretailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">View  retailer</a></li>
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
    </div><br><br>
    <%
}else{
	%>
	
	<jsp:forward page="AdminLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
  		<form name="empform" action="ManuProduct" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<br><br><table align="center" cellpading=20px cellspacing=30px border=6 bordercolor=white>
		<tr>
		<td align="center" colspan=2 style="color:black; background:orange;"> <big><b>Select Manufacture Name</b></big></td></tr>
		
			<tr>
<td><select name="pro" onChange="fnSubmitProj()" align="center" >
	<%
		for(Manufacture temp : new ManufactureDAO().getAllManu()){
	%>

			<option value="<%=temp.getMname() %>"><%=temp.getMname() %></option>	

	<%
		}
	%>
	
 </select></td></tr>
 </table>
 <br><br><table align="center" border="1" bordercolor="#B2C629">
	<tr bgcolor="black">
	<th style="color:#B2C629;">Product Name</th>
	<th style="color:#B2C629;">Product Model</th>
	<th style="color:#B2C629;">Product Color</th>
	<th style="color:#B2C629;">Manufacture Name</th>
	<th style="color:#B2C629;">Manufacture Phone Number</th>
	</tr>
		<tr>	

<%
String nam="select p.pname,p.model,p.prod_color,m.mname,m.mphone from manufacture m,prod_mrf_detail pm,product p where m.mid=pm.mid and pm.pid=p.pid and m.mname='"+ request.getParameter("pro") +"'group by m.mname" ;
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
<td><%=gc.rs1.getString(2) %></td>
<td><%=gc.rs1.getString(3) %></td>
<td><%=gc.rs1.getString(4) %></td>
<td><%=gc.rs1.getLong(5) %></td>
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