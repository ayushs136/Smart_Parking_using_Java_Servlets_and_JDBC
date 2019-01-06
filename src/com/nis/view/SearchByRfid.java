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

/**
 * Servlet implementation class SearchByRfid
 */
@WebServlet("/SearchByRfid")
public class SearchByRfid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByRfid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession ses = request.getSession();
		out.println("<html>");
		try{
			String nv = "Employee Id: "+ses.getValue("EMPLOYEEID").toString()+"<br>Name: "+ses.getValue("EMPLOYEENAME").toString()+"<br><img src='/Parking/images/"+ses.getValue("PICTURE").toString()+"' width=30 height=30 title='"+ses.getValue("EMPLOYEENAME").toString()+"'>";
		out.println("Employee: "+ses.getValue("EMPLOYEENAME")+" Online");
		}catch(Exception e) {
			response.sendRedirect("EmployeeLogin");
		}
		
		String rfidno  = VehicalController.readRFID();
		if(rfidno.length()==12) {
			out.println("<meta http-equiv='refresh' content='-5'>");
		}
		else {
			out.println("<meta http-equiv='refresh' content='5'>");
		}
		out.println("<html><body bgcolor='#000' text='#10A881'></body>");
		out.println("<script src='/asset/jquery-3.3.1.min.js'></script>");
		out.println("<script src='/asset/rfidsearch.js'></script>");
		out.println("<script src='/asset/AllVehical.js'></script>");
		out.println("<table><tr><h2>Search by RFID:</h2></tr>");
		out.println("<tr><td valign='top'><b><i>Enter RFID:  </i></b></td></tr><tr><td><input type='text' id='rfid' name='rfid' size=30><input type='button'  name='btn' id='btn'  value=Search><input type='button'  name='btn1' id='btn1'  value='All Vehicals'></td></tr>");
		out.println("<tr><td valign='top'><div id='rfiddiv' name='rfiddiv'><br><hr></div></td></tr>");

		out.println("</table>");
		out.println("</html>");
		out.flush();
	}
		
	}


