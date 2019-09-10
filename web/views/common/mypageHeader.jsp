<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

  <div class="container pt-5">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4 "><%=loginMember.getUserName() %> Page</h1>
        <div class="list-group">
        <% if(loginMember!=null && loginMember.getUserEmail().equals("admin@com")){ %>
          <a href="<%=request.getContextPath() %>/admin/memberList" class="list-group-item">Member List</a>
          <% } else { %>
          <a href="javascript:;" class="list-group-item" 
              onclick="ajaxMypageContentLoad('/member/accountView');">Account Settings</a>
          <!-- <a href="javascript:;" class="list-group-item" 
              onclick="ajaxMypageContentLoad('/bookmark/bookmarkViewLoad');">Bookmark</a> -->
          <a href="#" class="list-group-item">Bookmark</a>
          <a href="#" class="list-group-item">Payment Methods</a>
          <a href="#" class="list-group-item">Reservations</a>
          <a href="#" class="list-group-item">My Vehicle</a>
          <a href="#" class="list-group-item">Credit Balance</a>
          <a href="#" class="list-group-item">My Reviews</a>
          <% } %>
        </div>
      </div>

      <script>
        function ajaxMypageContentLoad(urlMapping){
          console.log("a");
          $.ajax({
            type: "POST",
            url: "<%=request.getContextPath() %>" + urlMapping,
            data:{userCode: "<%=loginMember.getUserCode() %>"},
            dataType: "html",
            success: function(data){
              $('div#mypage-container').html(data);

            }
          });
        }
      </script>

      <!-- /.col-lg-3 -->
      <div class="col-lg-9" id="mypage-container">
