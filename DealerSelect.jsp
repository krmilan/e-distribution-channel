<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="connection.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table align="center" border="1" bordercolor="#B2C629">
	<tr bgcolor="black">
	<th style="color:#B2C629;">Dealer Id</th>
	<th style="color:#B2C629;">Dealer Name</th>
	<th style="color:#B2C629;">Dealer Email id</th>
	<th style="color:#B2C629;">Dealer Dphone</th>
	<th style="color:#B2C629;">Purchase Order date</th>
	<th style="color:#B2C629;">Product Quantity</th>
	
		</tr>
		<tr>	

<%
String sql="select d.did,d.dname,d.demail,d.dphone,dp.dpodate,dp.dqty from dealer d,dpur_order dp,prod_mrf_detail pm,product p  where dp.did=d.did and dp.dpmid=pm.pmid and pm.pid=p.pid and p.pname='"+ request.getParameter("pro") +"'";
Statement st=conn.createStatement();
ResultSet rs1=st.executeQuery(sql);
if(rs1.next())
{
	rs1.previous();

while(rs1.next())
{
	
%>
<tr>
<td><%=rs1.getInt(1) %></td>
<td><%=rs1.getString(2) %></td>
<td><%=rs1.getString(3) %></td>
<td><%=rs1.getLong(4) %></td>
<td><%=rs1.getString(5) %></td>
<td><%=rs1.getInt(6) %></td>
</tr>

<%}
}
else 
{ 
	out.println("<h3 align='center' style='color:green'>No Dealers");	
}
%>

</table>
</body>
</html>