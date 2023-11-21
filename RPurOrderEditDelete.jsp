<%@page import="com.dcms.bean.RPurDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.dcms.dao.RPurOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
		function fnDeleteRet(val){
			console.log(val);
			formname="form"+val;
			console.log(formname);
			
			if(confirm("Are you sure to delete?")){
				document.forms[formname].action='rpurorderdelete';
				document.forms[formname].submit();
			}else{
				alert("Record Not Deleted... ");
			}
		}
		
	</script>
<title>Insert title here</title>
</head>
<body>
<%
		List<RPurDetail> list =  new RPurOrderDAO().getAllRPDetail();
	%>
	
	<table  border="2">
	<tr><td>Purchase Date</td><td>Purchase Manufacture Id</td><td>Quantity</td><td>Dealer ID</td><td>Retailer ID</td></tr>
		<%
			for(RPurDetail temp : list){
			%>
			<form name="form<%=temp.getRpo() %>">
			<input type="hidden" name="rpono" value="<%=temp.getRpo() %>" />
			
				<tr>
					<td><%=temp.getRpodate() %></td>
					<td><%=temp.getRpmid() %></td>
					<td><%=temp.getRqty() %></td>
					<td><%=temp.getRdid() %></td>
					<td><%=temp.getRid() %></td>
					<td><input type="button" value ="Delete" onclick="fnDeleteRet(<%=temp.getRpo() %>)" /></td>
					<td><input type="submit" value ="Edit" formaction="RPurOrderUpdate.jsp?&rpono=<%=temp.getRpo() %>&rpodate<%=temp.getRpodate() %>&rpmid=<%=temp.getRpmid() %>&rqty=<%=temp.getRqty() %>&rdid=<%=temp.getRdid() %>&rid=<%=temp.getRid() %>" /></td>
					
				</tr>
		</form>
			<%	
			}
		%>
	</table>
</body>
</html>