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
import com.hms.beanClass.HardwareIssued;

/**
 * Servlet implementation class IssuedHardware
 */
@WebServlet("/IssuedHardware")
public class IssuedHardware extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssuedHardware() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 boolean result=false;
			
		    int id=Integer.parseInt(request.getParameter("id"));
			String hardwarename=request.getParameter("hardwareName");
			String brand=request.getParameter("brandName");
			String dept=request.getParameter("department");
			int quantity=Integer.parseInt(request.getParameter("quantity"));
			String date=request.getParameter("date");
			String remark=request.getParameter("remark");
			
			HardwareIssued issued=new HardwareIssued();
			issued.setId(id);
			issued.setName(hardwarename);
			issued.setBrand(brand);
			issued.setDept(dept);
			issued.setQuantity(quantity);
			issued.setDate(date);
			issued.setRemark(remark);
			
			DaoClass obj=new DaoClass();
			try {
				result =obj.issueHardwareDept(issued);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result)
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("issue-hardware-dept.jsp");
				rd.forward(request, response); 
			}
			else
			{
				response.getWriter().print("wrong");
			}
			
	}

}
