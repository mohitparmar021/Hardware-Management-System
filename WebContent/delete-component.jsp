<%@page import="com.hms.DAO.DaoClass"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hms.DAO.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

int id=Integer.parseInt(request.getParameter("id"));
boolean result=false;
 DaoClass obj2=new DaoClass();
 result=obj2.deleteComponent(id);
if(result)
{
	 RequestDispatcher rd= request.getRequestDispatcher("add-component.jsp");
	 rd.forward(request, response);
}
else
{
	response.getWriter().print("Wrong Answser");
}
	

%>

</body>
</html>