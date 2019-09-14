<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

  <%@ include file="/views/common/header.jsp" %>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/avatar.css">

  <div class="container pt-5">
    <div class="row">
      <div class="col-lg-3">
        <!-- <h3 class="my-4 "><%=loginMember.getUserName() %> Page</h3> -->
        <div class="list-group my-4">
        <% if(loginMember!=null && loginMember.getUserEmail().equals("admin@com")){ %>
          <a href="<%=request.getContextPath() %>/admin/memberList" class="list-group-item">Member List</a>
          <% } else { %>
          <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('/member/memberView');">Account Settings</a>
          <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('/bookmark/bookmarkView');">Bookmark</a>
          <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('/board/review');">My Reviews</a>
          <a href="#" class="list-group-item">Payment Methods</a>
          <a href="#" class="list-group-item">Reservations</a>
          <a href="#" class="list-group-item">My Vehicle</a>
          <a href="#" class="list-group-item">Credit Balance</a>
          <% } %>
        </div>
      </div>

      <script>
        function ajaxMypageContentLoad(urlMapping){
          $.ajax({
            type: "POST",
            url: "<%=request.getContextPath() %>" + urlMapping,
            data:{userCode: "<%=loginMember.getUserCode() %>"},
            dataType: "html",
            success: function(data){
              html = $('<div>').html(data);
              $('div#mypage-container').html(html.find('section.subMenu-container'));
            }
          });
        }
      </script>

      <!-- /.col-lg-3 -->
      <div class="col-lg-9" id="mypage-container">
