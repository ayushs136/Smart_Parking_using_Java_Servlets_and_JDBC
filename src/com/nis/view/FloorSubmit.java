package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nis.controller.FloorController;
import com.nis.model.Floors;

/**
 * Servlet implementation class FloorSubmit
 */
@WebServlet("/FloorSubmit")
public class FloorSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FloorSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			PrintWriter out = response.getWriter();
			
			Floors F = new Floors();
			F.setFloorno(Integer.parseInt(request.getParameter("floorno")));
			F.setFloorname(request.getParameter("floorname"));
			F.setNoofspace(Integer.parseInt(request.getParameter("noofspace")));
			boolean st = FloorController.addFloor(F);
			out.println("<html><body bgcolor='#47535E' text='#EAF0F1'></body>");
			if(st) {
				out.println("<h1>Record Submitted</h1>");
			}else {
				out.println("<h1>Fail to Submit</h1>");	
			}
			out.println("</html>");
			out.flush();
	
	}

}
