<%@ page import= "com.dcms.bean.CBill"%>
<%@ page import= "com.dcms.dao.CBillDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table align="center" border="10" bordercolor="orange">
<tr>
<th>Bill Number</th>
<th>Billing Date</th>
</tr>
<%
     for(CBill temp : new CBillDAO().getAllCB()){
%>
<tr>
   <td><%=temp.getCbno() %></td>
   <td><%=temp.getCbdate() %></td>
     </tr>
    <%
     }
    %>
</table>
</body>
</html>