package com.parking.member.model.vo;

import java.sql.Date;

public class Member {
  private String userCode;
  private String email;
  private String pw;
  private String phone;
  private String userName;
  private String userAddr;
  private Date createdDate;
  private Date loginDate;
  private boolean smsYn;
  private boolean emailYn;
  private boolean emailVerified;

  public Member() {
    // TODO Auto-generated constructor stub
  }
  
  public Member(String userCode, String email, String pw, String phone, String userName, String userAddr,
      Date createdDate, Date loginDate, boolean smsYn, boolean emailYn, boolean emailVerified) {
    super();
    this.userCode = userCode;
    this.email = email;
    this.pw = pw;
    this.phone = phone;
    this.userName = userName;
    this.userAddr = userAddr;
    this.createdDate = createdDate;
    this.loginDate = loginDate;
    this.smsYn = smsYn;
    this.emailYn = emailYn;
    this.emailVerified = emailVerified;
  }
  
  @Override
  public String toString() {
    return "Member [userCode=" + userCode + ", email=" + email + ", pw=" + pw + ", phone=" + phone + ", userName="
        + userName + ", userAddr=" + userAddr + ", createdDate=" + createdDate + ", loginDate=" + loginDate + ", smsYn="
        + smsYn + ", emailYn=" + emailYn + ", emailVerified=" + emailVerified +"]";
  }

  public String getUserCode() { return userCode; } 
  public void setUserCode(String userCode) { this.userCode = userCode; } 
  public String getEmail() { return email; } 
  public void setEmail(String email) { this.email = email; } 
  public String getPw() { return pw; } 
  public void setPw(String pw) { this.pw = pw; } 
  public String getPhone() { return phone; } 
  public void setPhone(String phone) { this.phone = phone; } 
  public String getUserName() { return userName; } 
  public void setUserName(String userName) { this.userName = userName; } 
  public String getUserAddr() { return userAddr; } 
  public void setUserAddr(String userAddr) { this.userAddr = userAddr; } 
  public Date getCreatedDate() { return createdDate; } 
  public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; } 
  public Date getLoginDate() { return loginDate; } 
  public void setLoginDate(Date loginDate) { this.loginDate = loginDate; } 
  public boolean isSmsYn() { return smsYn; } 
  public void setSmsYn(boolean smsYn) { this.smsYn = smsYn; } 
  public boolean isEmailYn() { return emailYn; } 
  public void setEmailYn(boolean emailYn) { this.emailYn = emailYn; }
  public boolean isEmailVerified() { return emailVerified; }
  public void setEmailVerified(boolean emailVerified) { this.emailVerified = emailVerified; } 
}