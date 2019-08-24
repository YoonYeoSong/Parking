<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./common/header.jsp" %>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/card-flip.css">

  <style>
    #help-search-area{
      background-color: #98A0A6;
      height: 58vh !important;
      display: flex !important;
      margin-bottom: 0px;
      text-shadow:
        1.5px 1.5px 0px #132535;
    }
  </style>

  <!-- cover -->
  <div class="jumbotron align-items-center" id="help-search-area" style="height:55vh">
    <div class="container">

      <p class="h3 text-white row justify-content-center font-weight-bold">SEARCH FOR HELPFUL ARTICLES</p>
      <p class="h7 text-white row justify-content-center font-weight-bold">IT WILL HELP YOU USE THE APP!</p>
      <div class="mx-auto col-lg-8">
        <form id="main-searchbar" action="" class="" role="form">
          <div class="input-group mb-4">
            <div class="input-group-prepend">
              <button id="button-addon7" type="submit" class="btn btn-light"><i class="fa fa-search"></i></button>
            </div>
            <input type="search" placeholder="Search Help Articles" aria-describedby="button-addon7" class="form-control">
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">

        <div class="col-md-6">
          <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
            <div class="mainflip">
                <div class="frontside">
                    <div class="card">
                        <div class="card-body text-center">
                            <p><img class="img-fluid" src="../images/driverhelp.png" alt="card image"></p>
                            <h4 class="card-title">Driver</h4>
                            <p class="card-text">This is basic card with image on top, title, description and button.</p>
                        </div>
                    </div>
                </div>
                <div class="backside">
                  <div class="card">
                      <div class="card-body text-center mt-4">
                        <h4 class="card-title">Driver Help</h4>
                        <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                        <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>

        <div class="col-md-6">

          <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
            <div class="mainflip">
              <div class="frontside">
                <div class="card">
                  <div class="card-body text-center">
                    <p><img class="img-fluid" src="../images/ownerhelp.png" alt="card image"></p>
                    <h4 class="card-title">Owner</h4>
                    <p class="card-text">This is basic card with image on top, title, description and button.</p>
                  </div>
                </div>
              </div>
              <div class="backside">
                <div class="card">
                  <div class="card-body text-center mt-4">
                    <h4 class="card-title">Owner Help</h4>
                    <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-6 col-md">
          <p class="h5">
            <span><i class="text-warning fa fa-star"></i>&nbsp;&nbsp;Featured Articles</span>
          </p>
          <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="#">How do I make a long-term booking?</a></li>
            <li><a class="text-muted" href="#">How do I book a parking space?</a></li>
            <li><a class="text-muted" href="#">How do I contact a space owner</a></li>
          </ul>
        </div>
        <div class="col-6 col-md">
        <ul class="list-unstyled text-small">
          <p class="h5">&nbsp;</p>
          <li><a class="text-muted" href="#">How do I find a space for large vehicles?</a></li>
          <li><a class="text-muted" href="#">How do I change the vehicle on a booking?</a></li>
          <li><a class="text-muted" href="#">How do I reset my password?</a></li>
        </ul>
        </div>
      </div>
    </div>
  </div>
  
<%@ include file="./common/footer.jsp" %>