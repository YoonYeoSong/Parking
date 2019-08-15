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
              <span><i class="fa fa-google"></i></span>
            </a>
            <a class="mx-1" href="http://">
              <span><i class="fa fa-instagram"></i></span>
            </a>
          </div>
        </div>
        <div class="card-body">
          <form class="form-signin">
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
              </div>
              <input type="email" class="form-control" placeholder="email" name="email">

            </div>
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-key"></i></span>
              </div>
              <input type="password" class="form-control" placeholder="Password" name="pw">
            </div>
            <div class="row align-items-center remember">
              <label for="check"><input type="checkbox" name="check" id="check">Remember Me!</label>
            </div>
            <div class="form-group">
              <input type="submit" value="Login" class="btn float-right login_btn">
            </div>
          </form>
        </div>
        <div class="card-footer">
          <div class="d-flex justify-content-center links">
            Don't have an account?<a href="#">Sign up</a>
          </div>
          <div class="d-flex justify-content-center">
            <a href="#">Forgot your password?</a>
          </div>
        </div>
      </div>
    </div>
  </div>

<%@ include file="./common/footer.jsp" %>
