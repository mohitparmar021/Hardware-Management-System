<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import= "javax.servlet.http.HttpServletRequest"%>
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
body
{
  background-color: #0c8497;
}
.btn-add
       {
          width: 17%;
          border-radius: 0px;
        }

</style>
</head>
<body>
     
     
      <%
      int id=Integer.parseInt(request.getParameter("id"));
      String name=request.getParameter("name");
      String brand=request.getParameter("brand");
      int quantity=Integer.parseInt(request.getParameter("quantity"));

      %>
	<%@include file="views/navbar.jsp"%>

	<div id="wrapper">
		<%@include file="views/sidebar.jsp"%>

		<div id="content-wrapper" class="bg-white">

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
                           <form action="IssuedHardware" method="post" onsubmit="return validation()">
                                 <div class="form-group">
                                       <label for="id" class="mt-2">Hardware ID</label>
                                       <input type=number  name="id" value="<%=id %>"  id="id" class="form-control">
                                 </div>
                           
                                 <div class="form-group">
                                       <label for="hardwareName" class="">Hardware Name</label>
                                        <input type="text" name="hardwareName" value="<%=name %>"    class="form-control" id="hardwareName">
                                 </div>
                                 <div class="form-group">
                                       <label for="brandName" class="">Brand Name</label>
                                        <input type="text" name="brandName" value="<%=brand %>"  class="form-control" id="brandName">
                                  </div>
                                   <div class="form-group">
                                       <label for="department" class="">Department Name</label>
                                       <select class="form-control" name="department" id="department">
                                              <option value="null">-Please-Select-</option>
                                      <%
                                 DaoClass obj12=new DaoClass();
                                ResultSet rs12=obj12.showDepartment();
                                while(rs12.next())
                        		{
                        	    %>
                                      <option value="<%=rs12.getString(2)%>"><%=rs12.getString(2)%></option>
                                 <%
                        		}
                                 %>
                              
                                       </select>  
                                  </div>
                                  
                                 <div class="form-group">
                                       <label for="quantity" class="">Quantity</label> <span class="text-danger small ml-"> **Available Hardware <%=quantity %>**</span>
                                       <input type="number"  name="quantity"  id="quantity" class="form-control">
                                 </div>
                                  <div class="form-group">
                                       <label for="date" class="">Date</label>
                                       <input type=date  name="date" id="date" class="form-control">
                                 </div>
                                   <div class="form-group">
                                       <label for="remark" class="">Remark</label>
                                       <input type="text"  name="remark" id="remark" class="form-control">
                                 </div>
                                  <input type="submit"  name="" class="btn btn-info mb-5 btn-lg btn-add" value="Issued Hardware">
                           </form>
              
                       </div>
                </div>

			</div>

			<!-- Sticky Footer -->
			

		</div>
	</div>
<script type="text/javascript">
	
	
    function validation() 
    {
    	var name=document.getElementById('hardwareName').value;
        var department=document.getElementById('department').value;
    	var quantity=document.getElementById('quantity').value;
    	var date=document.getElementById('date').value;
    	var remark=document.getElementById('remark').value;
        
    	if(department=="null")
    	{
    		alert("Please Enter Department Name");
    		return false;
    	}
    	else if(quantity=="")
    		{
    		alert("Please Enter Quantity");
    		return false;
    		}
       	else if(date=="")
    	{
    		alert("Please Enter Date");
    		return false;
    	}
    	else if(remark=="")
    	{
    		alert("Please Enter Remark");
    		return false;
    	}
    	else
    		{
    		alert(name + " is  Successfully Issued");
    		 return true;
    		}
    }

</script>





</body>
</html>