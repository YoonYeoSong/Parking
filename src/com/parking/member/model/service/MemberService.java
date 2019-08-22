package com.parking.member.model.service;

import java.sql.Connection;

import com.parking.member.model.dao.MemberDao;
import com.parking.member.model.vo.Member;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

public class MemberService {
  MemberDao dao = new MemberDao();
  
  public Member selectEmail(String email, String pw) {
    Connection conn = getConnection();
    Member m = dao.selectEmail(conn, email,pw);
    close(conn);
    return m;
  }
}
