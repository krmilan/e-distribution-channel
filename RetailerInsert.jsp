<%@page import="com.dcms.bean.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Distributed</title>
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
            <li><a href="SelectManufacture.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select Manufacture</a></li>
            </ul>      
        </li>
        <li><a href="#">Dealer</a>
          <ul>
            <li><a href="DealerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Dealer</a></li>
            <li><a href="DealerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Dealer</a></li>
            <li><a href="SelectDealer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select Dealer</a></li>
            </ul>      
        </li>
        <li><a href="#">Retailer</a>
          <ul>
            <li><a href="RetailerInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Add Retailer</a></li>
            <li><a href="RetailerEditDelete.jsp?sessionId=<%=request.getParameter("sessionId")%>">Edit/Delete Retailer</a></li>
            <li><a href="Selectretailer.jsp?sessionId=<%=request.getParameter("sessionId")%>">Select retailer</a></li>
            </ul>      
        </li>
                 
       <li><a href="#">View</a>
          <ul>
            <li><a href="ProductSelectAll5.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Product</a></li>
            <li><a href="ManufactureSelectAll2.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Manufacturers</a></li>
            <li class="active"><a href="DealerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Dealers</a></li>
            <li><a href="RetailerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Retailers</a></li>
            <li><a href="CustomerSelectAll.jsp?sessionId=<%=request.getParameter("sessionId")%>">View Customers</a></li>
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
         </ul>
    </div>
    
    <br class="clear" />
  <% 
     if(request.getParameter("msg") != null){
 		out.println("<h4 align='center' style='color: #B2C629;'> "+request.getParameter("msg"));	
 	}
%>
<%
}else{
	%>
	
	<jsp:forward page="AdminLogin.jsp?msg=Sorry Please login, again"/>
<%
}
%>
     </div>
   
</head>
<body>
<script type="text/javascript">
 function validate(){
 var a=document.form.rphone.value;
 if(a.length>10 || a.length<10)
 {
 alert("Enter proper mobile no");

 document.form.rphone.select();
 document.form.rphone.focus();
 document.form.rphone.value="";
 return false;
 }
 if(isNaN(a)){
 	alert("Enter only digit");
 	document.form.rphone.select();
 	document.form.rphone.focus();
 	document.form.rphone.value="";
 	return false;
 }
 var b=document.form.rname.value;
 	if(!isNaN(b)){
 		alert("Enter only Characters");
 		document.form.rname.select();
 		document.form.rname.focus();
 		document.form.rname.value="";
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
   
<form name="form" action="retailerinsert" id=payment onsubmit="return validate()">
<div id="print" style="height:100%;width:100%;"><br><br>
<br><br><table cellspacing="12" align="center" width="80%" border="5">
<tr>
<td rowspan="10">

		
		<img alt="Web Store" src="./images/r2.jpg" width="500" height="300"></img>
		
		</marquee>
						
	</td>

<td align="center" colspan=2 style="color:black; background:#00ff80;"> <h2>RETAILER REGISTRATION</h2></td>

</tr><br><br>
			<tr>
				<td>Enter Retailer name</td>
				<td><input type="text" name="rname" placeholder="Enter Name" required="required"></td>
			</tr>
			<tr>
				<td>Enter Retailer Addresss</td>
				<td><input type="text" name="raddress" placeholder="Enter Address" required="required"></td>
			</tr>
			<tr>
				<td>Enter City</td>
				<td><input type="text" name="city" placeholder="Enter City" required="required"></td>
			</tr>
			
			
			<tr>
				<td>Enter Retailer Email</td>
				<td><input type="email" name="remail" placeholder="Enter EmailId" required="required"></td>
			</tr>
			<tr>
				<td>Enter retailer Phone Number</td>
				<td><input type="text" name="rphone" placeholder="Enter Phone number" required="required"></td>
			</tr>
			<tr>
				<td>Enter Registration date</td>
				<td><input type="date" name="reg_date" required="required"></td>
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