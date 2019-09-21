package com.parking.history.model.dao;


import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.parking.api.model.vo.Parking;
import com.parking.history.model.vo.UserHistory;

public class UserHistoryDao {
  private Properties prop = new Properties();

  public UserHistoryDao() {
    String path = UserHistoryDao.class.getResource("/sql/history/userhistory-query.properties").getPath();
    try {
      prop.load(new FileReader(path));
    } catch(IOException e) {
      e.printStackTrace();
    }
  }
  
  
  public List<UserHistory> selectUserHistoryList(Connection conn, String userCode){
    PreparedStatement pstmt = null;
    ResultSet rs =  null;
    String sql = prop.getProperty("selectUserHistoryList");
    List<UserHistory> list = new ArrayList<UserHistory>();
    UserHistory h = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userCode);

      rs = pstmt.executeQuery();
      while(rs.next()) {
        h = new UserHistory();

        h.setUserHistoryNo(rs.getInt("userhistory_no"));
        h.setUserHistoryUserCode(rs.getString("userhistory_user_code"));
        h.setUserHistoryParkingCode(rs.getString("userhistory_parking_code"));

        Timestamp timestamp = rs.getTimestamp("userhistory_parking_date");
        java.util.Date date = new java.util.Date(timestamp.getTime());
        h.setUserHistoryParkingDate(new java.sql.Date(date.getTime()));
        
        list.add(h);
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return list;
  }

  public List<Parking> selectUserHistoryParkingList(Connection conn, String userCode){
    PreparedStatement pstmt = null;
    ResultSet rs =  null;
    String sql = prop.getProperty("selectUserHistoryParkingList");
    List<Parking> list = new ArrayList<Parking>();
    Parking p = null;

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userCode);

      rs = pstmt.executeQuery();
      while(rs.next()) {
        p = new Parking();

//        h.setUserHistoryNo(rs.getInt("userhistory_no"));
//        h.setUserHistoryUserCode(rs.getString("userhistory_user_code"));
//        h.setUserHistoryParkingCode(rs.getString("userhistory_parking_code"));

//        Timestamp timestamp = rs.getTimestamp("userhistory_parking_date");
//        java.util.Date date = new java.util.Date(timestamp.getTime());
//        h.setUserHistoryParkingDate(new java.sql.Date(date.getTime()));
//        
        list.add(p);
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return list;
  }
}