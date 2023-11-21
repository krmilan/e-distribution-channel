<%@page import="com.dcms.bean.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-DISTRIBUTED</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<link rel="stylesheet" href="./css/tables.css" type="text/css" />
<link rel="stylesheet" href="./css/forms.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
</head>

<body id="top" bgcolor="gray">

<!-- ####################################################################################################### -->
<div class="wrapper col1">
<h1><a href="index.jsp"></a><img src="images/dclog.jpg"width=1340 height=150></img></h1>
  <div id="header">
   </div>
    <%
	if (request.getParameter("msg") != null) {
		out.println("<h4 align='center' style='color: #B2C629;'> " + request.getParameter("msg"));
	}
%>
<%
	try {
		if ((session.getAttribute("user")).equals(null)) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	} catch (NullPointerException npe) {
		npe.printStackTrace();
%>
<jsp:forward page="index.jsp?msg=invalidate user" />
<%
	}
%>
<%
	String user = session.getAttribute("user").toString();
%>
<p style="color: #B2C629;" align="right">
	Logged in as :
	<%=user%>
	<%
	String user1 =session.getAttribute("rid").toString();
	%>
	<a class=a href="index.jsp">LogOut</a>
</p>
    <div id="topnav">
      <ul>
        <li><a href="ProductSelectAll3.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Product</a></li>
       <li><a href="#">Purchase Product</a>
          <ul>
            <li><a href="rprodecider.jsp?sessionId=<%=request.getParameter("sessionId")%>">Product decider</a></li>
             </ul>      
        </li>
        
         <li><a href="ViewAllPOByRetailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Bill</a></li>
        <li><a href="CustomerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Customer</a></li>
         <li><a href="index.jsp">Home</a></li>
         <li><a href="temp.jsp">Logout</a></li>
      </ul>
    </div><br><br><br><br>
   
   
	

  <script type="text/javascript">
 function validate(){
 var a=document.userForm.cphone.value;
 if(a.length>10 || a.length<10)
 {
 alert("Enter proper mobile no");

 document.userForm.cphone.select();
 document.userForm.cphone.focus();
 document.userForm.cphone.value="";
 return false;
 }
 if(isNaN(a)){
 	alert("Enter only digit");
 	document.userForm.cphone.select();
 	document.userForm.cphone.focus();
 	document.userForm.cphone.value="";
 	return false;
 }
 var b=document.userForm.cname.value;
 	if(!isNaN(b)){
 		alert("Enter only Characters");
 		document.userForm.cname.select();
 		document.userForm.cname.focus();
 		document.userForm.cname.value="";
 		return false;
 	}
 	 	 	 }


 </script>
  <div id="print" style="height:100%;width:100%; ">
        <form action="customerinsert" name="userForm" onsubmit="return validate()" id=payment>
		 
<table cellspacing="12" align="center" width="50%" border="5">
<tr>
<td rowspan="14">

		
		<img alt="Web Store" src="./images/customerhome.jpg" width="800" height="500"></img>
		
		</marquee>
						
	</td>

<td align="center" colspan=2 style="color:black; background: yellow;"> <h2>CUSTOMER REGISTRATION</h2></td>

</tr>
		
					<tr>
				<td> Customer name</td>
				<td><input type="text" name="cname" placeholder="Enter Name" required="required" onkeyup="alp(this)" onkeydown="alp(this)" onchange="selfload()"></td>
			</tr>
			<tr>
				<td> Gender</td>
				<td><input type="radio" name="cgender" value="MALE" placeholder="select Gender" required="required">Male
				<input type="radio" name="cgender" value="FEMALE" placeholder="select Gender" required="required">Female</td>
			</tr>
			<tr>
				<td> Customer Addresss</td>
				<td><textarea type="text" row="5" col="5" name="caddress" placeholder="Enter Address" required="required"></textarea></td>
			</tr>
			<tr>
				<td> Customer Email</td>
				<td><input type="email" name="cemail" placeholder="Enter Valid Id" required="required"></td>
			</tr>
			<tr>
				<td>Customer Phone Number</td>
				<td><input type="text" name="cphone" placeholder="Enter 10 digit phone number" required="required"></td>
			</tr>
			<tr>
				<td> City</td>
				<td><input type="text" name="city" placeholder="Enter ur city name" required="required"></td>
			</tr>
			<tr>
				<td> Registration date</td>
				<td><input type="date" name="reg_date" placeholder="Enter Registration date" required="required"></td>
			</tr>
			
			<tr>
				<td style="color:white; background: tail;"><input type="submit" value="ADD"></td>
				<td><input type="reset" value="CANCEL"></td>
			</tr>
			</table></div>
</form>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer" >
  </div>
</div>

		<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">E-Distributed Channel</a></p>
    <br class="clear" />
  </div>
</div>  
	</br>
</body>
</html>