package com.parking.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.parking.model.vo.Member;


public class MemberDao {
  private Properties prop = new Properties();

  public MemberDao() {
    String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
    try {
      prop.load(new FileReader(path));
    } catch(IOException e) {
      e.printStackTrace();
    }
  }

  public Member selectEmail(Connection conn, String email, String pw) {
    Member m = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = prop.getProperty("selectEmail");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, email);
      pstmt.setString(2, pw);
      rs = pstmt.executeQuery();

      if(rs.next()) {
        m = new Member();

        m.setUserCode(rs.getString("user_code"));
        m.setEmail(rs.getString("email"));
        m.setPw(rs.getString("pw"));
        m.setPhone(rs.getString("phone"));
        m.setUserName(rs.getString("user_name"));
        m.setUserAddr(rs.getString("user_addr"));
        m.setCreatedDate(rs.getDate("created_date"));
        m.setLoginDate(rs.getDate("login_date"));
        m.setSmsYn(rs.getString("sms_yn").toUpperCase().charAt(0)=='Y'? true:false);
        m.setEmailYn(rs.getString("email_yn").toUpperCase().charAt(0)=='Y'? true:false);
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return m;
  }
}



