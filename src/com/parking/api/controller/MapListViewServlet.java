package com.parking.api.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MapListViewServlet
 */
@WebServlet("/map/mapListView")
public class MapListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MapListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		
		//1 주소를 토대로한 글자를 가져오고
		//2 그 주소에 대한 서비스를 불러서 DAO를 부른다.
		//3 부른 디비 데이터를 가지고 JSON클래스로 접속해서 API에 대한 호출값을
		// 몇번의 인덱스를 가지고 있는지 체크하고 그 만큼의 데이터를 출력한다.
		// 여러번 호출하더라도 DB에서 주소값만 가져와서 처리하는것이 제일 깔끔하고 출력하는데 있어서도 제일 처리가 깔끔하기 때문에 이렇게 진행
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
