<%@page import="com.dcms.connection.GetConnection"%>
<%@page import="com.dcms.bean.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel=stylesheet href="it.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./css/navi.css" type="text/css" />
<link rel="stylesheet" href="./css/layout.css" type="text/css" />
<link rel="stylesheet" href="./css/tables.css" type="text/css" />
<link rel="stylesheet" href="./css/forms.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
</head>
<script>
function printDiv(print) {
    //Get the HTML of div
    var divElements = document.getElementById(print).innerHTML;
    //Get the HTML of whole page
    var oldPage = document.body.innerHTML;

    //Reset the page's HTML with div's HTML only
    document.body.innerHTML = 
      "<html><head><title></title></head><body>" + 
      divElements + "</body>";

    //Print Page
    window.print();

    //Restore orignal HTML
    document.body.innerHTML = oldPage;

  
}
function selfload()
{
	document.frm.action="RetailerHome.jsp";
	document.frm.submit();
}
</script>
<body id="top" bgcolor="gray">

<!-- ####################################################################################################### -->
<div class="wrapper col1">
<h1><a href="index.jsp"></a><img src="images/dclog.jpg"width=1340 height=150></img></h1>
  <div id="header">
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
    </div>
     
  </div>


<form  action="" id=payment>
<div id="print" style="height:400px;width:1200px; overflow:auto"><br>
<font color="aqua" size="5">Retailer Id To View His/Her Purchase Order </font><input type=text name="rid" value="<%=user1 %>" readonly=readonly><br><br>
	<input type="submit" value="Click Here" />
</form>




<%
double total=0;	
	if(request.getParameter("rid") !=null){
		
%>
*

<h1><font color="orange">Retailer Id is <%=request.getParameter("rid") %></font></h1><br>
<table align="center"cellpading=20px cellspacing=30px  bordercolor=blue>
	<thead>
		<tr style="color:red;size:4"><td>Purchase Order No</td>
		<td>Purchase Order Date</td>
		<td>Product Name</td>
		<td>Quantity</td>
		<td>Price/Item</td>
		<td>Price*qty</td>
		<td>Dealer Name</td></tr>
	</thead>
	


<%		
		int rid = Integer.parseInt(request.getParameter("rid"));
		


		String sql ="select rpono, ro.rpodate,  p.pname,  ro.rqty, p.rprice,  (ro.rqty * p.rprice),  d.dname from rpur_order ro, prod_mrf_detail pmd, product p,"+
			" dealer d   where ro.rid =? and ro.rpmid = pmd.pmid and pmd.pid = p.pid and ro.rdid = d.did";

		GetConnection gc = new GetConnection();
		
		gc.ps = GetConnection.getMysqlConnection().prepareStatement(sql);
		gc.ps.setInt(1, rid);
		
		gc.rs1 = gc.ps.executeQuery();
		
		while(gc.rs1.next()){
			total = total +  gc.rs1.getDouble(6);
%>

	

		<tr>
			<td><%=gc.rs1.getInt(1) %></td>
			<td><%=gc.rs1.getString(2) %></td>
			<td><%=gc.rs1.getString(3) %></td>
			<td><%=gc.rs1.getInt(4) %></td>
			<td><%=gc.rs1.getDouble(5) %></td>
			<td><%=gc.rs1.getDouble(6) %></td>
			<td><%=gc.rs1.getString(7) %></td>
		</tr>
<%			
			
		}
		
		
		
		
	}


%>
<tr>
	<td colspan="5" style="color:white"><h2>Total is <%=total %></h2></td>
</tr>
</table>
<ul></ul>

</div>
<table align="center">
        <tr><td><input type="button" onClick="javascript:printDiv('print')"  value="Print"/></td><td><pre>           </pre></td>	
        <td><input type="button" onClick="selfload()"  value="No Thanks.."/></td></tr>
</table>
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