package com.parking.member.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.parking.member.model.dao.MemberDao;
import com.parking.member.model.vo.Member;

public class MemberService {
  MemberDao dao = new MemberDao();
  

  public Member selectEmail(String email) {
    Connection conn = getConnection();
    Member m = dao.selectEmail(conn, email);

    close(conn);

    return m;
  }
  
  public boolean selectCheckEmail(String emailToChk) {
    Connection conn = getConnection();
    Boolean result = dao.selectCheckEmail(conn, emailToChk);
    
    close(conn);

    return result;
  }
  
  public int insertMember(Member m) {
    Connection conn = getConnection();

    int result = dao.insertMember(conn, m);
    
    if (result > 0)
      commit(conn);
    else
      rollback(conn);
    
    close(conn);
    
    return result;
  }
  
  public Member selectUserCode(String userCode) {
    Connection conn = getConnection();
    Member m = dao.selectUserCode(conn, userCode);

    close(conn);

    return m;
  }
}
