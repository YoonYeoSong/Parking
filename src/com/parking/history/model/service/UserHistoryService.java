package com.parking.history.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.parking.api.model.vo.Parking;
import com.parking.history.model.dao.UserHistoryDao;
import com.parking.history.model.vo.UserHistory;

public class UserHistoryService {
  private UserHistoryDao dao = new UserHistoryDao();

  
  public List<UserHistory> selectUserHistoryList(String userCode){
    Connection conn = getConnection();
    
    List<UserHistory> list = dao.selectUserHistoryList(conn, userCode);

    close(conn);
    
    return list;
  }

  public List<Parking> selectUserHistoryParkingList(String userCode){
    Connection conn = getConnection();
    
    List<Parking> list = dao.selectUserHistoryParkingList(conn, userCode);

    close(conn);
    
    return list;
  }
}
