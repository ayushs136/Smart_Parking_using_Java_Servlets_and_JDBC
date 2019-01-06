package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nis.controller.VehicalController;
import com.nis.model.Floors;
import com.nis.model.Vehical;

/**
 * Servlet implementation class VehicalSubmit
 */
@WebServlet("/VehicalSubmit")
public class VehicalSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicalSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		Vehical V = new Vehical();
		Floors F = new Floors();
		V.setEmployeeid(Integer.parseInt(request.getParameter("eid")));
//		V.setVehicalid(Integer.parseInt(request.getParameter("vid")));
		V.setRfid(request.getParameter("rfid"));
		V.setRegistration(request.getParameter("regno"));
		V.setCurrentdate(request.getParameter("cdate"));
		V.setCurrenttime(request.getParameter("ctime"));
		V.setAmount(Integer.parseInt(request.getParameter("amt")));
		V.setHours(Integer.parseInt(request.getParameter("hours")));
		V.setStatus(request.getParameter("status"));
		V.setFloorno(request.getParameter("floorno"));
		F.setFloorno(Integer.parseInt(request.getParameter("floorno")));
		V.setMobileno(request.getParameter("mobileno"));
		
		
		boolean status = VehicalController.addNewVehical(V);
		if(status) {
			boolean st = VehicalController.removeRFID();
			out.println("<body bgcolor='#000' text='#10A881'></body><h1 align='center'>Vehical In...</h1>");
		}else {
			out.println("<h1>Fail to submit record</h1>");
		}
	}

}
