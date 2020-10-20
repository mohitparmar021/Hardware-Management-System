package com.hms.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.hms.beanClass.BrandBean;
import com.hms.beanClass.ComponentBean;
import com.hms.beanClass.DeptBean;
import com.hms.beanClass.Hardware;
import com.hms.beanClass.HardwareIssued;
import com.hms.beanClass.Login;

public class DaoClass {

	public boolean checkLogin(Login login) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String user = login.getUsername();
		String pass = login.getPassword();

		con = MyConnection.getMyConnection();
		String query = "select * from login_info where username=? and password=?";

		stmt = con.prepareStatement(query);
		stmt.setString(1, user);
		stmt.setString(2, pass);

		rs = stmt.executeQuery();

		if (rs.next())
			return true;

		return false;
	}

	public boolean addComponent(ComponentBean compbean) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		String name = compbean.getName();
		con = MyConnection.getMyConnection();
		String query = "insert into component_info(name) values(?)";
		stmt = con.prepareStatement(query);
		stmt.setString(1, name);

		if (stmt.executeUpdate() > 0)
			return true;

		return false;

	}

	public ResultSet showComponent() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select * from component_info";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public boolean deleteComponent(int id) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "delete from component_info where id='" + id + "'";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}
		return false;
	}

	public boolean addBrand(BrandBean brandbean) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		String name = brandbean.getName();
		con = MyConnection.getMyConnection();
		String query = "insert into  brand_info(name) values(?)";
		stmt = con.prepareStatement(query);
		stmt.setString(1, name);

		if (stmt.executeUpdate() > 0)
			return true;

		return false;
	}

	public ResultSet showBrand() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select * from Brand_info";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public boolean deleteBrand(int id) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "delete from brand_info where id='" + id + "'";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}
		return false;
	}

	public boolean addDepartment(DeptBean deptbean) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		String name = deptbean.getName();
		con = MyConnection.getMyConnection();
		String query = "insert into department_info(name) values(?)";
		stmt = con.prepareStatement(query);
		stmt.setString(1, name);

		if (stmt.executeUpdate() > 0)
			return true;

		return false;
	}

	public ResultSet showDepartment() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select * from department_info";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public boolean deleteDepartment(int id) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "delete from department_info where id='" + id + "'";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}
		return false;
	}

	public boolean updateHardwareQuantity(int id, int sum) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "update hardware_available_info set quantity='" + sum + "' where id='" + id + "'";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}
		return false;
	}

	public boolean insertHardware(Hardware hardware) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = "insert into hardware_available_info(hardware_name,brand_name,quantity) values(?,?,?)";
		stmt = con.prepareStatement(query);
		stmt.setString(1, hardware.getName());
		stmt.setString(2, hardware.getBrand());
		stmt.setInt(3, hardware.getQuantity());

		if (stmt.executeUpdate() > 0)
			return true;

		return false;
	}

	public boolean hardwareAvailable(Hardware hardware) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from hardware_available_info where hardware_name=? and brand_name=?";

		stmt = con.prepareStatement(query);
		stmt.setString(1, hardware.getName());
		stmt.setString(2, hardware.getBrand());

		rs = stmt.executeQuery();

		if (rs.next()) {
			int quan = rs.getInt(4);
			int q = hardware.getQuantity();
			int sum = quan + q;
			int id = rs.getInt(1);

			return updateHardwareQuantity(id, sum);
		} else {
			return insertHardware(hardware);
		}
	}

	public boolean addHardware(Hardware hardware) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		con = MyConnection.getMyConnection();
		String query = "insert into hardware_info(hardware_name,brand_name,quantity,date,remark) values(?,?,?,?,?)";
		stmt = con.prepareStatement(query);
		stmt.setString(1, hardware.getName());
		stmt.setString(2, hardware.getBrand());
		stmt.setInt(3, hardware.getQuantity());
		stmt.setString(4, hardware.getDate());
		stmt.setString(5, hardware.getRemark());

		if (stmt.executeUpdate() > 0) {
			System.out.println("1");
			return hardwareAvailable(hardware);
		}
		return false;
	}

	public ResultSet showHardwareRecord() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select id,hardware_name,brand_name,sum(quantity) from hardware_available_info group by hardware_name,brand_name;";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public int getHardwareQuantity(int id) throws SQLException {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from hardware_available_info where id=?";

		stmt = con.prepareStatement(query);
		stmt.setInt(1, id);

		rs = stmt.executeQuery();

		if (rs.next()) {
			return rs.getInt(4);
		}

		return 0;

	}

	public boolean updateAvailableHardware(HardwareIssued issued, int id, int quantity) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();

		int q = getHardwareQuantity(id);
		int sum = q - quantity;
		String query = "update hardware_available_info set quantity='" + sum + "' where id='" + id + "'";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}
		return false;
	}

	public boolean issueHardwareDept(HardwareIssued issued) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = "insert into issued_Department_info(hardware_id,name,brand,dept,quantity,date,remark) values(?,?,?,?,?,?,?)";
		stmt = con.prepareStatement(query);

		stmt.setInt(1, issued.getId());
		stmt.setString(2, issued.getName());
		stmt.setString(3, issued.getBrand());
		stmt.setString(4, issued.getDept());
		stmt.setInt(5, issued.getQuantity());
		stmt.setString(6, issued.getDate());
		stmt.setString(7, issued.getRemark());

		if (stmt.executeUpdate() > 0) {
			int id = issued.getId();

			return updateAvailableHardware(issued, id, issued.getQuantity());
		}

		return false;
	}

	public ResultSet showRecordDDepartment(String dept) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from issued_department_info where dept=?";

		stmt = con.prepareStatement(query);
		stmt.setString(1, dept);

		rs = stmt.executeQuery();

		if (rs != null) {
			return rs;
		}

		return null;
	}

	public ResultSet showRecordDate(String to, String from) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from issued_department_info where date between ? and ?";

		stmt = con.prepareStatement(query);
		stmt.setString(1, to);
		stmt.setString(2, from);
		rs = stmt.executeQuery();

		if (rs != null) {
			return rs;
		}

		return null;
	}

	public ResultSet showRecordHardware(String name) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from issued_department_info where name=?";

		stmt = con.prepareStatement(query);
		stmt.setString(1, name);
		rs = stmt.executeQuery();

		if (rs != null) {

			return rs;
		}

		return null;

	}

	public ResultSet showIssuedRecord() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select * from issued_department_info order by date desc;";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public ResultSet showHistory() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select * from hardware_info";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public ResultSet showProfile() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select * from login_info natural join user_info ";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		return rs;
	}

	public boolean updateProfileRecord(int id, String name, String mobile, String email) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "update user_info set user_name='" + name + "' , email='" + email + "' , mobile='" + mobile
				+ "' where user_id='" + id + "';";
		if (stmt.executeUpdate(query) > 0)
			return true;

		return false;
	}

	public boolean updateUserName(String username, int id) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();

		String query = "update login_info set username='" + username + "' where id='" + id + "';";
		if (stmt.executeUpdate(query) > 0)
			return true;

		return false;
	}

	public boolean changePassword(int id, String npassword) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();

		String query = "update login_info set password='" + npassword + "' where id='" + id + "';";

		if (stmt.executeUpdate(query) > 0) {
			return true;
		}

		return false;

	}

	public int getTotalHardware() throws SQLException {
		int t = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select sum(quantity) from hardware_info";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		if (rs.next()) {
			t = rs.getInt(1);
		}

		return t;
	}

	public int getAvailableHardware() throws SQLException {
		int t = 0;

		int total = getTotalHardware();
		int issued = getIssuedHardware();

		t = total - issued;

		return t;
	}

	public int getIssuedHardware() throws SQLException {
		int t = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select sum(quantity) from issued_department_info;";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		if (rs.next()) {
			t = rs.getInt(1);
		}

		return t;
	}

	public int getHardwareType() throws SQLException {
		int t = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();
		String query = null;
		query = "select count(*) from component_info;;";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();

		if (rs.next()) {
			t = rs.getInt(1);
		}

		return t;
	}

}
