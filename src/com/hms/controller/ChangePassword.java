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

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		boolean result=false;
		
		HttpSession session=request.getSession();
		
		String sessionuser=(String)session.getAttribute("username");
		 
		int id=Integer.parseInt(request.getParameter("id"));
		String username =request.getParameter("username");
		String npassword =request.getParameter("npassword");
		
		System.out.print(sessionuser);
		
		if(username.equals(sessionuser))
		{
			DaoClass obj=new DaoClass();
			try {
				result=	obj.changePassword(id,npassword);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result)
			{
				 RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
				   rd.forward(request, response);
			}
			else
			{
				response.getWriter().print("Password Not Updated ....");
			}
			
			
		}
		else
		{
			response.getWriter().print("UserName does Not Exist..");
		}
		
	
	}

}
