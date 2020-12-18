package com.company.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.company.model.*;
import com.company.utils.*;

@WebServlet(urlPatterns = { "/searchCurriculum" })
public class CurriculumSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public CurriculumSearchServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn;
		try {
			int page = 1;
			int recordsPerPage = 50;
			if (request.getParameter("page") != null)
				page = Integer.parseInt(request.getParameter("page"));
			HttpSession session = request.getSession();
			if(MyUtils.getLoginedUser(session) == null) {
				conn = MySQLUtils.getMySQLConnection(new UserAccount(0, "", "", "", 0));
			}
			else {
				conn = MySQLUtils.getMySQLConnection(MyUtils.getLoginedUser(session));
			}
			String search = (String) request.getParameter("search");
			String errorString = null;
	        List<Curriculum> list = null;
	        List<Curriculum> list1 = null;
	        try {
	            list1 = MyUtils.searchCurriculums(conn, search);
	            list = MyUtils.searchCurriculumsPage(conn, search, (page-1)*recordsPerPage, recordsPerPage);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            //errorString = e.getMessage();
	                errorString = "Something went wrong";
	        }
	        for(Curriculum c : list) {
	            c.setSpecialty(MyUtils.findSpecialtyByCurriculum(conn, c.getId()));}
	        int noOfRecords = list1.size();
	        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	        request.setAttribute("errorString", errorString);
	        request.setAttribute("CurriculumList", list);
	        request.setAttribute("noOfPages", noOfPages);
	        request.setAttribute("currentPage", page);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/CurriculumListView.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
}
