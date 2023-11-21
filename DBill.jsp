<%@ page import= "com.dcms.bean.DPurDetail"%>
<%@ page import= "com.dcms.dao.DPurOrderDAO" %>
<%@page import="com.dcms.bean.Login"%>
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
	Logged in as :
	<%=user%>

	<a class=a href="index.jsp">LogOut</a>
</p>
    </div>
     <div id="topnav">
        <ul>
         <li><a href="ProductSelectAll2.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Product</a></li>
         <li><a href="DPurOrderInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Purchase Order</a></li>
         <li><a href="DBill.jsp?sessionId=<%=request.getParameter("sessionId")%>">Dealer Bill</a></li>
          <li><a href="ManufactureHome.jsp">Home</a></li>
</ul>  
    </div>
     
      <br class="clear" />
 
   
  </div>

<script type="text/javascript">
function ProdManuInsert(){
	document.proform.action="ProdManuInsert";
	document.proform.submit();
}
</script>
</head>
<body>
<%
	if(request.getParameter("msg") != null){
		out.println("<h4 align='center' style='color: #B2C629;'> "+request.getParameter("msg"));	
	}
    
%> 
    
<form name="form" action="dbillinsert" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center"cellpading=20px cellspacing=30px border=2 bordercolor=white>
<tr><td>Enter Dealer Billing Date</td><td><input type="date" name="dbdate" /></td></tr>
<tr>
 <td>Select Dealer Purchase Order Number</td>
 <td><select name="dpono" onchange="dpur()">
 <%
 for(DPurDetail temp : new DPurOrderDAO().getAllDPDetail()){
 %>
 <option value="<%=temp.getDpono() %>"><%=temp.getDpono() %></option>
 <%
 }
 %>
 </select></td></tr> 
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