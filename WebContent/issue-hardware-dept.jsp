<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue Hardware To Dept</title>
<link rel="stylesheet" type="text/css"
href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<style>
.btn-add
       {
          width: 17%;
          border-radius: 0px;
        }

</style>
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
					<li class="breadcrumb-item active">Issue Hardware To Department</li>
				</ol>


                <div class="card">
                       <div class="container-fluid">  
                           <h4 class="mt-3">Available Hardware in College</h4><br>

                           <table class="table-responsive-lg table-striped mb-3" cellpadding="7px" style="width:100%" border="1px">
                           <thead>
                                 <tr class="bg-info text-white"> 
                                      <th>Sr. Number</th>
                                      <th>Hardware Name</th>
                                      <th>Brand Name</th>
                                      <th>Quantity</th>
                                      <th>Action</th>
                                 </tr>
                            </thead>
                            <tbody>
                           <%
                                DaoClass obj=new DaoClass();
                                ResultSet rs=obj.showHardwareRecord();
                                int i=0;
                                while(rs.next())
                        		{
                        	 %>
           
                                    	 <tr>
                                              <td><%=++i %></td>
                                              <td><%=rs.getString(2)%></td>
                                              <td><%=rs.getString(3)%></td>
                                              <td><%=rs.getInt(4)%></td>
                                              <td><a href="issued-hardware.jsp?id=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>&brand=<%=rs.getString(3)%>&quantity=<%=rs.getInt(4)%>">Click To Issue</a></td>
                                         </tr>
                                 <%
                        		}
                                 %>
                                       
                            </tbody>

                             
                         </table>
                   
                       </div>
                </div>

			</div>

			<!-- Sticky Footer -->
			

		</div>
	</div>

</body>
</html>