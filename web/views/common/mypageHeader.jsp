<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

  <%@ include file="/views/common/header.jsp" %>

  <!-- CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/avatar.css">
  <style>
    #listScroll{
      font-size: 14px;
      max-height: 310px;
    }
  </style>
 

  <div class="container pt-5">
    <div class="row">
      <div class="col-lg-3">
        <div class="list-group my-4">
          <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('/member/memberView');"><i class="fa fa-cog">&nbsp;&nbsp;</i>Settings</a>
          <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('/bookmark/bookmarkView');"><i class="fa fa-bookmark">&nbsp;&nbsp;</i>Bookmark</a>
          <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('');"><i class="fa fa-edit">&nbsp;&nbsp;</i>My Reviews</a>
          <% if(loginMember.getUserEmail().equals("admin@com")){ %>
            <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('/admin/memberList');"><i class="fa fa-list">&nbsp;&nbsp;</i>Member List</a>
          <%} else { %>
            <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('');"><i class="fa fa-credit-card">&nbsp;&nbsp;</i>Payment Methods</a>
            <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('');"><i class="fa fa-calendar">&nbsp;&nbsp;</i>Reservations</a>
            <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('');"><i class="fa fa-car">&nbsp;&nbsp;</i>My Vehicle</a>
            <a href="javascript:;" class="list-group-item" onclick="ajaxMypageContentLoad('');"><i class="fa fa-won">&nbsp;&nbsp;</i>Credit Balance</a>
          <% } %>
        </div>
        
        <div class="card shadow-sm text-left overflow-auto" id="listScroll" >
        </div>

      </div>

      <script>
        function ajaxMypageContentLoad(urlMapping){
          if($('#listScroll') != null)
            $('#listScroll').empty();
          if(urlMapping != '/bookmark/bookmarkView')
            $('#listScroll').hide();
          else
            $('#listScroll').show();

          $.ajax({
            type: "POST",
            url: "<%=request.getContextPath() %>" + urlMapping,
            data:{userCode: "<%=loginMember.getUserCode() %>"},
            dataType: "html",
            success: function(data){
              html = $('<div>').html(data);
              console.log(html.find('section.subMenu-container'));
              $('div#mypage-container').html(html.find('section.subMenu-container'));
            }
          });
        }
      </script>

      <div class="col-lg-9" id="mypage-container">
