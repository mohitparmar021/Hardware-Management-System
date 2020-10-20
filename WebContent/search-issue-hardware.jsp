<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<style>
body
{
background-color: #0c8497;
}

.btn-add {
	width: 17%;
	border-radius: 0px;
}

.dept {
	width: 98%;
}

#to {
	width: 98%;
}

#from , #select-hardware{
	width: 98%;
}
.card-color
{
  background-color:#f1f1f1;
}

</style>
</head>
<body>

	<%@include file="views/navbar.jsp"%>

	<div id="wrapper">
		<%@include file="views/sidebar.jsp"%>

		<div id="content-wrapper" class="bg-white">

			<div class="container-fluid ">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item "><i
						class="fas fa-fw fa-tachometer-alt"></i> <a href="#">Dashboard</a>
					</li>
					<li class="breadcrumb-item active">Search Issued Hardware</li>
				</ol>


				<div class="card">
					<div class="container-fluid">
						<h4 class="mt-3">Search Issued Hardware Record ( Filter )</h4>
						<br>

						<div class="card card-color">
							<form action="SearchDepartment" method="post" onsubmit="return validationDept()">
								<div class="form-group">
									<label for="department" class="mt-2 ml-2">Department
										Name</label> <select class="form-control ml-2 mr-4 dept"
										name="department" id="department">
										<option value="null">-Please-Select-</option>
										<%
											DaoClass obj12 = new DaoClass();
											ResultSet rs12 = obj12.showDepartment();
											while (rs12.next()) {
										%>
										<option value="<%=rs12.getString(2)%>"><%=rs12.getString(2)%></option>
										<%
											}
										%>

									</select>
								</div>
								<input type="submit" name=""
									class="btn btn-info mb-2 ml-2 btn-lg btn-add" value="Search">

							</form>
						</div>
						<div class="card mt-3 card-color">

							<form action="SearchDate" method="post" onsubmit="return validationDate()">
								<div class="form-group">
									<label for="to" class="mt-2 ml-2">To</label> <input type="date"
										name="to" id="to" class="form-control ml-2">
								</div>
								<div class="form-group">
									<label for="from" class="mt-2 ml-2">From</label> <input
										type=date name="from" id="from" class="form-control ml-2">
								</div>
								<input type="submit" name=""
									class="btn btn-info mb-2 ml-2 btn-lg btn-add" value="Search">

							</form>


						</div>
						<div class="card mt-3 mb-3 card-color">

							<form action="SearchHardware" method="post"
								onsubmit="return validationHardware()">
								<div class="form-group">
									<label for="hardwareName" class="mt-2 ml-2">Hardware Name</label>
									 <select class="form-control ml-2" name="name" id="select-hardware">
										<option value="null">-Please-Select-</option>
										<%
											DaoClass obj = new DaoClass();
											ResultSet rs = obj.showComponent();
											int i = 0;
											while (rs.next()) {
										%>
										<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>

										<%
											}
										%>

									</select>
								</div>
								<input type="submit" name=""
									class="btn btn-info mb-2 ml-2 btn-lg btn-add" value="Search">

							</form>


						</div>

					</div>
				</div>

			</div>

			<!-- Sticky Footer -->


		</div>
	</div>
	<script type="text/javascript">
		function validationDept() {
			var dept = document.getElementById('department').value;
			//var hardware=document.getElementById('select-hardware').value;
			//	var quantity=document.getElementById('quantity').value;
			//var date=document.getElementById('date').value;
			//	var remark=document.getElementById('remark').value;

			if (dept == "null") {
				alert("Please Enter Department Name");
				return false;
			}

			else {
				return true;
			}
		}
	</script>

</body>
</html>