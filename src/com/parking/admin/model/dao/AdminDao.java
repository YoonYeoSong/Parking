package com.parking.admin.model.dao;


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

import com.parking.member.model.vo.Member;

public class AdminDao {
  private Properties prop = new Properties();

  public AdminDao() {
    String path = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
    try {
      prop.load(new FileReader(path));
    } catch(IOException e) {
      e.printStackTrace();
    }
  }
  
  public int selectCountMember(Connection conn) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = prop.getProperty("selectCountMember");
    int count =0;
    
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        count = rs.getInt("cnt"); // count = rs.getInt(1);
      }

    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return count;
  }
  
  public List<Member> selectListPage(Connection conn, int cPage, int numPerPage){
    PreparedStatement pstmt = null;
    ResultSet rs =  null;
    String sql = prop.getProperty("selectListPage");
    List<Member> list = new ArrayList<Member>();
    Member m = null;

    int start = (cPage-1)*numPerPage +1;
    int end = cPage*numPerPage;
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, end);

      rs = pstmt.executeQuery();
      while(rs.next()) {
        m = new Member();

        m.setUserCode(rs.getString("user_code"));
        m.setEmail(rs.getString("email"));
        m.setPw(rs.getString("pw"));
        m.setPhone(rs.getString("phone"));
        m.setUserName(rs.getString("user_name"));
        m.setUserAddr(rs.getString("user_addr"));

        Timestamp timestamp = rs.getTimestamp("created_date");
        java.util.Date date = new java.util.Date(timestamp.getTime());
        m.setCreatedDate(new java.sql.Date(date.getTime()));

        timestamp = rs.getTimestamp("login_date");
        if(timestamp != null) {
          date = new java.util.Date(timestamp.getTime());
          m.setLoginDate(new java.sql.Date(date.getTime()));
        }

        m.setSmsYn(rs.getInt("sms_yn"));
        m.setEmailYn(rs.getInt("email_yn"));
        m.setEmailVerified(rs.getInt("email_verified"));
        
        list.add(m);
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return list;
  }

  /* overload */
  public int selectCountMember(Connection conn, String searchType, String keyword) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
//    String sql = prop.getProperty("selectCountMemberPartial");
    String sql = "select count(*) as cnt from member where "+ searchType+ " like '%" + keyword + "%'";
    int count =0;
    
    try {
      pstmt = conn.prepareStatement(sql);
//      pstmt.setString(1, searchType);
//      pstmt.setString(2, "'%" + keyword + "%'");
      rs = pstmt.executeQuery();
      if(rs.next()) {
        count = rs.getInt("cnt"); // count = rs.getInt(1);
      }

    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return count;
  }

  /* overload */
  public List<Member> selectListPage(Connection conn, String searchType, String keyword, int cPage, int numPerPage){
    PreparedStatement pstmt = null;
    ResultSet rs =  null;

    int start = (cPage-1)*numPerPage +1;
    int end = cPage*numPerPage;

//    String sql = prop.getProperty("selectListPagePartial");
    String sql="select * from ("
        + "select rownum as rnum, a.* from("
        + "select * from member where "
        + searchType+" like '%"+keyword+"%' )a) "
        + "where rnum between "+start+" and "+end;

    List<Member> list = new ArrayList<Member>();
    Member m = null;
    
    try {
      pstmt = conn.prepareStatement(sql);
//      pstmt.setString(1, searchType);
//      pstmt.setString(2, "'%" + keyword + "%'");
//      pstmt.setInt(1, start);
//      pstmt.setInt(2, end);

      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        m = new Member();

        m.setUserCode(rs.getString("user_code"));
        m.setEmail(rs.getString("email"));
        m.setPw(rs.getString("pw"));
        m.setPhone(rs.getString("phone"));
        m.setUserName(rs.getString("user_name"));
        m.setUserAddr(rs.getString("user_addr"));

        Timestamp timestamp = rs.getTimestamp("created_date");
        java.util.Date date = new java.util.Date(timestamp.getTime());
        m.setCreatedDate(new java.sql.Date(date.getTime()));

        timestamp = rs.getTimestamp("login_date");
        if(timestamp != null) {
          date = new java.util.Date(timestamp.getTime());
          m.setLoginDate(new java.sql.Date(date.getTime()));
        }

        m.setSmsYn(rs.getInt("sms_yn"));
        m.setEmailYn(rs.getInt("email_yn"));
        m.setEmailVerified(rs.getInt("email_verified"));
        
        list.add(m);
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
