<%@ page import= "com.dcms.bean.ProdManuDetail"%>
<%@ page import= "com.dcms.dao.ProdManufDetailDAO" %>
<%@ page import= "com.dcms.bean.Dealer"%>
<%@ page import= "com.dcms.dao.DealerDAO" %>
<%@page import="com.dcms.bean.Login"%>
<%@ page import= "com.dcms.bean.Prod"%>
<%@ page import= "com.dcms.dao.ProDAO" %>
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
	String user1 =session.getAttribute("did").toString();
	%>
	<a class=a href="index.jsp?msg=Successfully logged out">LogOut</a>
</p>


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
    <br class="clear" />
  
 
</div>
 <script>
 var a=new Date();
var  d=a.getDate();
var m=a.getMonth();
var y=a.getFullYear();
var f=d+"/"+m+"/"+y;
 document.form.dpodate.value=f;
 </script>

<script type="text/javascript">
function ProdManuInsert(){
	document.proform.action="ProdManuInsert";
	document.proform.submit();
}
function ManuInsert(){
	document.proform.action="dealerinsert";
	document.proform.submit();
}
</script>
</head>  
<body>
<% 
   String id=request.getParameter("pid");
String name=request.getParameter("pname");
String mid=request.getParameter("mid");
String did=request.getParameter("did");
%>
<form name="form" action="dpurorder" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center"cellpading=20px cellspacing=30px border=2 bordercolor=white>
<tr><td> Dealer ID</td>
 <td><input type=text name="did" value=<%=user1 %> readonly=readonly>
 </td></tr> 
<tr>
 <td>Select Product ID</td>
 <td><input  name="pid" value=<%=id%> readonly=readonly></td></tr>
 <tr>
 <td>Select Product Name</td>
 <td><input  name="pname" value=<%=name%> readonly=readonly></td></tr>
 
<tr><td>Enter Dealer Purchase Date</td><td><input type="date" name="dpodate" /></td></tr>
<tr>
 <td>Select Product Manufacture Detail</td>
 <td><input name="dpmid" value=<%=mid %> readonly=readonly></td></tr>
 <tr><td>Enter Product Quantity</td><td><input type="text" name="dqty" /></td></tr>
 <tr>
 <td>Select Dealer ID</td>
 <td><input name="rdid" value=<%=did%> readonly=readonly></td></tr> 
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