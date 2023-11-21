<%@page import="java.util.Date"%>
<%@ page import= "com.dcms.bean.ProdManuDetail"%>
<%@ page import= "com.dcms.dao.ProdManufDetailDAO" %>
<%@ page import= "com.dcms.bean.Dealer"%>
<%@ page import= "com.dcms.dao.DealerDAO" %>
<%@ page import= "com.dcms.bean.Retailer" %>
<%@ page import= "com.dcms.dao.RetailerDAO" %>
<%@ page import= "com.dcms.bean.Prod"%>
<%@ page import= "com.dcms.dao.ProDAO" %>
<%@page import="com.dcms.bean.Login"%>
<%@page import="com.dcms.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel=stylesheet href="it.css" type="text/css">
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
  <div align="right">
    </div>
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
	<%
	String user1 =session.getAttribute("rid").toString();
	%>
	<a class=a href="index.jsp">LogOut</a>
</p>
    <div id="topnav">
      <ul>
        <li><a href="ProductSelectAll3.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Product</a></li>
       <li><a href="#">Purchase Product</a>
          <ul>
            <li><a href="rprodecider.jsp?sessionId=<%=request.getParameter("sessionId")%>">Product decider</a></li>
              </ul>      
        </li>
        
         <li><a href="ViewAllPOByRetailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Bill</a></li>
        <li><a href="CustomerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Customer</a></li>
         <li><a href="index.jsp">Home</a></li>
         <li><a href="temp.jsp">Logout</a></li>
      </ul>
    </div><br><br><br><br>
   
  </div>
<script type="text/javascript">
function ProdManuInsert(){
	document.proform.action="ProdManuInsert";
	document.proform.submit();
}
function Product(){
	document.proform.action="Product";
	document.proform.submit();
}
function DealerInsert(){
	document.proform.action="dealerinsert";
	document.proform.submit();
}
function RetailerInsert(){
	document.proform.action="retailerinsert";
	document.proform.submit();
}
function Product(){
	// this is submitting page to the servlet... 
	document.empform.action ="RPurOrderInsert.jsp";
	document.empform.submit();
	
}
</script>
</head>
<body>
<% 
   String id=request.getParameter("pid");
String mid=request.getParameter("mid");
String did=request.getParameter("did");
%>
<form name="myform" action="rpurorder" id=payment>
<div id="print" style="height:500px;width:1200px; ">
<table align="center"cellpading=20px cellspacing=30px border=2 bordercolor=white>
<br>
<tr><td> Reatiler ID</td>
 <td><input type=text name="rid" value=<%=user1 %> readonly=readonly>
 </td></tr> 
<tr>
 <td> Product Id</td>
 <td><input  name="pid" value=<%=id%> readonly=readonly>
 </td>
 </tr>
 <tr>
 <td> Product Name</td>
 <td><input  name="pname" value=<%=request.getParameter("pname")%> readonly=readonly>
 </td>
 </tr>
 
 <tr>
 <td> Product Manufacture ID</td>
 <td><input name="rpmid" value=<%=mid %> readonly=readonly>
 </tr>
 <tr>
 <td>Dealer ID</td>
 <td><input name="rdid" value=<%=did%> readonly=readonly>
 


 <tr>
 <td>Enter purdate</td>
 <td><input type="date" name="rpodate" required="required"/></td>
 </tr>
 <tr>
 <td>Enter qty</td>
 <td><input type="text" name="rqty" required="required" /></td>
 </tr>
 <tr><td><input type="submit" value="submit"></td>
 <td><input type="reset"></td></tr>
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