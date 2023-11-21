<%@page import="com.dcms.bean.CPurDetail"%>
<%@ page import="com.dcms.dao.CPurOrderDAO" %>
<%@page import="com.dcms.dao.ProDAO"%>
<%@page import="com.dcms.bean.Prod"%>
<%@page import="com.dcms.bean.ProdManuDetail" %>
<%@page import="com.dcms.dao.ProdManufDetailDAO" %>
<%@page import="com.dcms.bean.Customer" %>
<%@page import="com.dcms.dao.CustomerDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function fnSubmitProj(){
		// this is submitting page to the servlet... 
		document.empform.action ="CustomerSelect.jsp";
		document.empform.submit();
		
	}
</script>
</head>
<body>









<a href="home.jsp?sessionId=<%=request.getParameter("sessionId")%>">HOME PAGE</a>	 |


	<hr />
<form name="empform" action="CustomerSelectForm">
<select name="pro" onchange="fnSubmitProj()">
	<option>---------</option>
	<%
		for(Prod temp : new ProDAO().getAllProd()){
	%>

			<option value="<%=temp.getPname() %>"><%=temp.getPname() %></option>	

	<%
		}
	%>
	
</select>
</form>
	<a href="logout.jsp">Logout</a>	


</body>
</html>