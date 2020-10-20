package com.hms.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.DAO.DaoClass;

/**
 * Servlet implementation class SearchDepartment
 */
@WebServlet("/SearchDepartment")
public class SearchDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDepartment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String dept=request.getParameter("department");
		 
		 ResultSet rs=null;
		 
		DaoClass obj = new DaoClass();
		
		try {
			 rs=obj.showRecordDDepartment(dept);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 if(rs!=null)
		 {
			    RequestDispatcher rd=request.getRequestDispatcher("show-record-department.jsp");
			    request.setAttribute("rs", rs);
				rd.forward(request, response); 
		 }
		 else
		 {
			 response.getWriter().print("No Record Found");
		 }
		 
	}

}
