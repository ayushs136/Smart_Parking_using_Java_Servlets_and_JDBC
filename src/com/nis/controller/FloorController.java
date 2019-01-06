package com.nis.controller;

import java.sql.ResultSet;
import java.util.Calendar;

import com.nis.dao.DbHelper;
import com.nis.model.Floors;

public class FloorController {
	public static boolean addFloor(Floors F) {
		try {
			String query =  "INSERT INTO floor VALUES("+F.getFloorno()+", '"+F.getFloorname()+"',"+F.getNoofspace()+")";
			boolean status = DbHelper.executeUpdate(query);
			return status;			
		}catch(Exception e) {
			System.out.println("Error: addFloor()"+e);
		}
		return false;
	}
	
	public static ResultSet fetchAllFloor() {
		try {
			ResultSet rs = DbHelper.executeQuery("SELECT * FROM floor");
			return rs;
		}catch(Exception e) {
			System.out.println("Error:  fetchAllFloor()"+e);
		}
		return null;
	}
	public static ResultSet fetchTotalSpace(int fid) {
		try {
			Calendar C =  Calendar.getInstance();
			String cd = C.get(Calendar.YEAR)+"/"+(C.get(Calendar.MONTH)+1)+"/"+C.get(Calendar.DATE);
			String query="select f.noofspace,count(v.floorno) as totalvehical,(f.noofspace-count(v.floorno)) as avl_space from floor f,vehical v where v.floorno=f.floorno and v.status='In' and v.floorno="+fid+" group by v.floorno";
			System.out.println(query);
			ResultSet rs = DbHelper.executeQuery(query);
			System.out.println(query);
			return rs;
		}catch(Exception e) {
			System.out.println("Error:  fetchTotalSpace()"+e);
		}
		return null;
	}

	
	
}
