<%@page import="com.dcms.bean.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.dcms.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
		function fnDeleteCust(val){
			console.log(val);
			formname="form"+val;
			console.log(formname);
			
			if(confirm("Are you sure to delete?")){
				document.forms[formname].action='customerdelete';
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
		List<Customer> list =  new CustomerDAO().getAllCus();
	%>
	
	<table  border="2" bordercolor="red">
	<tr><td>Customer Name</td><td>Gender</td><td>Address</td><td> Email Id</td><td> Phone Number</td><td>Country</td><td>Registration Date</td></tr>
		<%
			for(Customer temp : list){
			%>
			<form name="form<%=temp.getCid() %>">
			<input type="hidden" name="cid" value="<%=temp.getCid() %>" />
			
				<tr>
					<td><%=temp.getCname() %></td>
					<td><%=temp.getCgender() %></td>
					<td><%=temp.getCaddress() %></td>
					<td><%=temp.getCemail() %></td>
					<td><%=temp.getCphone() %></td>
					<td><%=temp.getCity() %></td>
					<td><%=temp.getReg_date() %></td>
					
					
					<td><input type="button" value ="Delete" onclick="fnDeleteCust(<%=temp.getCid() %>)" /></td>
					<td><input type="submit" value ="Edit" formaction="CustomerUpdate.jsp?&cid=<%=temp.getCid() %>&cname<%=temp.getCname() %>&cgender=<%=temp.getCgender() %>&caddress=<%=temp.getCaddress() %>&cemail=<%=temp.getCemail() %>&cphone=<%=temp.getCphone() %>&city=<%=temp.getCity() %>&reg_date=<%=temp.getReg_date() %>" /></td>
					
				</tr>
		</form>
			<%	
			}
		%>
	</table>
</body>
</html>