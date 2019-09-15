<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.parking.member.model.vo.Member" %>

<%@ include file="/views/common/mypageHeader.jsp" %>

    <section class="py-4 subMenu-container">
      <div class="card card-fluid">
        <h6 class="card-header">Bookmark</h6>
        <!-- .card-body -->
        <div class="card-body">
          <!-- .media -->
          <div class="media mb-3">
            <!-- <div class="user-avatar user-avatar-xl fileinput-button">
              <div class="fileinput-button-label">Change photo</div>
              <img src="<%=request.getContextPath() %>/images/profile.png" alt="User Avatar">
              <input id="fileupload-avatar" type="file" name="avatar"> </div> -->
            <!-- .media-body -->
            <div class="media-body pl-3">
              <h3 class="card-title">Bookmark list</h3>
              <h6 class="card-subtitle text-muted">Saved Parking locations</h6>
              <p class="card-text">
                <small>You have saved 9999 parking spaces.</small>
              </p>
              <!-- The avatar upload progress bar -->
              <div id="progress-avatar" class="progress progress-xs fade">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <!-- /avatar upload progress bar -->
            </div>
            <!-- /.media-body -->
          </div>
          <!-- /.media -->
          <!-- form -->
          <div class="hide" style="overflow:hidden;padding:7px 11px;border:1px solid #dfdfdf;border-color:rgba(0,0,0,.1);border-radius:0 0 2px 2px;background-color:#f9f9f9;width:482px;"><strong style="float: left;"><img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵"></strong><div style="float: right;position:relative"><a style="font-size:12px;text-decoration:none;float:left;height:15px;padding-top:1px;line-height:15px;color:red" target="_blank" href="https://map.kakao.com/?urlX=485137&urlY=1107986&urlLevel=3&map_type=TYPE_MAP&map_hybrid=false">kakaoMap api Work in progress...</a></div></div>
          <a href="https://map.kakao.com/?urlX=485137&urlY=1107986&urlLevel=3&map_type=TYPE_MAP&map_hybrid=false" target="_blank"><img width="504" height="310" src="https://map2.daum.net/map/mapservice?FORMAT=PNG&SCALE=2.5&MX=485137&MY=1107986&S=0&IW=504&IH=310&LANG=0&COORDSTM=WCONGNAMUL&logo=kakao_logo" style="border:1px solid #ccc"></a>

          <form method="post" >
            <!-- form row -->
            <div class="form-row">
              <!-- form column -->
              <label for="input02" class="col-md-3">Phone</label>
              <!-- /form column -->
              <!-- form column -->
              <div class="col-md-9 mb-3">
                <input type="text" class="form-control" id="input02" value="<%=loginMember.getUserPhone() %>">
              </div>
              <!-- /form column -->
            </div>
            <div class="form-row">
              <!-- form column -->
              <label for="input02" class="col-md-3">User Name</label>
              <!-- /form column -->
              <!-- form column -->
              <div class="col-md-9 mb-3">
                <input type="text" class="form-control" id="input02" value="<%=loginMember.getUserName() %>">
              </div>
              <!-- /form column -->
            </div>
            <div class="form-row">
              <!-- form column -->
              <label for="input03" class="col-md-3">Address</label>
              <!-- /form column -->
              <!-- form column -->
              <div class="col-md-9 mb-3">
                <textarea type="text" class="form-control" id="input03"><%=loginMember.getUserAddr() %></textarea>
                <small class="text-muted">Appears on your profile page, 300 chars max.</small>
              </div>
              <!-- /form column -->
            </div>
            <hr>
            <!-- <div class="form-actions">
              <button type="submit" class="btn btn-primary ml-auto">Update Profile</button>
            </div> -->
            <!-- /.form-actions -->
          </form>
          <!-- /form -->
        </div>
        <!-- /.card-body -->
      </div>

    </section>

<%@ include file="/views/common/mypageFooter.jsp" %>