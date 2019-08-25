package com.parking.member.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Properties;

import com.parking.member.model.vo.Member;


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

  public Member selectEmailPw(Connection conn, String email, String pw) {
    Member m = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = prop.getProperty("selectEmailPw");

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
        m.setSmsYn(rs.getInt("sms_yn"));
        m.setEmailYn(rs.getInt("email_yn"));
        m.setEmailVerified(rs.getInt("email_verified"));
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return m;
  }

  public Member selectEmail(Connection conn, String email) {
    Member m = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = prop.getProperty("selectEmail");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, email);
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
        m.setSmsYn(rs.getInt("sms_yn"));
        m.setEmailYn(rs.getInt("email_yn"));
        m.setEmailVerified(rs.getInt("email_verified"));
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return m;
  }
  public boolean selectCheckEmail(Connection conn, String emailToChk) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean result = false;
    String sql = prop.getProperty("selectEmail");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, emailToChk);
      rs = pstmt.executeQuery();
      if(!rs.next())
        result = true;
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }
    return result;
  }
  
  public int insertMember(Connection conn, Member m) {
    PreparedStatement pstmt = null;
    int result = 0;
    String sql = prop.getProperty("insertMember");
    
    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, m.getUserCode()); //user_code (assigned by sequence)
      pstmt.setString(2, m.getEmail());
      pstmt.setString(3, m.getPw());
      pstmt.setString(4, m.getPhone());
      pstmt.setString(5, m.getUserName());
      pstmt.setString(6, m.getUserAddr());
      pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis())); //created_date: SYSTIMESTAMP
      System.out.println();
      pstmt.setTimestamp(8, null); //login_date: NULL
      pstmt.setInt(9, m.isSmsYn());
      pstmt.setInt(10, m.isEmailYn());
      pstmt.setInt(11, m.isEmailVerified());
      //insertMember=insert into member values(?,?,?,?,?,?,?,?,?,?,?)

      result = pstmt.executeUpdate();

    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(pstmt);
    }
    
    return result;
  }
  
  public Member selectUserCode(Connection conn, String userCode) {
    Member m = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = prop.getProperty("selectUserCode");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userCode);
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
        m.setSmsYn(rs.getInt("sms_yn"));
        m.setEmailYn(rs.getInt("email_yn"));
        m.setEmailVerified(rs.getInt("email_verified"));
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



