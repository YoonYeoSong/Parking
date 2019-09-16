package com.parking.api.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parking.api.model.service.ParkingApiService;
import com.parking.api.model.vo.Parking;

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
		//1 주소를 토대로한 글자를 가져오고
		String search = request.getParameter("search");
		System.out.println("서블릿 :" + search);

		//ParkingApiService parkingService = new ParkingApiService();
		//주소 네임을 가져와서 서비스로 넘겨주고 데이터를 담는다
		//List<Parking> list = parkingService.selectParkingList(search);
		//System.out.println("리스트 사이즈 : " +list.size());
		
		

//		if(list.get(0) != null)
//		{
//			request.setAttribute("list", list);	
//			request.getRequestDispatcher("/views/map/mapListView.jsp").forward(request, response);			
//		}else
//		{
//			request.setAttribute("msg", "Search Failed!");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
		
		if(search != null)
		{
			request.setAttribute("search", search);	
			request.getRequestDispatcher("/views/map/mapListView.jsp").forward(request, response);			
		}else
		{
			request.setAttribute("msg", "Search Failed!");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
