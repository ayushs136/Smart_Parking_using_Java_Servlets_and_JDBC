package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nis.controller.EmployeesController;
import com.nis.controller.VehicalController;
import com.nis.model.Floors;
import com.nis.model.Vehical;

/**
 * Servlet implementation class OutVehical
 */
@WebServlet("/FinalEditDeleteVehical")
public class FinalEditDeleteVehical extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalEditDeleteVehical() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
	
		out.println("<body bgcolor='#1287A5' text='green'></body>");
		int vid = Integer.parseInt(request.getParameter("vid"));
		String  btn = request.getParameter("btn");
		
		if(btn.equals("Delete")) {
			boolean st = VehicalController.deleteVehical(vid);
			if(st) {
			response.sendRedirect("DisplayAllVehical");
			}	
	
	}else if(btn.equalsIgnoreCase("Edit")) {
		Vehical V = new Vehical();
		Floors F = new Floors();
		V.setEmployeeid(Integer.parseInt(request.getParameter("eid")));
		V.setVehicalid(Integer.parseInt(request.getParameter("vid")));
		V.setRfid(request.getParameter("rfid"));
		V.setRegistration(request.getParameter("regno"));
		V.setCurrentdate(request.getParameter("cdate"));
		V.setCurrenttime(request.getParameter("ctime"));
		V.setAmount(Integer.parseInt(request.getParameter("amt")));
		V.setHours(Integer.parseInt(request.getParameter("hours")));
		V.setStatus(request.getParameter("status"));


		
		
//		if(request.getParameter("estate").equals("-select-")&&request.getParameter("ecity").equals("-select-")) {
//			
//				E.setState(request.getParameter("stateid"));
//				E.setCity(request.getParameter("cityid"));
//		}else {
//			E.setState(request.getParameter("estate"));
//			E.setCity(request.getParameter("ecity"));
//			}
//		
		if(request.getParameter("floorno").equalsIgnoreCase("-select-")){
			V.setFloorno(request.getParameter("floornotemp"));
			F.setFloorno(Integer.parseInt(request.getParameter("floornotemp")));
		}else {
			V.setFloorno(request.getParameter("floorno"));
			F.setFloorno(Integer.parseInt(request.getParameter("floorno")));
		}
		
		
		
		
//		V.setFloorno(request.getParameter("floorno"));
//		F.setFloorno(Integer.parseInt(request.getParameter("floorno")));
		V.setMobileno(request.getParameter("mobileno"));
		
		
		boolean st = VehicalController.editVehicalRecord(V);
		response.sendRedirect("DisplayAllVehical");
	}
	}


}
