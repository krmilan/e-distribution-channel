<%@page import="com.dcms.dao.CustomerDAO"%>
<%@page import="com.dcms.bean.Customer"%>
<%@page import="com.dcms.dao.RetailerDAO"%>
<%@page import="com.dcms.bean.Retailer"%>
<%@page import="com.dcms.dao.ProdManufDetailDAO"%>
<%@page import="com.dcms.bean.ProdManuDetail"%>
<%@page import="com.dcms.dao.ProDAO"%>
<%@page import="com.dcms.bean.Prod"%>
<%@page import="java.util.List"%>
<%@page import="com.dcms.bean.Login"%>
<%@page import="com.dcms.connection.GetConnection"%>
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
<script type="text/javascript"
	src="layout/scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript"
	src="layout/scripts/jquery.jcarousel.setup.js"></script>
	<script>
	function selfload(){
		document.userForm.action="CPurOrderInsert.jsp";
		document.userForm.submit();
		
	}
	</script>
</head>
<body id="top" bgcolor="gray">

	<!-- ####################################################################################################### -->
	<div class="wrapper col1">
		<h1>
			<a href="index.jsp"></a><img src="images/dclog.jpg" width=1340
				height=150></img>
		</h1>
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
					String user1 = session.getAttribute("cid").toString();
				%>
				<a class=a href="index.jsp">LogOut</a>
			</p>
			<div id="topnav">
				<ul>
					<li><a
						href="ProductSelectAll4.jsp?sessionId=<%=request.getParameter("sessionId")%>">View
							Product</a></li>
					<li><a
						href="CPurOrderInsert.jsp?sessionId=<%=request.getParameter("sessionId")%>">Purchase
							Order</a></li>
					<li><a
						href="ViewAllPOByCust.jsp?sessionId=<%=request.getParameter("sessionId")%>">Customer
							Bill</a></li>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="temp.jsp">Logout</a></li>
				</ul>
			</div>

		</div>

		<%
			List<Prod> list = new ProDAO().getAllProd();
			String Prod = "";

			for (Prod temp : list) {
				Prod = Prod + "\"" + temp.getPname() + "\",";
			}
		%>


		<script type="text/javascript">
			totalCount = 1;
			function addItem() {
				var myDiv = document.getElementById("myDiv");

				//Create array of options to be added

				var array = [
		<%=Prod%>
			];
				// var arrayValue = [];
				console.log("number of elements are " + array);

				//Create and append select list
				/*			var selectList = document.createElement("select");
				 selectList.setAttribute("id", "mySelect");
				 myDiv.appendChild(selectList);

				 //Create and append the options
				 for (var i = 0; i < array.length; i++) {
				 var option = document.createElement("option");
				 option.setAttribute("value", array[i]);
				 option.text = array[i];
				 selectList.appendChild(option);
				 }
				 */
				nameString = "";
				for (var i = 0; i < array.length; i++) {
					n = i + 1;
					nameString += '<option value="'+n+'">' + array[i] + " - "
							+ n + '</option>';
				}

				console.log(myDiv.innerHTML);

				myDiv.innerHTML += "<select name=pid"+totalCount+++">"
						+ nameString + "</select>"

				document.userForm.prodcount.value = totalCount;

			}
		</script>
		</select>
		</td>
		</tr>
		<script>
			<script type="text/javascript">
			function validate() {
				var a = document.userForm.cphone.value;
				if (a.length > 10 || a.length < 10) {
					alert("Enter proper mobile no");

					document.userForm.cphone.select();
					document.userForm.cphone.focus();
					document.userForm.cphone.value = "";
					return false;
				}
				if (isNaN(a)) {
					alert("Enter only digit");
					document.userForm.cphone.select();
					document.userForm.cphone.focus();
					document.userForm.cphone.value = "";
					return false;
				}
				var b = document.userForm.cname.value;
				if (!isNaN(b)) {
					alert("Enter only Characters");
					document.userForm.cname.select();
					document.userForm.cname.focus();
					document.userForm.cname.value = "";
					return false;
				}
			}
		</script>


		<div class="container">
			<%
				String id = request.getParameter("pmid");
				String rid = request.getParameter("rid");
			%>
			<body>
				<form name="userForm" action="cpurorder" id=payment
					onsubmit="return validate()">
					<input type="hidden" name="prodcount" value="1" />
					<div id="print"
						style="height: 400px; width: 1200px; overflow: auto">
						<br>
						<br>
						<table align="center" cellpading=20px cellspacing=30px border=2
							bordercolor=white>
							<tr>
								<td>Customer ID</td>
								<td><input type=text name="Cid" value="<%=user1%>"
									readonly=readonly></td>
							<tr>
								<td>Select Reatiler Name</td>
								<td><select name="rid" onchange="selfload()">
							<%
							
							String sql="select rid,rname from retailer group by rid";
							GetConnection gc = new GetConnection();
							
							gc.ps = GetConnection.getMysqlConnection().prepareStatement(sql);
							gc.rs1 = gc.ps.executeQuery();
							while(gc.rs1.next()){
							%>
							<option value=<%=gc.rs1.getString(1) %>><%=gc.rs1.getString(1) %>-<%=gc.rs1.getString(2) %></option>
							<%
							}
							%>
							</select></td>
							
							
							</tr>
							
							
							<tr>

								<%
									List<Prod> list2 = new ProDAO().getAllProd();
								%>
							
							<tr>
								<td>Select Type Of Product</td>
								<td><select name="pid">
										<%
											for (Prod temp : list2) {
										%>
										<option value="<%=temp.getPid()%>"><%=temp.getPname()%>
											-
											<%=temp.getPid()%></option>
										<%
											}
										%>
								</select></td>

								
							</tr>
							<tr>
							<td>Enter purdate</td>
							<td><input type="date" name="rpodate" required="required"
								placeholder="date" /></td>
						</tr>
						<tr>
							<td>Enter qty</td>
							<td><input type="text" name="rqty" required="required"
								placeholder="quantity" /></td>
						</tr>
						<tr>
							<td><input type="submit" value="submit"></td>
							<td><input type="reset"></td>
						</tr>
						</table>

						<div id="myDiv"></div>
						<br> <input type="hidden" onclick="addItem()" value="+" />
						<hr />

					</div>

					
		</div>
		</form>
		<!-- ####################################################################################################### -->
		<div class="wrapper col4">
			<div id="footer"></div>
		</div>

		<!-- ####################################################################################################### -->
		<div class="wrapper col5">
			<div id="copyright">
				<p class="fl_left">
					Copyright &copy; 2016 - All Rights Reserved - <a href="#">E-Distributed
						Channel</a>
				</p>
				<br class="clear" />
			</div>
		</div>
		</br>
</body>
</html>