package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nis.controller.VehicalController;

/**
 * Servlet implementation class VehicalPage
 */
@WebServlet("/VehicalView")
public class VehicalView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicalView() {
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
		out.println("<html>");
		try{
			String nv = "Employee Id: "+ses.getValue("EMPLOYEEID").toString()+"<br>Name: "+ses.getValue("EMPLOYEENAME").toString()+"<br><img src='/Parking/images/"+ses.getValue("PICTURE").toString()+"' width=30 height=30 title='"+ses.getValue("EMPLOYEENAME").toString()+"'>";
		out.println("Employee: "+ses.getValue("EMPLOYEENAME")+" Online");
		}catch(Exception e) {
			response.sendRedirect("EmployeeLogin");
		}
out.println("<script src='/asset/jquery-3.3.1.min.js'></script>");
		
		out.println("<script src='/asset/Floor.js'></script>");

		String rfidno  = VehicalController.readRFID();
		if(rfidno.length()==12) {
			out.println("<meta http-equiv='refresh' content='-5'>");
		}
		else {
			out.println("<meta http-equiv='refresh' content='5'>");
		}
		out.print( "<link rel=\"shortcut icon\" type=\"image/png\" href='/Parking/images/GEO.png'>\r\n" + 
				"	<title>Vehical In/Out</title>\r\n" + 
				"	<body bgcolor='#000' text='#1BCA9B'></body>\r\n" + 
				"	<hr><h1><center>Vehical In/Out</center></h1><hr>" + 
				"<form action='VehicalSubmit' method='get'>\r\n" + 
				"	<table align='center'>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Employee id: </b></i></td>\r\n" + 
				"			<td><input type='number' name='eid' placeholder='Employee id' value="+ses.getValue("EMPLOYEEID")+"></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
//				"			<td><i><b>Vehical id: </b></i></td>\r\n" + 
//				"			<td><input type='number' name='vid' placeholder='Vahical id'></td>\r\n" + 
//				"		</tr>\r\n" + 
				"		<tr>\r\n" );
		
		
		out.println(
				"			<td><i><b>RFID: </b></i></td>\r\n" + 
				"			<td><input type='number' name='rfid' value="+rfidno+" readonly></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>REGISTRATION NO: </b></i></td>\r\n" + 
				"			<td><input type='text' name='regno' placeholder='REGISTRATION NO'></td>\r\n" + 
				"		</tr>");
		
		Calendar C = Calendar.getInstance();
		String cd = C.get(Calendar.YEAR)+"/"+(C.get(Calendar.MONTH)+1)+"/"+C.get(Calendar.DATE);
		String ct = C.get(Calendar.HOUR)+":"+C.get(Calendar.MINUTE)+":"+C.get(Calendar.SECOND);
		
		
		out.print(
				"		<tr>	<td><i><b>Current date: </b></i></td>\r\n" + 
				"			<td><input type='text' name='cdate' value='"+cd+"'></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Current time: </b></i></td>\r\n" + 
				"			<td><input type='text' name='ctime' value='"+ct+"'></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Amount: </b></i></td>\r\n" + 
				"			<td><input type='number' name='amt' placeholder='Amount' value=30></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>No. of Hours: </b></i></td>\r\n" + 
				"			<td><select name='hours'><option>1</option><option>2</option><option>3</option><option>4</option></select></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Status: </b></i></td>\r\n" + 
				"			<td><select name='status'><option>In</option></select></td>\r\n" + 
				"		</tr>\r\n 		"+
				"<tr>" + 
				"	<td><i><b>Mobile No: </b></i></td>" + 
				"	<td><input type='text' name='mobileno' placeholder='Mobile No'></td>" + 
				"		</tr>"  
				+ "<tr>" );
		
		out.println(
				"			<td valign=top><i><b>Floor: </b></i></td>\r\n" + 
				"			<td><select id='floorno' name='floorno'></select><br><div id='fdiv'></div></td>\r\n" + 
				"		</tr>" +
				
			
				
				"	</table>\r\n" + 
				"	<center><input type='submit' id='btn' value='Enter'>\r\n" + 
				"	<input type='reset' ></center>\r\n" + 
				"</form>\r\n" + 
				"\r\n" + 
				"</html>");
	}

}
