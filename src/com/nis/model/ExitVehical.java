package com.nis.model;

public class ExitVehical {
	private int transectionid;
	private int vehicalid;
	private String exitdate;
	private String exittime;
	private int employeeid;
	public void setEmployeeid(int employeeid) {
		this.employeeid = employeeid;
	}
	public int getEmployeeid() {
		return employeeid;
	}
	public int getTransectionid() {
		return transectionid;
	}
	public void setTransectionid(int transectionid) {
		this.transectionid = transectionid;
	}
	public int getVehicalid() {
		return vehicalid;
	}
	public void setVehicalid(int vehicalid) {
		this.vehicalid = vehicalid;
	}
	public String getExitdate() {
		return exitdate;
	}
	public void setExitdate(String exitdate) {
		this.exitdate = exitdate;
	}
	public String getExittime() {
		return exittime;
	}
	public void setExittime(String exittime) {
		this.exittime = exittime;
	}

	
	
}
