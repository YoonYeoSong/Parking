<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/signup.css">

  <div class="container sns">
    <div class="d-flex justify-content-center h-100">
      <div class="card">
        <div class="card-header">
          <h3>Sign Up</h3>
        </div>
        <div class="card-body">
          <form action="<%=request.getContextPath() %>/memberEnrollEnd" method="post" onsubmit="return validate_enroll();">
            <div class="input-group form-group">
              <input type="text" class="form-control" placeholder="Username" name="userName" id="userName" required>
            </div>

            <div class="input-group form-group">
              <input type="email" class="form-control form-group mr-3" placeholder="Email" id="email" name="email" required>
              <input type="button" class="btn btn-secondary form-group form-control" value="check duplication" onclick="checkEmailDuplicate();">
            </div>

            <div class="input-group form-group">
              <input type="password" class="form-control" placeholder="Password" id="pwEnroll" name="pwEnroll" required>
            </div>

            <div class="input-group form-group">
              <input type="password" class="form-control" placeholder="Confirm password" id="pwEnrollChk" name="pwEnrollChk" required>
            </div>

            <div class="input-group form-group">
              <input type="text" class="form-control" placeholder="Phone number" id="phone" name="phone" required>
            </div>

            <div class=" input-group form-group">
              <input type="postcode" class="mr-3 col-md-3 form-control" placeholder="Postcode" id="postcode" name="postcode">
              <input type="address" class="form-control" placeholder="Address" id="addr" name="addr" required>
              <span class="input-group-text"><i class="fa fa-search"></i></span>
            </div>

            <div class="checkbox">
              <label class="privacy">
                <input type="checkbox" id="termsChk" name="termsChk" required> I accept the <a href="#">Terms of Use</a> &<a href="#"> Privacy Policy</a>
              </label>

              <label class="spam_sms">
                <input type="checkbox" id="smsYn" name="smsYn" > By clicking the box, you agree to receive our latest news and special offers by phone!
              </label> 

              <label class="spam_email">
                <input type="checkbox" id="emailYn" name="emailYn" > By clicking the box, you agree to receive our latest news and special offers by email!
              </label>
            </div>

            <div class="form-group">
              <input type="submit" value="submit" class="btn float-right submit_btn">
            </div>
          </form>

          <form method="post" name="checkEmailDuplicateHiddenFrm">
            <input type="hidden" name="emailHidden">
          </form>

        </div>

      </div>
    </div>
  </div>

  <script>
    function validate_enroll(){
      //word length check
      var userName = $("#userName");
      if(userName.val().trim().length < 2){
        alert("User name must contain more than 1 character.")
        userName.focus();
        return false;
      }

      //must agree with our terms of agreement
      if(!$("#termsChk").is(':checked'))
        return false;

      return true;
    }

    function checkEmailDuplicate(){
      var title = "checkEmailDuplicate";
      var status = "left=500px, top=100px, width=300px, height=200px, menubar=n, status=no, scrollbars=yes";
      var popup = open("", title, status); //window.open()
      var url = "<%=request.getContextPath() %>/checkEmailDuplicate";

      checkEmailDuplicateHiddenFrm.action = url;
      checkEmailDuplicateHiddenFrm.emailHidden.value = $("#email").val().trim();
      checkEmailDuplicateHiddenFrm.target = title;
      checkEmailDuplicateHiddenFrm.submit();
    }
  </script>

<%@ include file="/views/common/footer.jsp" %>