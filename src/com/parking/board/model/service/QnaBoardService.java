package com.parking.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.parking.board.model.dao.QnaBoardDao;
import com.parking.board.model.vo.QnaBoard;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

public class QnaBoardService {
  private QnaBoardDao dao = new QnaBoardDao();

  public List<QnaBoard> selectQnaBoardList(int cPage, int numPerPage){
    Connection conn = getConnection();
    
    List<QnaBoard> list = dao.selectQnaBoardList(conn, cPage, numPerPage);
    
    close(conn);
    
    return list;
  }

  public int selectCountQnaBoard() {
    Connection conn = getConnection();
    
    int count = dao.selectCountQnaBoard(conn);
    
    close(conn);

    return count;
  }
  
  
  public List<QnaBoard> selectPopularBoard()
  {
	  Connection conn = getConnection();
	  List<QnaBoard> list = dao.selectPopularBoard(conn);
	  
	  close(conn);
	  return list;	  
  }
  
}
