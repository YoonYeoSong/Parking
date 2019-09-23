package com.parking.board.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.parking.board.model.vo.QnaBoard;

public class QnaBoardDao {
  private Properties prop = new Properties();

  public QnaBoardDao() {
    try {
      String path = QnaBoardDao.class.getResource("/sql/board/qnaboard-query.properties").getPath();
      prop.load(new FileReader(path));
    } catch(IOException e) {
      e.printStackTrace();
    }
  }
  
  public List<QnaBoard> selectQnaBoardList(Connection conn, int cPage, int numPerPage){
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    List<QnaBoard> list = new ArrayList<QnaBoard>();
    QnaBoard b = null;
    
    int start = (cPage-1)*numPerPage + 1;
    int end = cPage*numPerPage;

    String sql = prop.getProperty("selectQnaBoardList");
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, end);

      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        b = new QnaBoard();

        b.setQnaNo(rs.getInt("qna_no"));
        b.setQnaTitle(rs.getString("qna_title"));
        b.setUserCode(rs.getString("qna_user_code"));
        b.setQnaContent(rs.getString("qna_content"));
        b.setQnaOriginalFile(rs.getString("qna_original_filename"));
        b.setQnaRenamedFile(rs.getString("qna_renamed_filename"));
        b.setQnaCreatedDate(rs.getDate("qna_created_date"));
        b.setQnaReadcount(rs.getInt("qna_readcount"));
        
        list.add(b);
      }
      
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }
    
    return list;
  }

  public int selectCountQnaBoard(Connection conn) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int count = 0;
    String sql = prop.getProperty("selectCountQnaBoard");
    
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      if(rs.next())
        count = rs.getInt("cnt");

    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return count;
  }
  
  public List<QnaBoard> selectPopularBoard(Connection conn)
  {
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  List<QnaBoard> list = new ArrayList<QnaBoard>();
	  QnaBoard qb = null;
	  String sql = prop.getProperty("selectPopularBoard");
	  try
	  {
		  pstmt = conn.prepareStatement(sql);
		  rs = pstmt.executeQuery();
		  while(rs.next())
		  {
			  qb = new QnaBoard();
			  qb.setQnaNo(rs.getInt("QNA_NO"));
			  qb.setQnaTitle(rs.getString("QNA_TITLE"));
			  qb.setUserCode(rs.getString("QNA_USER_CODE"));
			  qb.setQnaCreatedDate(rs.getDate("QNA_CREATED_DATE"));
			  qb.setQnaReadcount(rs.getInt("QNA_READCOUNT"));		  
			  list.add(qb);
		  }
	  }catch(SQLException e)
	  {
		  e.printStackTrace();
	  }finally
	  {
		  close(rs);
		  close(pstmt);
	  }
	  
	  return list;
  }
  
}
