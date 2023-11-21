<%@page import="com.dcms.bean.CPurDetail"%>
<%@page import="com.dcms.dao.CPurOrderDAO"%>
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
		int cpono=Integer.parseInt(request.getParameter("cpono"));
         CPurDetail user = new CPurOrderDAO().getCus(cpono) ;
%>
<form action="cpurorderupdate" name="form">
<table border='3'>
<tr><td>Customer Order ID</td><td><input type="text" name="cpono" readonly value="<%=user.getCpono() %>"></td></tr>
<tr><td>Order date</td><td><input type="date" name="cpodate" value="<%=user.getCpodate() %>"></td></tr>
<tr><td>Customer Manufacture Id</td><td><input type="text" name="cpmid" readonly value="<%=user.getCpmid() %>"></td></tr>
<tr><td>Quantity</td><td><input type="text" name="cqty"   value="<%=user.getCqty() %>"></td></tr>
<tr><td> Retailer Id</td><td><input type="text" name="cdid" readonly value="<%=user.getCdid() %>"></td></tr>
<tr><td> Customer Id</td><td><input type="text" name="cid" readonly value="<%=user.getCid() %>"></td></tr>
<tr><td><input type="submit" value="UPDATE"></td><td><input type="reset" value="CANCEL"></td></tr>
</table>
</body>
</html>