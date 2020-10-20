package com.hms.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.DAO.DaoClass;
import com.hms.beanClass.DeptBean;

/**
 * Servlet implementation class AddDepartment
 */
@WebServlet("/AddDepartment")
public class AddDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDepartment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result=false;
        
		String name=request.getParameter("department");
		
		DeptBean deptbean=new DeptBean();
		deptbean.setName(name);
		
		DaoClass obj=new DaoClass();
	    try {
			result=obj.addDepartment(deptbean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		if(result)
		{
			RequestDispatcher rd=request.getRequestDispatcher("add-department.jsp");
			rd.forward(request, response); 
		}
		else
		{
			response.getWriter().print("wrong");
		}
	}
}
