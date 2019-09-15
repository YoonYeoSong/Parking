package com.parking.api.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.parking.api.model.service.ParkingApiService;
import com.parking.api.model.vo.Parking;

/**
 * Servlet implementation class SearchAddrServlet
 */
@WebServlet("/ajax/searchAddr.do")
public class SearchAddrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAddrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String addr = request.getParameter("addr");
		
		System.out.println(" search 서블릿 :" + addr);

		ParkingApiService parkingService = new ParkingApiService();
		//주소 네임을 가져와서 서비스로 넘겨주고 데이터를 담는다
		List<Parking> list = parkingService.selectParkingList(addr);
		System.out.println("searchAddr 리스트 사이즈 : " +list.size());
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(list, response.getWriter());


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
