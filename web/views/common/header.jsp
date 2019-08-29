<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.parking.member.model.vo.Member" %>
   
    
<!-------------------------
'header.jsp' contains:
  * <meta> link
  * CSS link
  * <style> attribute
  * <header> <nav> elements
-------------------------->
<%
  Member loginMember = (Member)session.getAttribute("loginMember");

  String mypageUrl = request.getContextPath();
  if(loginMember != null){
    if(loginMember.getEmail().equals("admin@com"))
      mypageUrl += "/views/admin/mypageAdmin.jsp";
    else
      mypageUrl += "/views/member/mypageMember.jsp";
  }
  else
    mypageUrl += "/views/member/loginView.jsp";


  String dropdownTxt ="";
  if(loginMember != null)
    dropdownTxt = "Hi! " + loginMember.getUserName();
  else
    dropdownTxt = "MyPage";
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="parking web application">
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id" content="847270498494-dj5o04t83q5uja6ccp6eekr3en7qcb8p.apps.googleusercontent.com">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <title>Locate Parking Spaces</title>

  <!-- favicon -->
  <link rel="icon" href="https://img.icons8.com/ios/50/000000/parking.png?v=1.1">

  <!-- CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/button.css">

  <style>
    .site-header { /* custom transparent header */
      background-color: rgba(19, 37, 53, .80);
    }
    .site-header a {
      transition: ease-in-out color .15s;
    }
    
    #main-search-area{
      background-image: url("<%=request.getContextPath() %>/images/cover.jpg");
      background-size: cover !important;
      background-position: center center !important;
      height: 100vh !important;
      display: flex !important;
      margin-bottom: 0px;
      text-shadow:
        1.5px 1.5px 0px #132535;
    }

    .help{
      background-color: #1F2E3C;
    }

    textarea.review_content{
      resize: none;
    }

    @media (max-width: 700px) {
      p.about-text {
        font-size: 1.0rem !important;
      }
    }
    @media (min-width: 700px) {
      p.about-text{
        font-size: 1.3rem !important;
      }
    }
    
    .carousel-control-next,
    .carousel-control-prev {
      filter: invert(100%) !important;
    }

    .carousel-indicators li {
      width: 12px;
      height: 12px;
      border-radius: 100%;
      background-color: slategrey;
    }
    ol.carousel-indicators li.active {
      background-color: yellow;
    }

    #carousel_about .carousel-item > img {
      min-width: 100vw;
      height: 50vh;
      max-width: none;
      object-fit:cover;
      object-position:center;
    }
  </style>
</head>

<body>

  <!-- navigation bar -->
  <header>
    <nav class="site-header navbar navbar-expand-lg navbar-dark fixed-top py-0">
      <div class="container">
        <a class="navbar-brand " href="<%=request.getContextPath() %>/index.jsp">
          <img src="<%=request.getContextPath() %>/images/logo_white.png">
        </a>
        <form id="nav-searchbar" action="<%=request.getContextPath() %>/views/searchView.jsp" method="post" class="navbar-form" style="width: 410px">
          <div class="input-group">
            <input type="search" placeholder="Where do you need parking?" aria-describedby="button-addon5" class="form-control" name="search">
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
              <a href="#" class="nav-link menu-item">About</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mr-2" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Help</a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/helpView.jsp" ><i class="fa fa-info-circle">&nbsp;&nbsp;</i>Help</a>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/helpView.jsp" ><i class="fa fa-handshake-o">&nbsp;&nbsp;</i>Q&A Board</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mr-2" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=dropdownTxt %></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-cog">&nbsp;&nbsp;</i>Account Settings</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-calendar">&nbsp;&nbsp;</i>My Reservations</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-credit-card">&nbsp;&nbsp;</i>Payment Methods</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-won">&nbsp;&nbsp;</i>Credit Balance</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-car">&nbsp;&nbsp;</i>My Vehicle</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-bookmark">&nbsp;&nbsp;</i>Bookmark</a>
              </div>
            </li>

            <% if(loginMember != null) {%>
              <li class="nav-item">
                <form action="<%=request.getContextPath() %>/logout" method="post">
                  <button type="submit" class="btn btn-sm btn-outline-light mt-1 mr-1">Log Out</button>
                </form>
              </li>
            <%} else{%>
              <li class="nav-item">
                <form action="<%=request.getContextPath() %>/views/member/loginView.jsp" method="post">
                  <button type="submit" class="btn btn-sm btn-outline-light mt-1 mr-1">Log In</button>
                </form>
              </li>
              <li class="nav-item">
                  <button class="btn btn-sm btn-outline-light mt-1" onclick='location.href="<%=request.getContextPath() %>/memberEnroll"'>Sign Up</button>
              </li>
            <%} %>
          </ul>
        </div>
      </div>
    </nav>
  </header>