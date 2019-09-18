package com.parking.bookmark.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.parking.bookmark.model.vo.Bookmark;


public class BookmarkDao {
  private Properties prop = new Properties();

  public BookmarkDao() {
    String path = BookmarkDao.class.getResource("/sql/bookmark/bookmark-query.properties").getPath();
    try {
      prop.load(new FileReader(path));
    } catch(IOException e) {
      e.printStackTrace();
    }
  }

  public Bookmark selectBookmark(Connection conn, String userCode, String parkingCode) {
    Bookmark b = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = prop.getProperty("selectBookmark");

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userCode);
      pstmt.setString(2, parkingCode);
      rs = pstmt.executeQuery();

      if(rs.next()) {
        b = new Bookmark();
        
        b.setBookmarkNo(rs.getInt("bookmark_no"));
        b.setBookmarkUserCode(rs.getString("bookmark_user_code"));
        b.setBookmarkParkingCode(rs.getString("bookmark_parking_code"));
      }
    } catch(SQLException e) {
      e.printStackTrace();
    } finally {
      close(rs);
      close(pstmt);
    }

    return b;
  }

}


