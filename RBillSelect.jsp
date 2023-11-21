<%@page import="com.dcms.bean.RBill"%>
<%@page import="com.dcms.dao.RBillDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script tyep="text/javascript">
      function fnSubmitPro(){
    	  document.proform.action="rbillselect";
    	  document.proform.submit();
      }
</script>
</head>
<body>
<form name="proform">
<table>
<tr><td>Select Bill Number</td>
<td><select name="rbno" onchange="fnSubmitPro()">
<%
for(RBill temp : new RBillDAO().getAllRB()){
%>
<option value="<%=temp.getRpno() %>"><%=temp.getRpno() %></option>
<%
}
%>
</select></td></tr>
</table>
</body>
</html>