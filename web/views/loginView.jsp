<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%
  Cookie[] cookies = request.getCookies();
  String saveEmail = null;

  if(cookies != null){
    for(Cookie c : cookies){
      String key= c.getName();
      String value = c.getValue();
      if(key.equals("saveEmail"))
        saveEmail = value;
    }
  }
%>

<%@ include file="./common/header.jsp" %>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">

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
            onsubmit="return validate_login()">

            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
              </div>
              <input type="email" class="form-control" placeholder="Email" name="email" id="email"
                     value='<%=saveEmail != null? saveEmail : "" %>' />
            </div>
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-key"></i></span>
              </div>
              <input type="password" class="form-control" placeholder="Password" name="pwLogin" id="pwLogin">
            </div>
            <div class="row align-items-center remember">
              <label for="saveEmail">
                <input type="checkbox" name="saveEmail" id="saveEmail" <%=saveEmail!=null? "checked":"" %> />Remember Me!
              </label>
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

  <script>
    function validate_login(){
      if($('#email').val().length==0){
        alert("Please type Email for login");
        $('#email').focus();
        return false; //prevent form submit
      }
    	if($('#pwLogin').val().length==0){
        alert("Please type Password for login");
        $('#pwLogin').focus();
        return false; //prevent form submit
      }
    	return true;
    }
  </script>
    
    <%@ include file="./common/footer.jsp" %>
