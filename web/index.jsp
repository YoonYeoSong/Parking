<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

  <!-- search area -->
  <div class="jumbotron" id="main-search-area">
    <div class="container">
      <p class="h3 col-lg-8 mx-auto text-white text-center font-weight-bold">SEARCH FOR PARKING</p>
      <p class="h7 col-lg-8 mx-auto text-white text-center font-weight-bold">Around 23 Seoul Districts!</p>
      <div class="mx-auto col-lg-8">
        <form id="main-searchbar" action="" class="" role="form">
          <div class="input-group">
            <input type="search" class="form-control" placeholder="Where do you need parking?" aria-describedby="button-addon5">
            <div class="input-group-append">
            <button id="button-addon5" type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- carousel -->
  <div id="carousel_review" class="carousel slide" data-ride="carousel">
    <div class="d-flex align-content-center justify-content-center pt-4">
      <p class="h4 font-weight-bold">WHAT USERS ARE SAYING</p>
    </div>
    <ol class="carousel-indicators">
      <li data-target="#carousel_review" data-slide-to="0" class="active"></li>
      <li data-target="#carousel_review" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="container text-center pt-3 pb-5">
          <div class="row">
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_01</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div>
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_02</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div>
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_03</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div>
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_04</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="container text-center pt-3 pb-5">
          <div class="row">
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_05</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div>
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_06</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div>
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_07</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div>
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_08</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" cols="4" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carousel_review" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel_review" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    </a>
  </div>


  <!-- carousel -->
  <div id="carousel_about" class="carousel slide carousel_review-target" data-ride="carousel">

    <ol class="carousel-indicators">
      <li data-target="#carousel_about" data-slide-to="0" class="active"></li>
      <li data-target="#carousel_about" data-slide-to="1"></li>
      <li data-target="#carousel_about" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="" width="100%" height="100%" src="./images/about1.jpg" alt="">
        <div class="container">
          <div class="carousel-caption text-center text-dark">
            <p class='h2 font-weight-bold'>About</p><br>
            <p class='about-text'>The leading provider of parking reservations. Drivers plan and commute smarter by booking guaranteed parking in advance. </p>
            <p class='text-left'>
              <button class="learn-more">
                <div class="circle">
                  <span class="icon arrow"></span>
                </div>
                <p class="button-text">About</p>
              </button>
            </p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img class="" width="100%" height="100%" src="./images/about2.jpg" alt="">
        <div class="container">
          <div class="carousel-caption text-center text-dark">
            <p class='h2 font-weight-bold'>About</p><br>
            <p class='about-text'>Customers are empowered with the ability to search and compare thousands of 
              parking options and prices in 25 areas.
            </p>
            <p class='text-left'>
              <button class="learn-more">
                <div class="circle">
                  <span class="icon arrow"></span>
                </div>
                <p class="button-text">About</p>
              </button>
            </p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img class="" width="100%" height="100%" src="./images/about3.jpg" alt="">
        <div class="container">
          <div class="carousel-caption text-center text-dark">
            <p class='h2 font-weight-bold'>About</p><br>
            <p class='about-text'>Drivers can easily book a spot ahead of time at parking lots, garages, and valets in their city, or they can reserve on-the-go with the company’s award-winning mobile app for iOS and Android.</p>
            <p class='text-left'>
              <button class="learn-more">
                <div class="circle">
                  <span class="icon arrow"></span>
                </div>
                <p class="button-text">About</p>
              </button>
            </p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carousel_about" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel_about" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    </a>
  </div>

  <!-- help section -->
  <div class="help jumbotron" style="height: 48vh;">
    <div class="container ">
      <div class="mx-auto col-lg-5 pt-5">
        <p class="h3 display-5 text-center mb-5 text-white font-weight-bold">How can we help?</p>
        <div class="input-group mb-4">
          <input type="search" placeholder="Ask Us any questions." aria-describedby="button-addon5" class="form-control">
          <div class="input-group-append">
          <button id="button-addon5" type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
          </div>
        </div>
        </form>
      </div>

      <button class="learn-more">
        <div class="circle">
          <span class="icon arrow"></span>
        </div>
        <p class="button-text">Help</p>
      </button>
    </div>
  </div>

  <!-- footer -->
  <%@ include file="/views/common/footer.jsp" %>