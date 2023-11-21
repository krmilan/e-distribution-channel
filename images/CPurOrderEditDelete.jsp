<%@page import="com.dcms.bean.CPurDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.dcms.dao.CPurOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
		function fnDeletecust(val){
			console.log(val);
			formname="form"+val;
			console.log(formname);
			
			if(confirm("Are you sure to delete?")){
				document.forms[formname].action='cpurordrdelete';
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
		List<CPurDetail> list =  new CPurOrderDAO().getAllCus();
	%>
	
	<table  border="2">
	<tr><td>Purchase Date</td><td>Purchase Manufacture Id</td><td>Quantity</td><td>retailer ID</td><td>Customer ID</td></tr>
		<%
			for(CPurDetail temp : list){
			%>
			<form name="form<%=temp.getCpono() %>">
			<input type="hidden" name="cpono" value="<%=temp.getCpono() %>" />
			
				<tr>
					<td><%=temp.getCpodate() %></td>
					<td><%=temp.getCpmid() %></td>
					<td><%=temp.getCqty() %></td>
					<td><%=temp.getCdid() %></td>
					<td><%=temp.getCid() %></td>
					<td><input type="button" value ="Delete" onclick="fnDeleteCust(<%=temp.getCpono() %>)" /></td>
					<td><input type="submit" value ="Edit" formaction="CPurOrderUpdate.jsp?&cpono=<%=temp.getCpono() %>&cpodate<%=temp.getCpodate() %>&cpmid=<%=temp.getCpmid() %>&cqty=<%=temp.getCqty() %>&cdid=<%=temp.getCdid() %>&cid=<%=temp.getCid() %>" /></td>
					
				</tr>
		</form>
			<%	
			}
		%>
	</table>
</body>
</html>