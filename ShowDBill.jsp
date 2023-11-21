<%@ page import= "com.dcms.bean.DBill"%>
<%@ page import= "com.dcms.dao.DBillDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<form name="proform">
<body>
<%
     DBill temp= (DBill) request.getAttribute("PRO");
%>


<table align="left" border="3" bordercolor="orange">
<tr><td>Bill Number</td><td>Billing Date</td><td>Dealer Order Id</td></tr>
                   <tr>
                    <td><%=temp.getDbno() %></td>
                   <td><%=temp.getDbdate()  %></td>
					<td><%=temp.getDpono() %></td>
					

    </tr>
		
	
</table>
</body>
</html>