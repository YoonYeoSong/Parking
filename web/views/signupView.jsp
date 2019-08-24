<%@ include file="/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/signup.css">

  <div class="container sns">
    <div class="d-flex justify-content-center h-100">
      <div class="card">
        <div class="card-header">
          <h3>Sign Up</h3>
        </div>
        <div class="card-body">
          <form>
            <div class="input-group form-group">
              <input type="text" class="form-control" placeholder="Username" name="name" id="name" required>
            </div>

            <div class="input-group form-group">
              <input type="email" class="form-control form-group mr-3" placeholder="Email" id="email" name="email" required>
              <input type="button" class="btn btn-secondary form-group form-control" value="check duplication">
            </div>

            <div class="input-group form-group">
              <input type="password" class="form-control" placeholder="Password" id="pw" name="pw" required>
            </div>

            <div class="input-group form-group">
              <input type="password" class="form-control" placeholder="Confirm password" required>
            </div>

            <div class="input-group form-group">
              <input type="text" class="form-control" placeholder="Phone number" id="phone" name="phone" required>
            </div>

            <div class=" input-group form-group">
              <input type="postcode" class="mr-3 col-md-3 form-control" placeholder="Postcode" id="postcode" name="postcode">
              <input type="address" class="form-control" placeholder="Address" id="address" name="address" required>
              <span class="input-group-text"><i class="fa fa-search"></i></span>
            </div>

            <div class="checkbox">
              <label class="privacy">
                <input type="checkbox" id="termsChk" name="termsChk" required> I accept the <a href="#">Terms of Use</a> &<a href="#"> Privacy Policy</a>
              </label>

              <label class="spam_sms">
                <input type="checkbox" id="phoneYnChk" name="phoneYnChk" required> By clicking the box, you agree to receive our latest news and special offers by phone!
              </label> 

              <label class="spam_email">
                <input type="checkbox" id="emailYnChk" name="emailYnChk" required> By clicking the box, you agree to receive our latest news and special offers by email!
              </label>
            </div>

            <div class="form-group">
              <input type="submit" value="submit" class="btn float-right submit_btn">
            </div>

          </form>
        </div>

      </div>
    </div>
  </div>

<%@ include file="/views/common/footer.jsp" %>