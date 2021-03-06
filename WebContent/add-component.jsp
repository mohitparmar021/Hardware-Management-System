<%@page import="com.sun.webkit.ContextMenu.ShowContext"%>
<%@page import="com.hms.DAO.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Component</title>
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
        .component-field
        {
           width:30%;
        }
</style>
</head>
<body>

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
					<li class="breadcrumb-item active">Add Component</li>
				</ol>


                <div class="card">
                       <div class="container-fluid">  
                           <form action="add-component" method="post" onsubmit="return validation()">
                                 <div class="form-group">
                                       <label for="component" class="mt-3">Component Name</label>
                                       <input type="text" name="component"  autocomplete="off" id="component" class="form-control component-field">
                                 </div>
                                  <input type="submit"  name="" class="btn btn-info btn-lg btn-add" value="Add">
                           </form>

                   <div class="card mb-3 mt-4">
                       <div class="card-body">     
                           <h4 >Manage Component</h4><br>

                           <table class="table-responsive-lg table-striped" cellpadding="7px" style="width:100%" border="1px">
                           <thead>
                            <tr class="bg-info text-white"> 
                                      <th>Sr. Number</th>
                                      <th>Component Name</th>
                                      <th>Action</th>
                                 </tr>
                            </thead>
                            <tbody>
                           <%
                                DaoClass obj=new DaoClass();
                                ResultSet rs=obj.showComponent();
                                int i=0;
                                while(rs.next())
                        		{
                        	 %>
           
                                    	 <tr>
                                              <td><%=++i %></td>
                                              <td><%=rs.getString(2)%></td>
                                              <td><a href="delete-component.jsp?id=<%=rs.getInt(1) %>">Delete</a></td>
                                          </tr>
                                 <%
                        		}
                                 %>
                                        
                            </tbody>
                             
                         </table>
                    
                     </div>
                  </div>
                     
              
             </div>
                </div>

			</div>

			<!-- Sticky Footer -->
			

		</div>



	</div>

<script type="text/javascript">
	
	
    function validation() 
    {
    	var name=document.getElementById('component').value;
    	if(name=="")
    	{
    		alert("Please Enter Component Name");
    		return false;
    	}
    	else
    		{
    		alert(name +" is added Successfully...");
    		 return true;
    		}
    }

</script>
</body>
</html>