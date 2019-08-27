package com.parking.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parking.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/memberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	  if(loginMember == null || !loginMember.getEmail().equals("admin@com")) {
	    request.setAttribute("msg", "Access denied. Not Enough user privilege.");
	    request.setAttribute("loc", "/");
	    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	    return;
	  }
	  
	  int cPage = 0;
	  try {
	    cPage = Integer.parseInt(request.getParameter("cPage"));
	  } catch(NumberFormatException e) {
	    cPage = 1;
	  }

	  int numPerPage = 5;
//	  int totalMember = new AdminService().selectCountMember();
//	  List<Member> list = new AdminService().selectListPage(cPage, numPerPage);


		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
