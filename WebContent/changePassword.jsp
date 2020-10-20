<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
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
width: 35%;
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
					<li class="breadcrumb-item active">Change Password</li>
				</ol>


				<div class="card">
					<div class="container-fluid">
                         <h3 class="mt-3 mb-3">Change Password</h3>
						<table class="table-responsive-lg mb-3"
							cellpadding="7px" style="width: 100%" border="0px">
						
							<tbody>
								 <%
                                DaoClass obj=new DaoClass();
                                ResultSet rs=obj.showProfile();
                                int i=0;
                                while(rs.next())
                        		{
                        	 %>      <form action="ChangePassword" method="post" onsubmit="return validation()">
                        	               <tr>
                                                  <td class="font-weight-bold">Id Number</td>
                                                  <td class="font-weight-bold">:</td>
                                                  <td><input type="number" name="id" readonly value="<%=rs.getInt("user_id") %>" class="form-control"></td> 
                                             </tr>
                                            <tr>
                                                  <td class="font-weight-bold">UserName </td>
                                                   <td class="font-weight-bold">:</td>
                                                   <td><input type="text" name="username" autocomplete="off" id="username"  class="form-control"></td> 
                                                  <td></td>
                                             </tr>
                                            
                                             <tr>
                                                  <td class="font-weight-bold">New Password </td>
                                                   <td class="font-weight-bold">:</td>
                                                  <td><input type="password" id="npassword" name="npassword" value="" class="form-control"></td>
                                             
                                             </tr>
                                              <tr>
                                                  <td class="font-weight-bold">Confirm Password</td>
                                                   <td class="font-weight-bold">:</td>
                                                 <td><input type="password" id="cpassword" name="cpassword" value="" class="form-control"></td>
                                             
                                             </tr>
                                             <tr >
                                             <td><input type="submit" value="Change Password" class="btn btn-lg update-btn bg-info">
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
    	var username=document.getElementById('username').value;
    	var cpassword=document.getElementById('cpassword').value;
    	var npassword=document.getElementById('npassword').value;
    	if(username=="")
    	{
    		alert("Please Enter UserName");
    		return false;
    	}
    	else if(npassword=="")
    	{
    		alert("Please Enter New Password");
    		return false;
    	}
    	else if(cpassword=="")
    	{
    		alert("Please Confirm Password");
    		return false;
    	}
    	else if(npassword!=cpassword)
    	{
    		alert("Please Correct Your Password");
    		return false;
    	}
    		{
    		alert("Password Changed  Successfully...");
    		 return true;
    		}
    }

</script>

</body>
</html>