package com.parking.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parking.member.model.service.MemberService;
import com.parking.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String email = request.getParameter("email");
	  String pw = request.getParameter("pw");
	  System.out.println(email);
	  System.out.println(pw);
	  
	  MemberService service = new MemberService();
	  Member m = service.selectEmail(email,pw);
	  
    System.out.println(m);
	  String view = "";

	  if(m!= null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("loginMember", m);
	    //request.getSession(); pass parameter true(default) or false
	    //true : load or create session object
	    //false : load session (allow null)

	    view = "/"; //return to index.jsp
	  }
	  else {
	    String msg = "Email or password does not match!";
	    request.setAttribute("msg", msg);
	    view = "/views/common/msg.jsp";

	    String loc = "/"; //return to index.jsp
	    request.setAttribute("loc", loc);
	  }
	  request.setAttribute("loginMember", m);

    RequestDispatcher rd = request.getRequestDispatcher(view);
    rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
