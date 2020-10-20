<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Hardware</title>
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
					<li class="breadcrumb-item active">Add Hardware</li>
				</ol>


                <div class="card">
                       <div class="container-fluid">  
                           <form action="AddHardware" method="post" onsubmit="return validation()">
                                 <div class="form-group">
                                       <label for="hardwareName" class="mt-2">Hardware Name</label>
                                        <select class="form-control" name="hardware-name" id="select-hardware">
                                              <option value="null">-Please-Select-</option>
                                              <%
                                DaoClass obj=new DaoClass();
                                ResultSet rs=obj.showComponent();
                                int i=0;
                                while(rs.next())
                        		{
                                	 %>
                                    	  <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                                              
                                 <%
                        		}
                                 %>
                                             
                                       </select>
                                 </div>
                                 <div class="form-group">
                                       <label for="brandName" class="mt-2">Brand Name</label>
                                       <select class="form-control" name="brand-name" id="select-brand">
                                              <option value="null">-Please-Select-</option>
                                             
                                    <%
                                DaoClass obj1=new DaoClass();
                                ResultSet rs1=obj1.showBrand();
                                while(rs1.next())
                        		{
                        	    %>
                                      <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
                                 <%
                        		}
                                 %>
                                       </select>  
                                  </div>
                                 <div class="form-group">
                                       <label for="quantity" class="mt-2">Quantity</label>
                                       <input type="number"  name="quantity" id="quantity" class="form-control">
                                 </div>
                                  <div class="form-group">
                                       <label for="date" class="mt-2">Date</label>
                                       <input type="date"  name="date" id="date" class="form-control">
                                 </div>
                                   <div class="form-group">
                                       <label for="remark" class="mt-2">Remark</label>
                                       <input type="text"  name="remark" id="remark" class="form-control">
                                 </div>
                                  <input type="submit"  name="" class="btn btn-info mb-2 btn-lg btn-add" value="Add">
                           </form>
              
                       </div>
                </div>

			</div>

			<!-- Sticky Footer -->
			

		</div>

<script type="text/javascript">
	
	
    function validation() 
    {
    	var brand=document.getElementById('select-brand').value;
    	var hardware=document.getElementById('select-hardware').value;
    	var quantity=document.getElementById('quantity').value;
    	var date=document.getElementById('date').value;
    	var remark=document.getElementById('remark').value;
    
        
    	if(hardware=="null")
    	{
    		alert("Please Enter Hardware Name");
    		return false;
    	}
    	else if(brand=="null")
    	{
    		alert("Please Enter Brand Name");
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
    		alert(hardware + " is added Successfully...");
    		 return true;
    		}
    }

</script>



	</div>

</body>
</html>