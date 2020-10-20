<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update profile</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<style>
.btn-add {
	width: 17%;
	border-radius: 0px;
}
.update-btn
{
width: 27%;
  border-radius:0px;
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
					<li class="breadcrumb-item active">Update Profile</li>
				</ol>


				<div class="card">
					<div class="container-fluid">
                         <h3 class="mt-3 mb-3">Update Account Information</h3>
						<table class="table-responsive-lg mb-3"
							cellpadding="7px" style="width: 100%" border="0px">
						
							<tbody>
								 <%
                                DaoClass obj=new DaoClass();
                                ResultSet rs=obj.showProfile();
                                int i=0;
                                while(rs.next())
                        		{
                        	 %>      <form action="UpdateProfile" method="post" onsubmit="return validation()">
                        	               <tr>
                                                  <td class="font-weight-bold">Id Number</td>
                                                  <td class="font-weight-bold">:</td>
                                                  <td><input type="number" name="id" readonly value="<%=rs.getInt("user_id") %>" class="form-control"></td> 
                                             </tr>
                                            <tr>
                                                  <td class="font-weight-bold">Name </td>
                                                   <td class="font-weight-bold">:</td>
                                                   <td><input type="text" name="name" id="name"  value="<%=rs.getString("user_name") %>" class="form-control"></td> 
                                                  <td></td>
                                             </tr>
                                             <tr>
                                                  <td class="font-weight-bold">Username </td>
                                                   <td class="font-weight-bold">:</td>
                                                  <td><input type="text" id="username" name="username" value="<%=rs.getString("username") %>" class="form-control"></td>
                                             </tr>
                                             <tr>
                                                  <td class="font-weight-bold">Mobile Number </td>
                                                   <td class="font-weight-bold">:</td>
                                                  <td><input type="text" id="mobile" name="mobile" value="<%=rs.getString("mobile") %>" class="form-control"></td>
                                             
                                             </tr>
                                              <tr>
                                                  <td class="font-weight-bold">Email Id</td>
                                                   <td class="font-weight-bold">:</td>
                                                 <td><input type="email" id="email" name="email" value="<%=rs.getString("email") %>" class="form-control"></td>
                                             
                                             </tr>
                                             <tr >
                                             <td><input type="submit" value="Update" class="btn btn-lg update-btn bg-info">
                                             </td>
                                             </tr>
                                     </form>
                                                
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


<script type="text/javascript">
	
	
    function validation() 
    {
    	var name=document.getElementById('name').value;
    	var username=document.getElementById('username').value;
    	var email=document.getElementById('email').value;
    	var mobile=document.getElementById('mobile').value;
    	if(name=="")
    	{
    		alert("Please Enter Name");
    		return false;
    	}
    	else if(username=="")
    	{
    		alert("Please Enter UserName");
    		return false;
    	}
    	else if(mobile=="")
    	{
    		alert("Please Enter 10 Digit Mobile Number");
    		return false;
    	}
    	else if(email=="")
    	{
    		alert("Please Enter Email");
    		return false;
    	}
    		{
    		alert("Profile is Updated Successfully...");
    		 return true;
    		}
    }

</script>

</body>
</html>