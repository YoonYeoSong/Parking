<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ include file="./common/header.jsp" %>

  <div class="container sns jumbotron">
    <div class="d-flex justify-content-center h-100">
      <div class="card">
        <div class="card-header">
          <h3>Sign In</h3>
          <div class="d-flex justify-content-end social_icon">
            <a class="mx-1" href="http://">
              <span><i class="fa fa-facebook-official"></i></span>
            </a>
            
            
            <a class="mx-1" href="http://">
              <span><i class="fa fa-instagram"></i></span>
            </a>
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
              <input type="email" class="form-control" placeholder="email" name="email" id="email">

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
              <input type="submit" value="Login" class="btn float-right login_btn">
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
  <div class="d-flex justify-content-center h-100">
    <img id="myImg"><br>
    <p id="name"></p>
    <div id="status"></div>

    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" id="myP"></div>
    <button onclick="myFunction()" class="btn btn-sm btn-dark">Sign Out</button>
  </div>

  <script>
    function onSignIn(googleUser) {
      // Useful data for your client-side scripts:
      var profile = googleUser.getBasicProfile();
      console.log("ID: " + profile.getId()); // Don't send this directly to your server!
      console.log('Full Name: ' + profile.getName());
      console.log('Given Name: ' + profile.getGivenName());
      console.log('Family Name: ' + profile.getFamilyName());
      console.log("Image URL: " + profile.getImageUrl());
      console.log("Email: " + profile.getEmail());

      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token);

      document.getElementById("myImg").src = profile.getImageUrl();
      document.getElementById("name").innerHTML = profile.getName();
      document.getElementById("myP").style.visibility = "hidden";

      //document.getElementById("status").innerHTML = 'Welcome '+name+"!<a href=success.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>";
      document.getElementById("status").innerHTML = 'Welcome '+name+"!<a href='<%=request.getContextPath() %>/index.jsp'/>Continue with Google login</a></p>";


    }
    function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
    }
    function validate(){
    	if($('#email').val().length==0){
        alert("Please type Email for login");
        $('#email').focus();
        return false; //prevent form submit
      }
    	if($('#pw').val().length==0){
        alert("Please type Password for login");
        $('#pw').focus();
        return false; //prevent form submit
      }
    	return true;
    }
  </script>

<%@ include file="./common/footer.jsp" %>
