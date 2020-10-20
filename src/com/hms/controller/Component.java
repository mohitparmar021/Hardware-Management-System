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
import com.hms.beanClass.ComponentBean;

/**
 * Servlet implementation class Component
 */
@WebServlet("/add-component")
public class Component extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Component() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        boolean result=false;
        
		String comp=request.getParameter("component");
		
		ComponentBean compbean=new ComponentBean();
		compbean.setName(comp);
		
		DaoClass obj=new DaoClass();
	    try {
			result=obj.addComponent(compbean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		if(result)
		{
			RequestDispatcher rd=request.getRequestDispatcher("add-component.jsp");
			rd.forward(request, response); 
		}
		
			
	}

}
