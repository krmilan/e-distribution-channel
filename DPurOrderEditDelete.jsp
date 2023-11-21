<%@page import="com.dcms.bean.DPurDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.dcms.dao.DPurOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
		function fnDeleteManu(val){
			console.log(val);
			formname="form"+val;
			console.log(formname);
			
			if(confirm("Are you sure to delete?")){
				document.forms[formname].action='dpurorderdelete';
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
		List<DPurDetail> list =  new DPurOrderDAO().getAllDPDetail();
	%>
	
	<table  border="2">
	<tr><td>Purchase Date</td><td>Purchase Manufacture Id</td><td>Quantity</td><td>Dealer ID</td></tr>
		<%
			for(DPurDetail temp : list){
			%>
			<form name="form<%=temp.getDpono() %>">
			<input type="hidden" name="dpono" value="<%=temp.getDpono() %>" />
			
				<tr>
					<td><%=temp.getDpodate() %></td>
					<td><%=temp.getDpmid() %></td>
					<td><%=temp.getDqty() %></td>
					<td><%=temp.getDid() %></td>
					<td><input type="button" value ="Delete" onclick="fnDeleteManu(<%=temp.getDpono() %>)" /></td>
					<td><input type="submit" value ="Edit" formaction="DPurOrderUpdate.jsp?&dpono=<%=temp.getDpono() %>&dpodate<%=temp.getDpodate() %>&dpmid=<%=temp.getDpmid() %>&dqty=<%=temp.getDqty() %>&did=<%=temp.getDid() %>" /></td>
					
				</tr>
		</form>
			<%	
			}
		%>
	</table>
</body>
</html>