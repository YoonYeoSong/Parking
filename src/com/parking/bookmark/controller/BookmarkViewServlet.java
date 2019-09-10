package com.parking.bookmark.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parking.member.model.service.MemberService;
import com.parking.member.model.vo.Member;

/**
 * Servlet implementation class BookmarkViewServlet
 */
@WebServlet("/bookmark/bookmarkViewLoad")
public class BookmarkViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String userCode = request.getParameter("userCode");
	  Member m = new MemberService().selectUserCode(userCode);
	  request.setAttribute("loginMember", m);
	  
	  request.getRequestDispatcher("/views/bookmark/bookmarkView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}