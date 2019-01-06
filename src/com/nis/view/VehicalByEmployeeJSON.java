package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nis.controller.VehicalController;
import com.nis.dao.DbHelper;

/**
 * Servlet implementation class VehicalByEmployeeJSON
 */
@WebServlet("/VehicalByEmployeeJSON")
public class VehicalByEmployeeJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicalByEmployeeJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		ResultSet rs = VehicalController.searchByEmployeeId(Integer.parseInt(request.getParameter("eid")), request.getParameter("d1"), request.getParameter("d2"));
		ArrayList list = DbHelper.JsonEngine(rs);
		out.println(list);
		
	}

}
