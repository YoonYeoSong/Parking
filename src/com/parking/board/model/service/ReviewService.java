package com.parking.board.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.parking.board.model.dao.ReviewDao;
import com.parking.board.model.vo.Review;

public class ReviewService {
  private ReviewDao dao = new ReviewDao();

  public List<Review> selectReviewList(int cPage, int numPerPage){
    Connection conn = getConnection();
    
    List<Review> list = dao.selectReviewList(conn, cPage, numPerPage);
    
    close(conn);
    
    return list;
  }

  public int selectCountReview() {
    Connection conn = getConnection();
    
    int count = dao.selectCountReview(conn);
    
    close(conn);

    return count;
  }
}
