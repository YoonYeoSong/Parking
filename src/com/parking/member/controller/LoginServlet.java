package com.parking.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

	  MemberService service = new MemberService();
	  Member m = service.selectEmail(email,pw);

	  request.setAttribute("loginMember", m);

	  //for debug
	  System.out.println(email);
	  System.out.println(pw);
	  System.out.println(m);

	  String view = "";

	  if(m!= null) { //Logged in
	    /* request.getSession(boolean); boolean parameter
	     *   true(default) : load or create session object
	     *   false : load session (allow null)
	     */
	    HttpSession session = request.getSession();

	    session.setAttribute("loginMember", m);
	    

	    /* Cookie
	     * remember login email for a week if "checked"
	     */
	    String saveEmail = request.getParameter("saveEmail"); //null or "on"(checked)

	    int duration = (saveEmail != null? 7*12*60*60 : 0); //seconds

	    Cookie c = new Cookie("saveEmail", email);
      c.setMaxAge(duration);
      response.addCookie(c);

	    view = "/"; //return to index.jsp

	    response.sendRedirect(request.getContextPath() + view);
	  }
	  else { //Not Logged in
	    String msg = "Email or password does not match!";
	    String loc = "/"; //return to index.jsp after showing message in msg.jsp

	    request.setAttribute("msg", msg);
	    request.setAttribute("loc", loc);

	    view = "/views/common/msg.jsp"; //dispatched to msg.jsp

	    RequestDispatcher rd = request.getRequestDispatcher(view);
	    rd.forward(request, response);
	  }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
