package com.parking.api.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.parking.api.model.service.ParkingApiService;
import com.parking.api.model.vo.Parking;
import com.parking.api.model.vo.ParkingSlot;

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
		
//		System.out.println(" search 서블릿 :" + addr);

		ParkingApiService parkingService = new ParkingApiService();
		//주소 네임을 가져와서 서비스로 넘겨주고 데이터를 담는다
		List<Parking> list = parkingService.selectParkingList(addr);
		
		
		//사업자등록 리스트
//		int resultCeo = parkingService.insertparkingOwner(list);
//		
//		if(resultCeo > 0)
//			System.out.println("사업자등록완료");
//		
//		System.out.println("searchAddr 리스트 사이즈 : " +list.size());
		
		List<ParkingSlot> slotList = parkingService.selectParkingSlotList();
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
		
		int sysMonth = Integer.parseInt(sdf.format(cal.getTime()).substring(5, 7));
		int sysDay = Integer.parseInt(sdf.format(cal.getTime()).substring(8, 10));
		int sysTime = Integer.parseInt(sdf.format(cal.getTime()).substring(11, 13));
		int sysMin = Integer.parseInt(sdf.format(cal.getTime()).substring(14, 16));
		
		System.out.println("시간 : " + sysTime);
		System.out.println("분 : " + sysMin);
		
		System.out.println(slotList.size());
		
		if(!slotList.isEmpty())
		{
			System.out.println("비어 있지않음 slot들어옴");
			for(int i = 0; i < slotList.size(); i++)
			{
				System.out.println("시작 시간"+Integer.parseInt(slotList.get(i).getSlotBeginTime().substring(11,13)));
				System.out.println("끝시간 " + Integer.parseInt(slotList.get(i).getSlotEndTime().substring(11,13)));
				System.out.println("시작 분" +Integer.parseInt(slotList.get(i).getSlotBeginTime().substring(14,16)));
				System.out.println("끝 분" +Integer.parseInt(slotList.get(i).getSlotEndTime().substring(14,16)));
				
				
				
				
				if( (sysMonth == Integer.parseInt(slotList.get(i).getSlotBeginTime().substring(5,7))  && sysDay == Integer.parseInt(slotList.get(i).getSlotBeginTime().substring(8,10))) &&
						( sysTime <= Integer.parseInt(slotList.get(i).getSlotBeginTime().substring(11,13)) && 
						sysTime <= Integer.parseInt(slotList.get(i).getSlotEndTime().substring(11,13))) )
				{
					if(sysTime <= Integer.parseInt(slotList.get(i).getSlotBeginTime().substring(14,16)) && 
							sysTime <= Integer.parseInt(slotList.get(i).getSlotEndTime().substring(14,16)))
					{
						System.out.println(slotList.get(i).getOwnerParkingCode()+ "리스트 삭제 안됨");
						continue;
					}else
					{
						System.out.println(slotList.get(i).getOwnerParkingCode()+ "리스트 삭제");
						slotList.remove(i);
					}
				}
				else
				{
					slotList.remove(i);
				}
			}
			
			
			for(int j = 0; j < slotList.size(); j++)
			{
				System.out.println("slot size" + slotList.size());
				for(int p = 0; p < list.size(); p++)
				{
					if(list.get(p).getParkingCode().equals(slotList.get(j).getOwnerParkingCode()))
					{
						System.out.println("현재 대수 : " + list.get(p).getCurParking());
						list.get(p).setCurParking(list.get(p).getCurParking()+1);
						
						System.out.println(list.get(p).getParkingName() + "현재 차대수 증가");
						System.out.println("바뀐 대수 : " +list.get(p).getCurParking());
					}
				}
			}
			
			for(int c = 0; c < list.size(); c++)
			{
				if(list.get(c).getCapacity() <= list.get(c).getCurParking())
				{
					list.remove(c);
					
				}
			}	
		}
		
		
		//데이터 저장된 상태니 건들지 말것
//		int result = 0;
//		
//		result = parkingService.insertParkingList(list);
//		
//		if(result > 0)
//			System.out.println("값 insert OK");
		
		
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
