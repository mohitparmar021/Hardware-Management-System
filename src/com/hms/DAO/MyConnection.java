package com.hms.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
         
	public static Connection getMyConnection()
	{
		Connection con=null;
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hardwaresystem","root","mohit");
			
		} catch (Exception e) 
		{
			System.out.println(e);
		}
		
		return con;
	}
	
}
