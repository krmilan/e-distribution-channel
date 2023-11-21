<%@page import="com.dcms.bean.RPurDetail"%>
<%@page import="com.dcms.dao.RPurOrderDAO"%>
<%@page import="java.util.List"%>

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
		int rpono=Integer.parseInt(request.getParameter("rpono"));
         RPurDetail user = new RPurOrderDAO().getRet(rpono) ;
%>
<form action="rpurorderupdate" name="form">
<table border='3'>
<tr><td>Retailer Order ID</td><td><input type="text" name="rpono" readonly value="<%=user.getRpo() %>"></td></tr>
<tr><td>Order date</td><td><input type="date" name="rpodate" value="<%=user.getRpodate() %>"></td></tr>
<tr><td>Retailer Manufacture Id</td><td><input type="text" name="rpmid" readonly value="<%=user.getRpmid() %>"></td></tr>
<tr><td>Quantity</td><td><input type="text" name="rqty"   value="<%=user.getRqty() %>"></td></tr>
<tr><td> Dealer Id</td><td><input type="text" name="rdid" readonly value="<%=user.getRdid() %>"></td></tr>
<tr><td> Retailer Id</td><td><input type="text" name="rid" readonly value="<%=user.getRid() %>"></td></tr>
<tr><td><input type="submit" value="UPDATE"></td><td><input type="reset" value="CANCEL"></td></tr>
</table>
</body>
</html>