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
     <%
	Login user = (Login)session.getAttribute("USER");

if(user!=(null)){
	%>
	 <div align="right">you logged in as <%=user.getUname() %>
	 <a class=a href="index.jsp">LogOut</a>
	  </div>
    <div id="topnav">
      <ul>
        <li class="active"><a href="temp.jsp">Home</a></li>
        <li><a href="#">Manufacture</a>
          <ul>
            <li><a href="ManufactureInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Manufacture</a></li>
            <li><a href="ManufactureEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Manufacture</a></li>
            <li><a href="SelectManufacture.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Manufacture</a></li>
            </ul>      
        </li>
        <li><a href="#">Dealer</a>
          <ul>
            <li><a href="DealerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Dealer</a></li>
            <li><a href="DealerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Dealer</a></li>
            <li><a href="SelectDealer.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Dealer</a></li>
            </ul>      
        </li>
        <li><a href="#">Retailer</a>
          <ul>
            <li><a href="RetailerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Retailer</a></li>
            <li><a href="RetailerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Retailer</a></li>
            <li><a href="Selectretailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">View retailer</a></li>
            </ul>      
        </li>
                 
       <li><a href="#">View All</a>
          <ul>
            <li><a href="ProductSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Product</a></li>
            <li><a href="ManufactureSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Manufacturers</a></li>
            <li><a href="DealerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Dealers</a></li>
            <li><a href="RetailerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Retailers</a></li>
            <li><a href="CustomerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View All Customers</a></li>
            </ul>      
          </li>
          <li><a href="#">Report</a>
          <ul>
            <li><a href="ManuSelectForm2.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacture Report</a></li>
            <li><a href="ManuProduct.jsp?sessionId=<%=request.getParameter("sessionId")%>">Manufacture Product Report</a></li>
            <li><a href="RetailerPurOrder.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Purchase Order</a></li>
            <li><a href="RetailerProduct.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Product Report</a></li>
            <li><a href="repdealerdate.jsp?sessionId=<%=request.getParameter("sessionId")%>">Dealer Product Report</a></li>
            <li><a href="repretailerdate.jsp?sessionId=<%=request.getParameter("sessionId")%>">Retailer Product Report</a></li>
             <li><a href="repcustomerdate.jsp?sessionId=<%=request.getParameter("sessionId")%>">Customer Product Report</a></li>
            
            </ul> 
            <li><a href="index.jsp">Logout</a></li>     
         </ul>
    </div>
    <%
}else{
	%>
	
	<jsp:forward page="AdminLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
    
    <br class="clear" />
  <% 
     if(request.getParameter("msg") != null){
 		out.println("<h4 align='center' style='color: #B2C629;'> "+request.getParameter("msg"));	
 	}
%>
  </div>
  <script type="text/javascript">
 function validate(){
 var a=document.form.dphone.value;
 if(a.length>10 || a.length<10)
 {
 alert("Enter proper mobile no");

 document.form.dphone.select();
 document.form.dphone.focus();
 document.form.dphone.value="";
 return false;
 }
 if(isNaN(a)){
 	alert("Enter only digit");
 	document.form.dphone.select();
 	document.form.dphone.focus();
 	document.form.dphone.value="";
 	return false;
 }
 var b=document.form.dname.value;
 	if(!isNaN(b)){
 		alert("Enter only Characters");
 		document.form.dname.select();
 		document.form.dname.focus();
 		document.form.dname.value="";
 		return false;
 	}
 	var c=document.form.city.value;
 	if(!isNaN(c)){
 		alert("Enter only Characters");
 		document.form.city.select();
 		document.form.city.focus();
 		document.form.city.value="";
 		return false;
 	}
 	 	 	 }


 </script>
  
        <form action="dealerinsert" name="form" onsubmit="return validate()">
		<div id="print" style="height:100%;width:100%;">
<br><br><table cellspacing="12" align="center" width="80%" border="5">
<tr>
<td rowspan="10">

		
		<img alt="Web Store" src="./images/r1.jpg" width="500" height="300"></img>
		
		</marquee>
						
	</td>

<td align="center" colspan=2 style="color:black; background:#00ff80;"> <h2>DEALER REGISTRATION</h2></td>

</tr><br><br>
	
<tr>
				<td> Dealer name</td>
				<td><input type="text" name="dname" placeholder=" Enter Name" required="required"></td>
			</tr>
			<tr>
				<td> Dealer Addresss</td>
				<td><input type="text" name="daddress" placeholder="Enter address" required="required"></td>
			</tr>
			<tr>
				<td> Dealer Email</td>
				<td><input type="email" name="demail" placeholder="Enter Email" required="required"></td>
			</tr>
			<tr>
				<td> Phone Number</td>
				<td><input type="text" name="dphone" placeholder="Enter Phone Number" required="required"></td>
			</tr>
			<tr>
				<td>Registration date</td>
				<td><input type="date" name="reg_date" required="required"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td><input type="submit" value="ADD"></td>
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