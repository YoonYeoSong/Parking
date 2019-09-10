package com.parking.bookmark.model.vo;

public class Bookmark {
  private int bookmarkNo;
  private String bookmarkUserCode;
  private String bookMarkParkingCode;
  
  public Bookmark() {
    // TODO Auto-generated constructor stub
  }

  public Bookmark(int bookmarkNo, String bookmarkUserCode, String bookMarkParkingCode) {
    super();
    this.bookmarkNo = bookmarkNo;
    this.bookmarkUserCode = bookmarkUserCode;
    this.bookMarkParkingCode = bookMarkParkingCode;
  }
  
  @Override
  public String toString() {
    return "Bookmark [bookmarkNo=" + bookmarkNo + ", bookmarkUserCode=" + bookmarkUserCode + ", bookMarkParkingCode="
        + bookMarkParkingCode + "]";
  }

  public int getBookmarkNo() { return bookmarkNo; }
  public void setBookmarkNo(int bookmarkNo) { this.bookmarkNo = bookmarkNo; }
  public String getBookmarkUserCode() { return bookmarkUserCode; }
  public void setBookmarkUserCode(String bookmarkUserCode) { this.bookmarkUserCode = bookmarkUserCode; }
  public String getBookMarkParkingCode() { return bookMarkParkingCode; }
  public void setBookMarkParkingCode(String bookMarkParkingCode) { this.bookMarkParkingCode = bookMarkParkingCode; }
}
