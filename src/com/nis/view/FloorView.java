package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FloorView
 */
@WebServlet("/FloorView")
public class FloorView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FloorView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		
		out.println("<html><body bgcolor='#47535E' text='#EAF0F1'></body><hr><h1>Floor Input</h1><hr>");
		out.println("\r\n" + 
				"<form action='FloorSubmit' method='get'>\r\n" + 
				"	<table >\r\n" +
				"		<tr><td><i><b>Floor number:</b></i></td>\r\n" + 
				"			<td><input type='number' name='floorno'></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr><td><i><b>Floor Name:</b></i></td>\r\n" + 
				"			<td><input type='text' name='floorname'></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr><td><i><b>No. of Space:</b></i></td>\r\n" + 
				"			<td><input type='number' name='noofspace'></td>\r\n" + 
				"		</tr>\r\n" + 
				"	</table><input type='submit'>" +
				"</form>\r\n" +
				"");
		
	}

}
