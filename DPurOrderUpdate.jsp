<%@page import="com.dcms.bean.DPurDetail"%>
<%@page import="com.dcms.dao.DPurOrderDAO"%>
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
<body>
<%
		int dpono=Integer.parseInt(request.getParameter("dpono"));
         DPurDetail user = new DPurOrderDAO().getDeal(dpono) ;
%>
<form action="dpurorderupdate" name="form">
<table border='3'>
<tr><td>Dealer Order ID</td><td><input type="text" name="dpono" readonly value="<%=user.getDpono() %>"></td></tr>
<tr><td>Order date</td><td><input type="date" name="dpodate" value="<%=user.getDpodate() %>"></td></tr>
<tr><td>Dealer Manufacture Id</td><td><input type="text" name="dpmid" readonly value="<%=user.getDpmid() %>"></td></tr>
<tr><td>Quantity</td><td><input type="text" name="dqty"   value="<%=user.getDqty() %>"></td></tr>
<tr><td> Dealer Id</td><td><input type="text" name="did" value="<%=user.getDid() %>"></td></tr>
<tr><td><input type="submit" value="UPDATE"></td><td><input type="reset" value="CANCEL"></td></tr>
</table>
</body>
</html>