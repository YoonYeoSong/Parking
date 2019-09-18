package com.parking.bookmark.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.parking.bookmark.model.dao.BookmarkDao;
import com.parking.bookmark.model.vo.Bookmark;

public class BookmarkService {
  BookmarkDao dao = new BookmarkDao();
  
  public Bookmark selectBookmark(String userCode, String parkingCode) {
    Connection conn = getConnection();

    Bookmark b = dao.selectBookmark(conn, userCode, parkingCode);

    close(conn);

    return b;
  }
  
}
