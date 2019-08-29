<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

  <div class="container pt-5">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4 "><%=loginMember.getUserName() %> Page</h1>
        <div class="list-group">
        <% if(loginMember!=null && loginMember.getEmail().equals("admin@com")){ %>
          <a href="<%=request.getContextPath() %>/admin/memberList" class="list-group-item">Member List</a>
          <a href="<%=request.getContextPath() %>/board/" class="list-group-item">Board</a>
        <% } else { %>
          <a href="#" class="list-group-item">Account Settings</a>
          <a href="#" class="list-group-item">Payment Methods</a>
          <a href="#" class="list-group-item">Reservations</a>
          <a href="#" class="list-group-item">Bookmark</a>
          <a href="#" class="list-group-item">My Vehicle</a>
          <a href="#" class="list-group-item">Credit Balance</a>
          <a href="#" class="list-group-item">My Reviews</a>
        <% } %>
        </div>
      </div>
      <!-- /.col-lg-3 -->
      <div class="col-lg-9">