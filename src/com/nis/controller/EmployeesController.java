package com.nis.controller;

import java.sql.ResultSet;

import com.nis.dao.DbHelper;
import com.nis.model.Admin;
import com.nis.model.Employees;

public class EmployeesController {
// handles CURD
	
	public static boolean addNewRecord(Employees E) {
		try {
			
			String query = "INSERT INTO employees(employeename, gender, dob, address, state, city, designation, salary, email, mobileno, picture, password) VALUE('"+E.getEmployeename()+"','"+E.getGender()+"','"+E.getDob()+"','"+E.getAddress()+"','"+E.getState()+"','"+E.getCity()+"','"+E.getDesignation()+"',"+E.getSalary()+",'"+E.getEmail()+"','"+E.getMobileno()+"','"+E.getPicture()+"','"+E.getPassword()+"')";
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: addNewRecord() "+e);
		}
		return false;
	}
	public static ResultSet displayAll() {
		try {
			
			String query = "SELECT E.employeeid, E.employeename, E.gender, E.dob, E.address, E.state, E.city, E.designation, E.salary, E.email, E.mobileno, E.picture, (SELECT statename FROM states S WHERE S.stateid=E.state), (SELECT cityname FROM cities C WHERE C.cityid = E.city) FROM employees E";
			System.out.println(query);
			ResultSet rs = DbHelper.executeQuery(query);
			return rs;
		}catch(Exception e) {
			System.out.println("Error: displayAll() "+e);
		}
		return null;
	}
	public static Employees displayById(int eid) {
		try {
			
			String query = "SELECT E.employeeid, E.employeename, E.gender, E.dob, E.address, E.state, E.city, E.designation, E.salary, E.email, E.mobileno, E.picture, E.password, (SELECT statename FROM states S WHERE S.stateid=E.state), (SELECT cityname FROM cities C WHERE C.cityid = E.city) FROM employees E WHERE E.employeeid="+eid;
			
			System.out.println(query);
			ResultSet rs = DbHelper.executeQuery(query);
			if(rs.next()) {
				Employees E = new Employees();
				E.setEmployeeid(rs.getString(1));
				E.setEmployeename(rs.getString(2));
				E.setGender(rs.getString(3));
				E.setDob(rs.getString(4));
				E.setAddress(rs.getString(5));
				E.setState(rs.getString(6)+", "+rs.getString(14));
				E.setCity(rs.getString(7)+", "+rs.getString(15));
				E.setDesignation(rs.getString(8));
				E.setSalary(Long.parseLong(rs.getString(9)));
				E.setEmail(rs.getString(10));
				E.setMobileno(rs.getString(11));
				E.setPicture(rs.getString(12));
				E.setPassword(rs.getString(13));
				
				return E;
			}
		}catch(Exception e) {
			System.out.println("Error: displayById() "+e);
		}
		return null;
	}
	public static boolean deleteRecord(int eid) {
		try {
			
			String query = "DELETE FROM employees WHERE employeeid="+eid;
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: deleteRecord() "+e);
		}
		return false;
	}
	public static boolean editRecord(Employees E) {
		try {
			
			String query = "UPDATE employees SET  employeename='"+E.getEmployeename()+"', gender='"+E.getGender()+"', dob='"+E.getDob()+"', address='"+E.getAddress()+"', state='"+E.getState()+"', city='"+E.getCity()+"', designation='"+E.getDesignation()+"',salary=+"+E.getSalary()+", email='"+E.getEmail()+"', mobileno='"+E.getMobileno()+"', picture='"+E.getPicture()+"', password='"+E.getPassword()+"' WHERE employeeid="+E.getEmployeeid();
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: editRecord() "+e);
		}
		return false;
	}
	public static boolean editPicture(int eid, String filename) {
		try {
			
			String query = "UPDATE employees SET  picture='"+filename+"' WHERE employeeid="+eid;
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: editPicture() "+e);
		}
		return false;
	}
	public static Employees checkEmployeeLogin(int id, String password) {
		try {
			String query = "SELECT * FROM employees WHERE employeeid="+id+" AND password='"+password+"'";
			ResultSet rs = DbHelper.executeQuery(query);
			if(rs.next()) {
				Employees E = new Employees();
				E.setEmployeeid(rs.getString(1));
				E.setEmployeename(rs.getString(2));
				E.setGender(rs.getString(3));
				E.setDob(rs.getString(4));
				E.setAddress(rs.getString(5));
				E.setState(rs.getString(6));
				E.setCity(rs.getString(7));
				E.setDesignation(rs.getString(8));
				E.setSalary(Long.parseLong(rs.getString(9)));
				E.setEmail(rs.getString(10));
				E.setMobileno(rs.getString(11));
				E.setPicture(rs.getString(12));
				E.setPassword(rs.getString(13));
				
				return E;
			}
			return null;
		}catch(Exception e) {
			System.out.println("Error: checkEmployeeLogin()");
		}
		return null;
	}
	public static ResultSet allEmployeeId() {
		try {

			String query = "SELECT employeeid FROM employees";
			System.out.println(query);
			ResultSet rs = DbHelper.executeQuery(query);
			return rs;
		} catch (Exception e) {
			System.out.println("Error: allEmployeeId() " + e);
		}
		return null;
	}

}
