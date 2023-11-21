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
<h2>Customer Id is <%=request.getParameter("pname") %></h2>
<table align="center" border="1" bordercolor="#B2C629">
	<tr bgcolor="black">
	<th style="color:#B2C629;">Retailer Id</th>
	<th style="color:#B2C629;">Retailer Name</th>
	<th style="color:#B2C629;">Retailer Email id</th>
	<th style="color:#B2C629;">Retailer Dphone</th>
	<th style="color:#B2C629;">Purchase Order Date</th>
	<th style="color:#B2C629;">Product Quantity</th>
	
		</tr>
		<tr>	

<%
String sql="select r.rid,r.rname,r.remail,r.rphone,rp.rpodate,rp.rqty from retailer r,rpur_order rp,prod_mrf_detail pm,product p  where rp.rid=r.rid and rp.rpmid=pm.pmid and pm.pid=p.pid and p.pname='"+ request.getParameter("pro") +"'";
Statement st=conn.createStatement();
ResultSet rs1=st.executeQuery(sql);
if(rs1.next())
{
	rs1.previous();

while(rs1.next())
{
	
%>`
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