<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.parking.member.model.vo.Member" %>

<%@ include file="/views/common/mypageHeader.jsp" %>

    <section class="py-4 subMenu-container">
      <div class="card card-fluid">
        <h6 class="card-header">Account Settings</h6>
        <!-- .card-body -->
        <div class="card-body">
          <!-- .media -->
          <div class="media mb-3">
            <!-- avatar -->
            <div class="user-avatar user-avatar-xl fileinput-button">
              <div class="fileinput-button-label"> Change photo </div>
              <img src="<%=request.getContextPath() %>/images/profile.png" alt="User Avatar">
              <input id="fileupload-avatar" type="file" name="avatar"> </div>
            <!-- /avatar -->
            <!-- .media-body -->
            <div class="media-body pl-3">
              <h3 class="card-title">Account Settings</h3>
              <h6 class="card-subtitle text-muted"> Click the current avatar to change your photo. </h6>
              <p class="card-text">
                <small>JPG, GIF or PNG 400x400, &lt; 2 MB.</small>
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
          <form method="post" _lpchecked="1">
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
            <div class="form-row">
              <label for="input04" class="col-md-3">SMS</label>
              <div class="col-md-9 mb-3">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="smsChk" checked="">
                  <label class="custom-control-label" for="smsChk">Subscribe to SMS</label>
                </div>
              </div>
            </div>
            <div class="form-row">
              <label for="input04" class="col-md-3">Email</label>
              <div class="col-md-9 mb-3">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="emailChk" checked="">
                  <label class="custom-control-label" for="emailChk">Subscribe to Email</label>
                </div>
              </div>
            </div>
            <hr>
            <div class="form-actions">
              <button type="submit" class="btn btn-primary ml-auto">Update Profile</button>
            </div>
            <!-- /.form-actions -->
          </form>
          <!-- /form -->
        </div>
        <!-- /.card-body -->
      </div>

    </section>

<%@ include file="/views/common/mypageFooter.jsp" %>