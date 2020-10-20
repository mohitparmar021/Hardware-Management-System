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
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean result = false;
		boolean ans = false;

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");

		DaoClass obj = new DaoClass();
		DaoClass obj1 = new DaoClass();

		HttpSession session = request.getSession();
        session.setAttribute("username", username);
		
		try {
			result = obj.updateProfileRecord(id, name, mobile, email);
			ans = obj1.updateUserName(username, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result && ans) {
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);
		}

	}

}
