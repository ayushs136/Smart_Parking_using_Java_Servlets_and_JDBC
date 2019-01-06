package com.nis.controller;

import com.nis.dao.DbHelper;
import com.nis.model.ExitVehical;
import com.nis.model.Vehical;

public class ExitVehicalsController {
	public static boolean addNewVehical(ExitVehical V) {
		try {
//			String query="INSERT INTO vehical VALUES("+V.getEmployeeid()+", "+V.getVehicalid()+", "+V.getRfid()+",'"+V.getRegistration()+"', '"+V.getCurrentdate()+"',  "+V.getAmount()+", "+V.getHours()+", '"+V.getStatus()+"', "+V.getFloorno()+", '"+V.getMobileno()+"','"+V.getCurrenttime()+"')";
			String query = "INSERT INTO exitvehical(employeeid, vehicalid, exitdate, exittime) VALUES("+V.getEmployeeid()+", "+V.getVehicalid()+", '"+V.getExitdate()+"', '"+V.getExittime()+"')";
			System.out.println(query);
			boolean status = DbHelper.executeUpdate(query);
			return status;
		}catch(Exception e) {
			System.out.println("Error: addNewVehical() "+e);
		}
		return false;
	}
}
