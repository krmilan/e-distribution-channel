<%@ page import= "com.dcms.bean.Retailer" %>
<%@ page import= "com.dcms.dao.RetailerDAO" %>
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
Retailer ret = (Retailer) request.getAttribute("RET");
%>
<table border="3">
<tr>
<td>Retailer Name</td>
<td><%=ret.getRname() %></td></tr>
<tr>
<td>Gender</td>
<td><%=ret.getRgender() %></td></tr> 
<tr>
<td>Retailer address</td>
<td><%=ret.getRaddress() %></td></tr> 
<tr>
<td>Retailer Email ID</td>
<td><%=ret.getRemail() %></td></tr> 
<tr>
<tr>
<td>Retailer Phone Number</td>
<td><%=ret.getRphone() %></td></tr>
<tr> 
<td>retailer City</td>
<td><%=ret.getCity() %></td></tr> 
<tr>
<td> Registration Date</td>
<td><%=ret.getReg_date() %></td></tr> 


</table>
</body>
</html>