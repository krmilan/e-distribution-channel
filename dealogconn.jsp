
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-ADVERTISEMENT</title>
</head>

<%@ include file="connection.jsp"%>
<body>
<%
String un=request.getParameter("uname");
String pass=request.getParameter("pwd");
String role=request.getParameter("role");
session.setAttribute("user",un);
System.out.println(un);
%>



<%
Statement st=null;
st=conn.createStatement();
ResultSet rs=st.executeQuery("select * from dealer where dname='"+un+"' and password='"+pass+"' and role='"+role+"'");
if(rs.next())
{
	
	session.setAttribute("did", rs.getInt("did"));
	
	if(role.equalsIgnoreCase("dealer"))
	{
		response.sendRedirect("DealerHome.jsp?msg=Logged in Successfully");
	}
			
}else
{
	response.sendRedirect("index.jsp?msg=Invalid User name or password");
}
%>
</body>
</html>
<%
try{
if(st!=null){
st.close();
}
if(rs!=null){
rs.close();
}
if(conn!=null){
conn.close();
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>
