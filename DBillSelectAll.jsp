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
<body>
<table align="center" border="10" bordercolor="orange">
<tr>
<th>Bill NUmber</th>
<th>Billing Date</th>
<th>Dealer Order Id</th>
</tr>
<%
     for(DBill temp : new DBillDAO().getAllDB()){
%>
<tr>
   <td><%=temp.getDbno() %></td>
   <td><%=temp.getDbdate() %></td>
  <td><%=temp.getDpono() %></td>
   </tr>
    <%
     }
    %>
</table>
</body>
</html>