package com.nis.controller;

import java.sql.ResultSet;

import com.nis.dao.DbHelper;

public class StateCityController {
	public static ResultSet fetchAllStates() {
		try {
			ResultSet rs = DbHelper.executeQuery("SELECT * FROM states");
			return rs;
		}catch(Exception e) {
			System.out.println("Error:  fetchAllStates()"+e);
		}
		return null;
	}

	public static ResultSet fetchAllCities(int stateid) {
		try {
			ResultSet rs = DbHelper.executeQuery("SELECT * FROM cities WHERE stateid='"+stateid+"'");
			return rs;
		}catch(Exception e) {
			System.out.println("Error:  fetchAllCities()"+e);
		}
		return null;
	}
	
	
	

}
