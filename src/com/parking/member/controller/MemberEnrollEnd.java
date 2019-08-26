package com.parking.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parking.member.model.service.MemberService;
import com.parking.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollEnd
 */
@WebServlet(name="MemberEnroll", urlPatterns="/memberEnrollEnd")
public class MemberEnrollEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String userCode = this.generateUserCode();
	  String email = request.getParameter("email");
	  String pwEnroll = request.getParameter("pwEnroll");
	  String phone = request.getParameter("phone");
	  String userName = request.getParameter("userName");
	  String userAddr = request.getParameter("roadAddress") + request.getParameter("postcode");

    int smsYn = request.getParameter("smsYn") != null? 1:0;
    int emailYn = request.getParameter("emailYn") != null? 1:0;
	  int emailVerified = 0; //DEFAULT
	  Date createdDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
	  Date loginDate = null;

	  Member m = new Member(userCode, email, pwEnroll, phone, userName, userAddr,
                          createdDate, loginDate, smsYn, emailYn, emailVerified); 

	  int result = new MemberService().insertMember(m);

	  String msg = result > 0? "Hello "+userName + ". Thanks for joining us!" : "Sign up Failed!";
	  String loc = "/";
	  
	  request.setAttribute("msg", msg);
	  request.setAttribute("loc", loc);

	  request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

  /**
   * generateUserCode() generates unique and random 6-digit user code
   * @return String randDigit is a generated random 6 digit in String type
   */
	protected String generateUserCode() {
	  int rand = 0;
	  String randDigit ="";
	  Member m = null;

	  do {
      // assign 'user_code' unique random digit string : 000001 ~ 999999
	    rand = ThreadLocalRandom.current().nextInt(1, 999999 + 1);
	    randDigit = String.format("%06d",  rand);
	    m = new MemberService().selectUserCode(randDigit);
	  } while(m != null);

	  return randDigit;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
