<%@ page import= "com.dcms.bean.Manufacture"%>
<%@ page import= "com.dcms.dao.ManufactureDAO" %>
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
     Manufacture manu = (Manufacture) request.getAttribute("MANU");
%>
<table align="left" border="3" bordercolor="orange">

	<tr>
		<td>Manufacture Name </td>
		<td><%=manu.getMname() %></td>
	</tr>
	<tr>
		<td>Manufacture Address</td>
		<td><%=manu.getMaddress()%></td>
	</tr>
	<tr>
		<td>Manufacture Email ID</td>
		<td><%=manu.getMemail() %></td>
	</tr>		
	<tr>
		<td>Manufacture Phone Number</td>
		<td><%=manu.getMphone() %></td>
	</tr>
	<tr>
	<td>Manufacture Country</td>
		<td><%=manu.getCountry() %></td>
	</tr>
	</table>
</body>
</html>