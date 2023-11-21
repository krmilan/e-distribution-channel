<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Distributed Channel</title>
</head>

<body>
<%
Connection conn=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	//ResultSet rs=null,rs1=null,rs2=null;
	//Statement st=null,st1=null,st2=null;
	//PreparedStatement ps=null,ps1=null,ps2=null;
	conn=DriverManager.getConnection("jdbc:mysql://localhost/dcms","root","mysql");
	System.out.println("CONNECTED SUCCESSFULLY");
}catch (Exception e) 
{
	System.out.println("Error in connection "+e);
}
	
%>
</body>
</html>