package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nis.controller.VehicalController;
import com.nis.model.Vehical;

/**
 * Servlet implementation class VehicalEdit
 */
@WebServlet("/VehicalEdit")
public class VehicalEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicalEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession ses = request.getSession();
		out.print("<html>");
		try{
			String nv = "Employee Id: "+ses.getValue("EMPLOYEEID").toString()+"<br>Name: "+ses.getValue("EMPLOYEENAME").toString()+"<br><img src='/Parking/images/"+ses.getValue("PICTURE").toString()+"' width=30 height=30 title='"+ses.getValue("EMPLOYEENAME").toString()+"'>";
		out.println("Employee: "+ses.getValue("EMPLOYEENAME")+" Online");
		}catch(Exception e) {
			response.sendRedirect("EmployeeLogin");
		}
		Vehical V = VehicalController.displayVehicalById(request.getParameter("vid"));
		if(V!=null) {
			out.println("<script src='/asset/jquery-3.3.1.min.js'></script>");
			
			out.println("<script src='/asset/Floor.js'></script>");
			out.println(
					"	<title>Vehical In/Out</title>\r\n" + 
					"	<body bgcolor='#000' text='#10A881'></body>\r\n" +
					"	<hr><h1><center>Vehical Edit</center></h1><hr>" + 
					"<form action='FinalEditDeleteVehical' method='get'>\r\n" + 
					"	<table align='center'>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>Employee id: </b></i></td>\r\n" + 
					"			<td><input type='number' name='eid'  value='"+V.getEmployeeid()+"'></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><h1><i><b>Vehical id: </b></i></h1></td>\r\n" + 
					"			<td><h1><input type='number' name='vid' value='"+V.getVehicalid()+"' readonly></h1></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>RFID: </b></i></td>\r\n" + 
					"			<td><input type='number' name='rfid'  value='"+V.getRfid()+"'></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>REGISTRATION NO: </b></i></td>\r\n" + 
					"			<td><input type='text' name='regno'  value='"+V.getRegistration()+"'></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>Current date: </b></i></td>\r\n" + 
					"			<td><input type='date' name='cdate' value='"+V.getCurrentdate()+"'></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>Current time: </b></i></td>\r\n" + 
					"			<td><input type='time' name='ctime' value='"+V.getCurrenttime()+"'></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>Amount: </b></i></td>\r\n" + 
					"			<td><input type='number' name='amt'  value='"+V.getAmount()+"'></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>No. of Hours: </b></i></td>\r\n" + 
					"			<td><select name='hours'><option>1</option><option>2</option><option>3</option><option>4</option></select></td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td><i><b>Status: </b></i></td>\r\n" + 
					"			<td><select name='status'><option>In</option><option>Out</option></select></td>\r\n" + 
					"		</tr>\r\n 		"
					+ "<tr>\r\n" );
			String fn[]  = V.getFloorno().split(",");
			System.out.print(fn[0]+fn[1]);
			
			out.println("<input type='hidden' name='floornotemp' value='"+fn[0]+"'>"+
					"			<td><i><b>Floor No: </b></i></td>\r\n" + 
					"			<td><select id='floorno' name='floorno' ></select>"+fn[1]+"<br><div id='fdiv'></div></td></td>\r\n" + 
					"		</tr>" +
					
					"<tr>" + 
					"	<td><i><b>Mobile No: </b></i></td>" + 
					"	<td><input type='text' name='mobileno'  value='"+V.getMobileno()+"'></td>" + 
					"		</tr>" + 
					
					"	</table>\r\n" + 
					"	<center><input type='submit' value='Edit' name='btn'>\r\n" + 
					"	<input type='submit' value='Delete' id='btn' name='btn' ></center>\r\n" + 
					"</form>");
			
			out.println("");
		}else {
			out.println("Vehical nt found...");
		}
		
		
		
	}

}
