<%@ page import= "com.dcms.bean.Prod"%>
<%@ page import= "com.dcms.dao.ProDAO" %>
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
 
       <form name="form" align="middle" id=payment>
       <br><h2 align="center" color="orange">View All Product Detail</h2><br><br>
<div id="print" style="height:400px;width:1200px; overflow:auto">
<table align="center" cellspacing=7 cellpadding=10 border=6 bordercolor=white>

<tr style="color:lightgreen;font-size:100%">
<th>Product Name</th>
<th>Product Model</th>
<th>product color</th>
<th>Product dealer price</th>
<th>Product retailer price</th>
<th>Product Customer price</th>
</tr>
<%
     for(Prod temp : new ProDAO().getAllProd()){
%>
<tr>
   <td><%=temp.getPname() %></td>
   <td><%=temp.getModel() %></td>
  <td><%=temp.getProd_color() %></td>
   <td><%=temp.getDprice() %></td> 
    <td><%=temp.getRprice() %></td> 
    <td><%=temp.getCprice() %></td> 
    </tr>
    <%
     }
    %>
</table>
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