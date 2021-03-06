package com.company.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.company.model.*;
import com.company.utils.*;

@WebServlet(urlPatterns = { "/createFaculty" })
public class FacultyCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public FacultyCreateServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/FacultyCreateView.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn;
		try {
			HttpSession session = request.getSession();
			conn = MySQLUtils.getMySQLConnection(MyUtils.getLoginedUser(session));
			String idStr = (String) request.getParameter("id");
			String code = (String) request.getParameter("code");
			String name = (String) request.getParameter("name");
			int id = 0;
	        try {
	        	id = Integer.parseInt(idStr);
	        } catch (Exception e) {
	        }
	        Faculty Faculty = new Faculty(id, code, name);
	 
	        String errorString = null;
	 
	        if (errorString == null && (MyUtils.getLoginedUser(session).getUser_type() == 1 || MyUtils.getLoginedUser(session).getUser_type() == 2)) {
	            try {
	                MyUtils.insertFaculty(conn, Faculty);
	            } catch (SQLException e) {
	                e.printStackTrace();
	                //errorString = e.getMessage();
	                errorString = MyUtils.ERROR_MESSAGE;
	            }
	        }
	 
	        request.setAttribute("errorString", errorString);
	        request.setAttribute("Faculty", Faculty);
	        if (errorString != null) {
	            RequestDispatcher dispatcher = request.getServletContext()
	                    .getRequestDispatcher("/WEB-INF/views/FacultyCreateView.jsp");
	            dispatcher.forward(request, response);
	        }
	        else {
	            response.sendRedirect(request.getContextPath() + "/FacultyList");
	        }
	        
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

    }
 
}