<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="parking web application">
  <title>Locate Parking lot - Parking</title>

  <!-- favicon -->
  <link rel="icon" href="https://img.icons8.com/ios/50/000000/parking.png?v=1.1">

  <!-- CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/button.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">

  <style>
    body{
      font-famiy: "Open Sans", sans-serif;
    }
    .site-header { /* custom transparent header */
      background-color: rgba(19, 37, 53, .70);
    }
    .site-header a {
      color: #999;
      transition: ease-in-out color .15s;
    }
    
    .search-area{
      background-image: url('./images/cover.jpg');
      background-size: cover !important;
      background-position: center center !important;
      height: 58vh !important;
      display: flex !important;
      align-items: center !important;
      margin-bottom: 0px;
    }
    .profile-picture{
      width: 55px;
      height: 55px;
    }

    .help{
      background-color: #1F2E3C;
    }

    textarea.review_content{
      columns: 4;
      resize: none;
    }

    @media (max-width: 700px) {
      p.about-text {
        font-size: 1.0rem !important;
      }
    }
    @media (min-width: 700px) {
      p.about-text {
        font-size: 1.3rem !important;
      }
    }
    
    .carousel-control-next,
    .carousel-control-prev {
      filter: invert(100%) !important;
    }

    .carousel-caption{
      color: rgba(19, 37, 53, .90) !important;
    }

    .carousel-indicators li {
      width: 12px;
      height: 12px;
      border-radius: 100%;
      background-color: lightslategray;
    }
    ol.carousel-indicators li.active {
      background-color: yellow;
    }

    #myCarousel2 .carousel-item > img {
      min-width: 100vw;
      height: 50vh;
      max-width: none;
      object-fit:cover;
      object-position:center;
    }
  </style>
</head>

<body>
  <!-- navigation header -->
  <header>
    <nav class="site-header navbar navbar-expand-lg navbar-dark fixed-top py-0">
      <div class="container">
        <a class="navbar-brand " href="#">
          <img src="./images/logo_white.png">
        </a>
        <form id="nav-searchbar" class="navbar-form" style="width: 410px">
          <div class="input-group">
            <input type="search" placeholder="Where do you need parking?" aria-describedby="button-addon5" class="form-control">
            <div class="input-group-append">
            <button id="button-addon5" type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
            </div>
          </div>
        </form>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapsible" aria-controls="navbarCollapsible" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapsible">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a href="#" class="nav-link menu-item">Review</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link menu-item">About</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link menu-item">Help</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mr-2" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hi! Foo!</a>
              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="#">My Reservations</a>
                <a class="dropdown-item" href="#">Account</a>
                <a class="dropdown-item" href="#">Payment Method</a>
                <a class="dropdown-item" href="#">Credit Balance</a>
                <a class="dropdown-item" href="#">My Vehicle</a>
                <a class="dropdown-item" href="#">Bookmark</a>
              </div>
            </li>
            <li class="nav-item">
              <button type="button" class="btn btn-sm btn-dark mt-1 mr-1">Log In</button>
            </li>
            <li class="nav-item">
              <button type="button" class="btn btn-sm btn-dark mt-1">Sign Up</button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <!-- search area -->
  <div class="jumbotron search-area">
    <div class="container">
      <h3>SEARCH LOCATION INFO <br>FOR YOUR PARKING SPACE</h3>
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
  <div id="myCarousel" class="review carousel slide" data-ride="carousel">
    <div class="d-flex align-content-center justify-content-center pt-3">
      <p class="h1">What users are saying</p>
    </div>
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="container text-center py-5">
          <div class="row">
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_01</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
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
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
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
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
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
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
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
        <div class="container text-center py-5">
          <div class="row">
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_05</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
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
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_07</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
                <span><i class="text-warning fa fa-star-o"></i></span>
              </p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-3">
              <img class="profile-picture" src="./images/profile.png" alt="Generic placeholder image">
              <div class="form-group">
                <label for="exampleFormControlTextarea1">user_08</label>
                <textarea readonly class="form-control review_content" id="exampleFormControlTextarea1" rows="7"></textarea>
              </div>
              <p>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
                <span><i class="text-warning fa fa-star"></i></span>
              </p>
            </div><!-- /.col-lg-4 -->
          </div><!-- /.row -->
        </div><!-- /.container -->
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    </a>
  </div>


  <!-- carousel -->
  <div id="myCarousel2" class="about carousel slide myCarousel-target" data-ride="carousel">

    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="" width="100%" height="100%" src="./images/about1.jpg" alt="">
        <div class="container">
          <div class="carousel-caption text-center">
            <p class='h1'>About</p><br>
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
          <div class="carousel-caption text-center">
            <p class='h1'>About</p><br>
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
          <div class="carousel-caption text-center">
            <p class='h1'>About</p><br>
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
    <a class="carousel-control-prev" href="#myCarousel2" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel2" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    </a>
  </div>

  <!-- help section -->
  <div class="help jumbotron" style="height: 45vh;">
    <div class="container ">
      <div class="mx-auto col-lg-5 pt-5">
        <p class="h1 display-5 text-center mb-5 text-white">How can we help?</p>
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
