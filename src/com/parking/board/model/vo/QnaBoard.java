package com.parking.board.model.vo;

import java.sql.Date;

public class QnaBoard {

  private int qnaNo;
  private String qnaTitle;
  private String userCode;
  private String qnaContent;
  private String qnaOriginalFile;
  private String qnaRenamedFile;
  private Date qnaCreatedDate;
  private int qnaReadcount;
  
  public QnaBoard() {
    // TODO Auto-generated constructor stub
  }
  
  public QnaBoard(int qnaNo, String qnaTitle, String userCode, String qnaContent, String qnaOriginalFile,
      String qnaRenamedFile, Date qnaCreatedDate, int qnaReadcount) {
    super();
    this.qnaNo = qnaNo;
    this.qnaTitle = qnaTitle;
    this.userCode = userCode;
    this.qnaContent = qnaContent;
    this.qnaOriginalFile = qnaOriginalFile;
    this.qnaRenamedFile = qnaRenamedFile;
    this.qnaCreatedDate = qnaCreatedDate;
    this.qnaReadcount = qnaReadcount;
  }

  @Override
  public String toString() {
    return "QnaBoard [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", userCode=" + userCode + ", qnaContent="
        + qnaContent + ", qnaOriginalFile=" + qnaOriginalFile + ", qnaRenamedFile=" + qnaRenamedFile
        + ", qnaCreatedDate=" + qnaCreatedDate + ", qnaReadcount=" + qnaReadcount + "]";
  }

  public int getQnaNo() { return qnaNo; }
  public void setQnaNo(int qnaNo) { this.qnaNo = qnaNo; }
  public String getQnaTitle() { return qnaTitle; }
  public void setQnaTitle(String qnaTitle) { this.qnaTitle = qnaTitle; }
  public String getUserCode() { return userCode; }
  public void setUserCode(String userCode) { this.userCode = userCode; }
  public String getQnaContent() { return qnaContent; }
  public void setQnaContent(String qnaContent) { this.qnaContent = qnaContent; }
  public String getQnaOriginalFile() { return qnaOriginalFile; }
  public void setQnaOriginalFile(String qnaOriginalFile) { this.qnaOriginalFile = qnaOriginalFile; }
  public String getQnaRenamedFile() { return qnaRenamedFile; }
  public void setQnaRenamedFile(String qnaRenamedFile) { this.qnaRenamedFile = qnaRenamedFile; }
  public Date getQnaCreatedDate() { return qnaCreatedDate; }
  public void setQnaCreatedDate(Date qnaCreatedDate) { this.qnaCreatedDate = qnaCreatedDate; }
  public int getQnaReadcount() { return qnaReadcount; }
  public void setQnaReadcount(int qnaReadcount) { this.qnaReadcount = qnaReadcount; }
}
