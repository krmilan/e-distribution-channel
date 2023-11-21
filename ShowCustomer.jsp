<%@ page import= "com.dcms.bean.Customer" %>
<%@ page import= "com.dcms.dao.CustomerDAO" %>
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
Customer cus = (Customer) request.getAttribute("CUS");
%>
<table border="3">
<tr>
<td>Customer Name</td>
<td><%=cus.getCname() %></td></tr>
<tr>
<td>Gender</td>
<td><%=cus.getCgender() %></td></tr> 
<tr>
<td>Customer address</td>
<td><%=cus.getCaddress() %></td></tr> 
<tr>
<td>Customer Email ID</td>
<td><%=cus.getCemail() %></td></tr> 
<tr>
<tr>
<td>Customer Phone Number</td>
<td><%=cus.getCphone() %></td></tr>
<tr> 
<td>Customer City</td>
<td><%=cus.getCity() %></td></tr> 
<tr>
<td> Registration Date</td>
<td><%=cus.getReg_date() %></td></tr> 


</table>
</body>
</html>