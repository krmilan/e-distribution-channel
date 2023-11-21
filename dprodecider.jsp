<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<%@ include file="connection.jsp"%>
<%@page import="com.dcms.connection.GetConnection"%>
<%@ page isErrorPage="true" %>
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
<title>E-Distributed channel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
<script>
function selfload()
{
	document.form1.action="dprodecider.jsp";
	document.form1.submit();
}
</script>
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

	<a class=a href="Logout.do">LogOut</a>
</p>
</div>
    <div id="topnav">
      <ul>
        <li><a href="ProductSelectAll2.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Product</a></li>
       <li><a href="#">Purchase Product</a>
          <ul>
            <li><a href="dprodecider.jsp?sessionId=<%=request.getParameter("sessionId")%>">Product decider</a></li>
         
             </ul>      
        </li>
        
         <li><a href="ViewAllPOByDealer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Dealer Bill</a></li>
          <li><a href="index.jsp">Home</a></li>
           </ul>
    </div>
<br><br></br></br>   
<table  align="left" style="position: absolute;">

<tr>
	<td >
		
	</td>
</table>	
<form name="form1" background_color="blue">

<table  cellspacing="20" width=69%>
	<tr><td align="right" colspan=3 width="79%" style="color:lightgreen; font_size:24; "> <big>Dealer Product Decider</big></td></tr>


<tr>
<td align="right">Select Product 
			<%
			String pname=request.getParameter("pname");
			if(pname==null)pname="Select Product";
			%>
			<select name="pname"  onchange="selfload()" required="required">
			<option value="" selected="selected"><%=pname %></option>
			<%
			String nam=("select distinct pname from product where status='available'");
			GetConnection gc = new GetConnection();

			gc.ps = GetConnection.getMysqlConnection().prepareStatement(nam);
			gc.rs1 = gc.ps.executeQuery();	
			while(gc.rs1.next())
			{
				%>
				<option value="<%=gc.rs1.getString(1)%>"><%=gc.rs1.getString(1)%></option><% 
			}
			
			%>
			</select>
		
		</td>
</tr>
</table>
<div id="print" style="height:360px; overflow:auto;" >
<table align="center" border="1" bordercolor="#B2C629" style="position: relative;text-shadow: purple;right: 10px;background-color: lightblue;">
	<tr bgcolor="black">
	<th style="color:#B2C629;">Dealer name</th>
	<th style="color:#B2C629;">PhoneNumber</th>
	<th style="color:#B2C629;">Product Name</th>
	<th style="color:#B2C629;">Model</th>
	<th style="color:#B2C629;">Product Price</th>
	</tr>
		<tr>	

<%

String sql="select p.pid,d.did,d.dname,d.dphone,p.pname,p.model,p.dprice,pf.pmid from prod_mrf_detail pf,dealer d,product p,dpur_order dp where dp.did=d.did and pf.pid=p.pid and pf.pmid=dp.dpmid and p.pname='"+pname+"' and p.status='available' group by pname";
GetConnection gc1 = new GetConnection();

gc1.ps = GetConnection.getMysqlConnection().prepareStatement(sql);
gc1.rs1 = gc1.ps.executeQuery();
if(gc1.rs1.next())
{
	gc1.rs1.previous();

while(gc1.rs1.next())
{
	
%>
<td><%=gc1.rs1.getString(3) %></td>
<td><%=gc1.rs1.getLong(4) %></td>
<td><%=gc1.rs1.getString(5) %></td>
<td><%=gc1.rs1.getString(6) %></td>
<td><%=gc1.rs1.getFloat(7) %></td>

<td><a href="DPurOrderInsert.jsp?pid=<%=gc1.rs1.getInt(1)%>&mid=<%=gc1.rs1.getInt(8)%>&did=<%=gc1.rs1.getString(2)%>&pname=<%=pname%>">Book Now...</a></td>

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