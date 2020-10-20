<%@page import="com.hms.DAO.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">

</head>
<body>

	<%@include file="views/navbar.jsp"%>

	<div id="wrapper">
		<%@include file="views/sidebar.jsp"%>

		<div id="content-wrapper">

			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item "><i
						class="fas fa-fw fa-tachometer-alt"></i> <a href="#">Dashboard</a>
					</li>
					<li class="breadcrumb-item active">Overview</li>
				</ol>


				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3 ">
						<div class="card text-white bg-primary o-hidden h-100 ">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-comments"></i>
								</div>
								<div class="hd-text">
									<%
										int t = 0;
										DaoClass obj = new DaoClass();
										t = obj.getTotalHardware();
									%>
									<h1><%=t%></h1>
									<%
										
									%>
									<h5 class="mt-3">Total Hardware in College</h5>
								</div>

							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-info o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon ">
									<i class="fas fa-fw fa-list"></i>
								</div>
								<div class="hd-text">
									<%
										int avail = 0;
										DaoClass obj1 = new DaoClass();
										avail = obj1.getAvailableHardware();
									%>
									<h1><%=avail%></h1>
									<%
										
									%>
									<h4>Available Hardware</h4>

								</div>
							</div>

						</div>
					</div>

					<div class="col-xl-3 col-sm-6 mb-3 ">
						<div class="card text-white bg-danger o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon ">
									<i class="fas fa-fw fa-shopping-cart"></i>
								</div>
								<div class="hd-text">
									<%
										int issue = 0;
										DaoClass obj2 = new DaoClass();
										issue = obj2.getIssuedHardware();
									%>
									<h1><%=issue%></h1>
									<%
										
									%>
									<h5>Issued Hardware To Department</h5>
								</div>
							</div>

						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon ">
									<i class="fas fa-fw fa-list"></i>
								</div>
								<div class="hd-text">
										<%
										int type = 0;
										DaoClass obj3 = new DaoClass();
										type = obj3.getHardwareType();
									%>
									<h1><%=type%></h1>
									<%
										
									%>
									<h5>Differnt type of Hardware</h5>
								</div>
							</div>

						</div>
					</div>


				</div>

			</div>

			<!-- Sticky Footer -->
			<%@include file="views/footer.jsp"%>

		</div>



	</div>

</body>
</html>