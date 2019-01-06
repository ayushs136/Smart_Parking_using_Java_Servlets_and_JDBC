package com.nis.controller;

import java.sql.ResultSet;

import com.nis.dao.DbHelper;

import com.nis.model.Vehical;

public class VehicalController {
	public static boolean addNewVehical(Vehical V) {
		try {
//			String query="INSERT INTO vehical VALUES("+V.getEmployeeid()+", "+V.getVehicalid()+", "+V.getRfid()+",'"+V.getRegistration()+"', '"+V.getCurrentdate()+"',  "+V.getAmount()+", "+V.getHours()+", '"+V.getStatus()+"', "+V.getFloorno()+", '"+V.getMobileno()+"','"+V.getCurrenttime()+"')";
			String query = "INSERT INTO vehical(employeeid, rfid, registration, currentdate, amount , hours, status, floorno, mobileno, currenttime) VALUE("+V.getEmployeeid()+",'"+V.getRfid()+"', '"+V.getRegistration()+"', '"+V.getCurrentdate()+"',  "+V.getAmount()+", "+V.getHours()+", '"+V.getStatus()+"', "+V.getFloorno()+", '"+V.getMobileno()+"','"+V.getCurrenttime()+"')";;
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: addNewVehical() "+e);
		}
		return false;
	}
	
	public static ResultSet displayAllVehicals() {
		try {
			String query = "SELECT V.vehicalid, V.Employeeid, V.rfid, V.registration, V.currentdate, V.amount, V.hours, V.status, V.floorno, V.mobileno, V.currenttime, (SELECT floorname FROM floor F WHERE F.floorno=V.floorno) as floorname FROM vehical V where status='In'";
			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			return rs;
		}catch(Exception e) {
			System.out.println("Error: displayAllVehicals()");
		}
		return null;
	}
	public static Vehical displayVehicalById(String vid) {
		try {
		
			String query = "SELECT V.vehicalid, V.Employeeid, V.rfid, V.registration, V.currentdate, V.amount, V.hours, V.status, V.floorno, V.mobileno, V.currenttime, (SELECT floorname FROM floor F WHERE F.floorno=V.floorno) as floorname FROM vehical V  WHERE vehicalid='"+vid+"' Or registration='"+vid+"' or mobileno='"+vid+"'";
			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			if(rs.next()) {
				Vehical V = new Vehical();
				V.setVehicalid(Integer.parseInt(rs.getString(1)));
				V.setEmployeeid(Integer.parseInt(rs.getString(2)));
				V.setRfid(rs.getString(3));
				V.setRegistration(rs.getString(4));
				V.setCurrentdate(rs.getString(5));
				V.setCurrenttime(rs.getString(11));
				V.setAmount(Integer.parseInt(rs.getString(6)));
				V.setHours(Integer.parseInt(rs.getString(7)));
				V.setStatus(rs.getString(8));
				V.setFloorno(rs.getString(9)+ ", "+rs.getString(12));
				V.setMobileno(rs.getString(10));
				return V;
			}

		}catch(Exception e) {
			System.out.println("Error: displayVehicalById()");
		}
		return null;
	}
	
	public static boolean deleteVehical(int vid) {
		try {
			
			String query = "DELETE FROM vehical WHERE vehicalid="+vid;
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: deleteVehical() "+e);
		}
		return false;
	}
	public static boolean editVehicalRecord(Vehical V) {
		try {
			
			String query = "UPDATE vehical SET  employeeid="+V.getEmployeeid()+",rfid='"+V.getRfid()+"', registration='"+V.getRegistration()+"',currentdate='"+V.getCurrentdate()+"',currenttime='"+V.getCurrenttime()+"',amount="+V.getAmount()+", hours="+V.getHours()+",status='"+V.getStatus()+"',floorno="+V.getFloorno()+",mobileno='"+V.getMobileno()+"' WHERE vehicalid="+V.getVehicalid();
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: editVehicalRecord() "+e);
		}
		return false;
	}
	
	public static boolean UpdateStatus(int vid) {
		try {
			
			String query = "UPDATE vehical SET status='out' WHERE vehicalid="+vid;
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: UpdateStatus() "+e);
		}
		return false;
	}
	public static ResultSet displayVehicalByRfid(String rfid) {
		try {
//			String query = "SELECT * FROM vehical WHERE rfid='"+rfid+"'";
			String query = "SELECT V.vehicalid, V.Employeeid, V.rfid, V.registration, V.currentdate, V.amount, V.hours, V.status, V.floorno, V.mobileno, V.currenttime, (SELECT floorname FROM floor F WHERE F.floorno=V.floorno) as floorname FROM vehical V  WHERE rfid='"+rfid+"' and status='In'";
			
			
			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			return rs;
		}catch(Exception e) {
			System.out.println("Error: displayVehicalByRfid()");
		}
		return null;
	}
	public static String  readRFID() {
		try {
			String query = "SELECT * FROM rfid";

			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			if(rs.next()) {
				return rs.getString(1);
			}else {
				return "";
			}
			
		}catch(Exception e) {
			System.out.println("Error: readRFID()");
		}
		return null;
	}
	
	public static boolean removeRFID() {
		try {
			
			String query = "DELETE FROM rfid";
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: removeRFID() "+e);
		}
		return false;
	}
	
	public static ResultSet displayVehicalBetweenDates(String d1, String d2) {
		try {
			String query = "SELECT V.vehicalid, V.Employeeid, V.rfid, V.registration, V.currentdate, V.amount, V.hours, V.status, V.floorno, V.mobileno, V.currenttime, (SELECT floorname FROM floor F WHERE F.floorno=V.floorno) as floorname FROM vehical V  WHERE currentdate between '"+d1+"' and '"+d2+"'";
			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			return rs;
		}catch(Exception e) {
			System.out.println("Error: displayVehicalBetweenDates()");
		}
		return null;
	}
	

	public static ResultSet searchByEmployeeId(int eid, String d1, String d2) {
		try {
			String query = "SELECT V.vehicalid, V.Employeeid, V.rfid, V.registration, V.currentdate, V.amount, V.hours, V.status, V.floorno, V.mobileno, V.currenttime, (SELECT floorname FROM floor F WHERE F.floorno=V.floorno) as floorname FROM vehical V  WHERE employeeid="+eid+" and currentdate between '"+d1+"' and '"+d2+"'";
			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			return rs;
		}catch(Exception e) {
			System.out.println("Error: searchByEmployeeId()");
		}
		return null;
	}
	public static boolean deleteVehicalOut(int vid) {
		try {
			
			String query = "DELETE FROM vehical WHERE status='out' and vehicalid="+vid;
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: deleteVehicalOut() "+e);
		}
		return false;
	}
}
