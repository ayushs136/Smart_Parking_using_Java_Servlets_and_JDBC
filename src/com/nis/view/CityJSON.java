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

import org.json.JSONObject;

import com.nis.controller.StateCityController;
import com.nis.dao.DbHelper;

/**
 * Servlet implementation class CityJSON
 */
@WebServlet("/CityJSON")
public class CityJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		try {
			ResultSet rs = StateCityController.fetchAllCities(Integer.parseInt(request.getParameter("stateid")));
			
			ArrayList<JSONObject> obj = DbHelper.JsonEngine(rs);
			out.println(obj);
			
		}catch(Exception e) {
		out.println(e);
		}
	}

}
