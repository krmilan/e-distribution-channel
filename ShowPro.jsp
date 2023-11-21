<%@ page import= "com.dcms.bean.Prod"%>
<%@ page import= "com.dcms.dao.ProDAO" %>
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
     Prod temp= (Prod) request.getAttribute("PRO");
%>


<table align="left" border="3" bordercolor="orange">
<tr><td>Product Id</td><td>Product Name</td><td>Model</td><td>Product Color</td><td>Dealer Price</td><td>Retailer Price</td><td>Customer Price</td></tr>
                   <tr>
                    <td><%=temp.getPid() %></td>
                   <td><%=temp.getPname() %></td>
					<td><%=temp.getModel() %></td>
					<td><%=temp.getProd_color() %></td>
					<td><%=temp.getDprice() %></td>
					<td><%=temp.getRprice() %></td>
					<td><%=temp.getCprice() %></td>

    </tr>
		
	
</table>
</body>
</html>