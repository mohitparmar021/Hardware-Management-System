package com.hms.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.DAO.DaoClass;
import com.hms.beanClass.Login;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result=false;
		
		String username=request.getParameter("username");
		String password = request.getParameter("password");
		
		 Login login=new Login();
		 login.setUsername(username);
		 login.setPassword(password);
	   
		DaoClass obj=new DaoClass();
		try 
		{
			 result=obj.checkLogin(login);
		} catch (Exception e) 
		{
			System.out.println(e);
		}
		
		if(result)
		{
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			
			RequestDispatcher rd=request.getRequestDispatcher("admin-dashboard.jsp");
			rd.forward(request, response); 
		}
		else
		{
			response.getWriter().print("invalid password");
		}
		
	}

}
