<%@ page import= "com.dcms.bean.RBill"%>
<%@ page import= "com.dcms.dao.RBillDAO" %>
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
<th>Retailer Order Id</th>
</tr>
<%
     for(RBill temp : new RBillDAO().getAllRB()){
%>
<tr>
   <td><%=temp.getRpno() %></td>
   <td><%=temp.getRbdate() %></td>
  <td><%=temp.getRpono() %></td>
   </tr>
    <%
     }
    %>
</table>
</body>
</html>