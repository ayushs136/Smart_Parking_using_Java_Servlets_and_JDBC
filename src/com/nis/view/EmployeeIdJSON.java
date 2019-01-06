package com.nis.view;

import com.nis.controller.EmployeesController;

import com.nis.dao.DbHelper;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/EmployeeIdJSON")
public class EmployeeIdJSON extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out  = response.getWriter();

        try {
            ResultSet rs = EmployeesController.allEmployeeId();
                    ArrayList<JSONObject> F = DbHelper.JsonEngine(rs);

            out.println(F);

        }catch(Exception e) {
            out.println(e);
        }
    }
}
