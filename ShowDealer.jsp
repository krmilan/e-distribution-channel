<%@ page import= "com.dcms.bean.Dealer"%>
<%@ page import= "com.dcms.dao.DealerDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Dealer deal = (Dealer) request.getAttribute("DEAL");
%>
<table border="3">
<tr>
<td>Dealer Name</td>
<td><%=deal.getDname() %></td></tr>

<td>Dealer address</td>
<td><%=deal.getDaddress() %></td></tr> 
<tr>
<td>Dealer Email ID</td>
<td><%=deal.getDemail() %></td></tr> 
<tr>
<tr>
<td>Dealer Phone Number</td>
<td><%=deal.getDphone() %></td></tr> 

<td> Registration Date</td>
<td><%=deal.getReg_date() %></td></tr> 
<tr>
<td>Dealer City</td>
<td><%=deal.getCity() %></td></tr> 
<tr>
</table>
</body>
</html>