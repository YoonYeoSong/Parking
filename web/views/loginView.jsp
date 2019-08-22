<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ include file="./common/header.jsp" %>

  <div class="container sns ">
    <div class="d-flex justify-content-center h-100">
      <div class="card">
        <div class="card-header">
          <h3>Sign In</h3>
          <div class="d-flex justify-content-end social_icon">
              <span><i class="fa fa-facebook-official"></i></span>
              <span id="googleSignIn"><i class="fa fa-google-plus-square"></i></span>
              <span><img src="<%=request.getContextPath() %>/images/kakaobutton.png" class="kakaobutton"></span>
              <!-- <div class="fa fa-google-plus-square" data-onsuccess="onSignIn" data-theme="dark" id="myP"></div> -->
          </div>

          <div class="d-flex justify-content-center">
            <img id="myImg"><br>
            <div id="name" class="text-white"></div>
            <!-- <div id="status"></div> -->

            <button id="googleLogoutBtn" onclick="googleLogout()" class="btn btn-sm btn-outline-light mt-1 mr-1">Google Log Out</button>
          </div>
        </div>
        <div class="card-body">
          <form class="form-signin"
            action="<%=request.getContextPath() %>/login" 
            method="post"
            onsubmit="return validate()">

            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
              </div>
              <input type="email" class="form-control" placeholder="Email" name="email" id="email">

            </div>
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-key"></i></span>
              </div>
              <input type="password" class="form-control" placeholder="Password" name="pw" id="pw">
            </div>
            <div class="row align-items-center remember">
              <label for="saveId"><input type="checkbox" name="saveId" id="saveId">Remember Me!</label>
            </div>
            <div class="form-group">
              <input type="submit" value="Log In" class="btn btn-outline-dark float-right login_btn">
            </div>

            
          </form>
        </div>
        <div class="card-footer">
          <div class="d-flex justify-content-center links">
            Don't have an account?<a href="/views/signup.jsp">Sign up</a>
          </div>
          <div class="d-flex justify-content-center">
            <a href="#">Forgot your password?</a>
          </div>
        </div>
      </div>
    </div>
  </div>

<%@ include file="./common/footer.jsp" %>
