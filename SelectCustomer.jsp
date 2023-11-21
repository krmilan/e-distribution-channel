<%@page import="com.dcms.bean.Customer"%>
<%@page import="com.dcms.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
      function fnSubmitCus(){
    	  document.cusform.action="customerselect";
    	  document.cusform.submit();
      }
</script>
</head>
<body>
<form name="cusform">
<select name="cid" onchange="fnSubmitCus()">
<%
for(Customer temp : new CustomerDAO().getAllCus()){
%>
<option value="<%=temp.getCid()%>"><%=temp. getCname() %></option>
<%
}
%>
</body>
</html>