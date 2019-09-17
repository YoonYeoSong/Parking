package com.parking.api.model.service;

import java.util.ArrayList;
import java.util.List;


import com.parking.api.dao.ParkingApiDao;
import com.parking.api.model.vo.Parking;

import common.api.ParseJsonSeoulParking;

public class ParkingApiService {
	
	ParkingApiDao dao = new ParkingApiDao();
	
	
	public List<Parking> selectParkingList(String addrName)
	{
		ParseJsonSeoulParking seoulParking = new ParseJsonSeoulParking();
		List<Parking> list = new ArrayList<Parking>();
		// 할당될 페이지 수 cnt 1이고 뽑는 데이터가 1000개면 포문 한번돌고
		// 몇개를 뽑든간에 그 데이터에 관해 카운트로 for문을 돌린다
		// 추출해야 데이터가 많은량이면 카운트 수를 높인다.
		int cnt = 2;
		list = seoulParking.parseJsonSeoulParkingApi(addrName, cnt);
		
		return list;
	}
	

}
