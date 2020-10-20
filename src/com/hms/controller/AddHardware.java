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
import com.hms.beanClass.Hardware;

/**
 * Servlet implementation class AddHardware
 */
@WebServlet("/AddHardware")
public class AddHardware extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddHardware() {
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
	    
	    boolean result=false;
		
		String hardware_name=request.getParameter("hardware-name");
		String brand=request.getParameter("brand-name");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		String date=request.getParameter("date");
		String remark=request.getParameter("remark");
		
		
		Hardware hardware=new Hardware();
		hardware.setName(hardware_name);
		hardware.setBrand(brand);
		hardware.setQuantity(quantity);
		hardware.setDate(date);
		hardware.setRemark(remark);
		
		DaoClass obj=new DaoClass();
		try
		{
		  result=obj.addHardware(hardware);
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if(result)
		{
			RequestDispatcher rd=request.getRequestDispatcher("add-hardware.jsp");
			rd.forward(request, response); 
		}
		else
		{
			response.getWriter().print("wrong");
		}
		
	}

}
