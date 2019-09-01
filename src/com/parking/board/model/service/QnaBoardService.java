package com.parking.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.parking.board.model.dao.QnaBoardDao;
import com.parking.board.model.vo.QnaBoard;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

public class QnaBoardService {
  private QnaBoardDao dao = new QnaBoardDao();

  public List<QnaBoard> selectQnaBoardList(){
    Connection conn = getConnection();
    
    List<QnaBoard> list = dao.selectQnaBoardList(conn);
    
    close(conn);
    
    return list;
  }
}
