<%@page import="com.parking.api.model.vo.Parking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.parking.member.model.vo.Member" %>
<%@ page import="com.parking.board.model.vo.QnaBoard" %>

<%-- <%@ include file="/views/common/header.jsp"%> --%>

<% List<Parking> list = (List)request.getAttribute("list"); %>
<%
  Member loginMember = (Member)session.getAttribute("loginMember");

  String mypageUrl = request.getContextPath();

  if(loginMember != null){
    if(loginMember.getUserEmail().equals("admin@com"))
      mypageUrl += "/admin/memberList";
    //else
    //  mypageUrl += "/views/member";
  }
  else
      mypageUrl += "/views/member/loginView.jsp";


  String dropdownTxt ="";
  if(loginMember != null)
    dropdownTxt = "Hi! " + loginMember.getUserName();
  else
    dropdownTxt = "MyPage";
%>
<!-- overflow:auto 사용하여 list 내용이 잘릴때 스크롤 사용  -->

<head>


  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="parking web application">
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id"
    content="847270498494-dj5o04t83q5uja6ccp6eekr3en7qcb8p.apps.googleusercontent.com">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <title>Locate Parking Spaces</title>

  <!-- favicon -->
  <link rel="icon" href="https://img.icons8.com/ios/50/000000/parking.png?v=1.1">

  <!-- CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainpage.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/button.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/translate.css">

  <!-- JQUERY -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

  <!-- JAVASCRIPT -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>

  <!-- API -->
  <!-- 카카오 -->
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

  <script>
    function googleTranslateElementInit() {
      new google.translate.TranslateElement(
        {
          pageLanguage: 'en',
          includedLanguages: 'en,es,ja,ko,pt,ru,zh-CN,zh-TW',
          layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
          autoDisplay: false
        }, 'google_translate_element'
      );
    }
  </script>
  <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>


  <style>
    .goog-te-gadget-simple {
      border: 1px solid rgba(255, 255, 255, .0);
    }

    .nav-item {
      color: #B8C8D6 !important;
    }

    .site-header {
      background-color: rgba(2, 3, 3, 0.75);
    }

    .align-left {
      text-align: left;
    }

    .float-left {
      float: left;
    }

    .float-right {
      float: right;
    }

    .my-1 {
      margin-top: 1em;
      margin-bottom: 1em;
    }

    .mt-3 {
      margin-top: 3em;
    }

    ul li {
      list-style-type: none;
    }

    .pr-1 {
      padding-right: -em;
    }

    /*가로 카드박스 중간 1em*/
    .pl-1 {
      padding-left: 1em;
    }

    /*가로 카드박스 중간 1em*/
    .pb-1 {
      padding-bottom: 1em;
    }

    .pt-1 {
      padding-top: 1em;
    }

    .overflow-hidden {
      overflow: hidden;
    }

    .width {
      width: 80px;
    }

    #listScroll {
      overflow: scroll;
    }

    .style_width {
      width: 100%;
    }
  </style>

</head>

<body>

  <!-- navigation bar -->
  <header>
    <nav class="site-header navbar navbar-expand-lg navbar-dark fixed-top py-0">
      <div class="container">
        <a class="navbar-brand " href="<%=request.getContextPath() %>">
          <img src="<%=request.getContextPath() %>/images/logo_white.png">
        </a>
        <form id="nav-searchbar" action="" method="post" class="navbar-form" style="width: 410px">
          <div class="input-group">
            <input type="search" placeholder="Where do you need parking?" aria-describedby="button-addon5"
              class="form-control" name="search" id="searchAddr">
            <div class="input-group-append">
              <button id="button-addon5" class="btn btn-primary" onclick="ajaxSearch()"><i
                  class="fa fa-search"></i></button>
            </div>
          </div>
        </form>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapsible"
          aria-controls="navbarCollapsible" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapsible">
          <ul class="navbar-nav ml-auto">



            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mt-1 mr-0" href="#" id="dropdown_lang" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Papago</a>

              <div class="dropdown-menu mt-1" >
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/common/papagoApi.jsp"><i class="fa fa-language">&nbsp;&nbsp;</i>Papago</a>
              </div>
            </li> -->

            <!-- <li class="nav-item">
              <a href="<%=request.getContextPath() %>/views/aboutView.jsp" class="nav-link menu-item mt-1">About Us</a>
            </li> -->

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mt-1 mr-0 text-white" href="#" id="dropdown01"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-globe"></i></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <div id="google_translate_element" class="dropdown-item fa fa-globe"></div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mt-1 mr-0 text-white" href="#" id="dropdown01"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Help</a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/helpView.jsp"><i
                    class="fa fa-info-circle">&nbsp;&nbsp;</i>Help</a>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/board/qnaBoardList"><i
                    class="fa fa-question-circle-o">&nbsp;&nbsp;</i>Q&amp;A Board</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mt-1 mr-2 text-white" href="#" id="dropdown02"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=dropdownTxt %></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <% if(loginMember != null 
                  && loginMember.getUserEmail().equals("admin@com")) { %>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-list">&nbsp;&nbsp;</i>Member List</a>
                <% } else if(loginMember != null
                  && !loginMember.getUserEmail().equals("admin@com")) { %>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/member/memberView.jsp"><i
                    class="fa fa-cog">&nbsp;&nbsp;</i>Account Settings</a>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/bookmark/bookmarkView.jsp"><i
                    class="fa fa-bookmark">&nbsp;&nbsp;</i>Bookmark</a>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/board/review.jsp"><i
                    class="fa fa-edit">&nbsp;&nbsp;</i>My Reviews</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-calendar">&nbsp;&nbsp;</i>My
                  Reservations</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-credit-card">&nbsp;&nbsp;</i>Payment
                  Methods</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-won">&nbsp;&nbsp;</i>Credit Balance</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-car">&nbsp;&nbsp;</i>My Vehicle</a>
                <% } else { %>
                <!-- (loginMember == null) -->
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-cog">&nbsp;&nbsp;</i>Account
                  Settings</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-bookmark">&nbsp;&nbsp;</i>Bookmark</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-edit">&nbsp;&nbsp;</i>My Reviews</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-calendar">&nbsp;&nbsp;</i>My
                  Reservations</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-credit-card">&nbsp;&nbsp;</i>Payment
                  Methods</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-won">&nbsp;&nbsp;</i>Credit Balance</a>
                <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-car">&nbsp;&nbsp;</i>My Vehicle</a>
                <% } %>

                <form action="" name="mypageSubMenuFrm">
                  <input type="hidden" name="subMenu" id="subMenu">
                </form>

                <script>

                  /**
                  * sends a request to the specified url from a form. this will change the window location.
                  * @param {string} urlMapping the path to send the post request to
                  * @param {object} params the paramiters to add to the url
                  * @param {string} [method=post] the method to use on the form
                  */

                  function mypageLoad(urlMapping, params) {
                    var form = $("<form>");
                    form.attr({
                      "method": "POST",
                      "action": urlMapping,
                    });
                    $.each(params, function (key, value) {
                      var input = $("<input>");
                      input.attr({
                        "type": "hidden",
                        "name": key,
                        "value": value,
                      });
                      form.append(input);
                    });

                    form.submit();
                  }
                </script>

              </div>
            </li>

            <% if(loginMember != null) {%>
            <li class="nav-item">
              <form action="<%=request.getContextPath() %>/logout" method="post">
                <button type="submit" class="btn btn-sm btn-outline-light mt-2 mr-1"
                  onclick="return logoutSnsAccount();">Log Out</button>
              </form>
            </li>

            <script>
              function logoutSnsAccount() {
                googleLogout();
                return true;
              }
            </script>

            <%} else{%>
            <li class="nav-item">
              <form action="<%=request.getContextPath() %>/views/member/loginView.jsp" method="post">
                <button type="submit" class="btn btn-sm btn-outline-light mt-2 mr-1">Log In</button>
              </form>
            </li>
            <li class="nav-item">
              <button class="btn btn-sm btn-outline-light mt-2"
                onclick='location.href="<%=request.getContextPath() %>/memberEnroll"'>Sign Up</button>
            </li>
            <%} %>
          </ul>
        </div>
      </div>
    </nav>
  </header>



  <div class="container-fluid">


    <!-- row h-100 mt-1 pt-2 -->
    <div class="card-deck text-center container-fluid" style="margin-top: 51px;">

      <!--상단div_1-->
      <div class="shadow-sm col-sm-3">

        <!--card / shadow-sm -->
        <div class="card-body align-left">
          <label for="firstName">From</label>
          <!--From-->
          <input type="text" class="form-control" id="datepicker_start">
          <select name="" class="custom-select d-block w-100">
            <option class="">Start Time</option>
          </select> <label for="firstName" class="mt-3">To</label>
          <!--To-->
          <input type="text" class="form-control" id="datepicker_end" size="20"> <select name=""
            class="custom-select d-block w-100">
            <option>End Time</option>
          </select> <label class="mt-3">Sort By</label> <select name="sort by" class="custom-select d-block w-100">
            <option value="Distace">Distance</option>
            <option>Price(low to high)</option>
            <option>Price(high to low)</option>
            <option>Recommended</option>
          </select> <label class="mt-3">Filter By</label> <select name="Filter By" class="custom-select d-block w-100">
            <option value="Amenities">Amenities</option>
            <option>Covered Parking</option>
            <option>Electric Vehicle Charging</option>
            <option>Free Shuttle Service</option>
            <option>In and Out Previleges</option>
            <option>On-Site Staff</option>
            <option>Open 24/7</option>
            <option>Overnight Parking</option>
            <option>Illigal Scan</option>
            <option>Valet</option>
            <option>Wheelchair Accessible</option>
          </select> <span class="mt-3 pb-5">Duration : 1D2H</span>
        </div>

        <!--하단 list-->
        <div class="card shadow-sm text-left" id="listScroll">
          <a class="list-group-item list-group-item-action">
            <span id="roadview"></span>
            <span>
              <span>Hyatt Place -
                Uncovered Self Park 110.9 miles away Hyatt Place - Uncovered
                Self Park 110.9 miles away Hyatt Place - Uncovered Self Park
                110.9 miles away
                <button>$14.70</button>
                <button>Reserve</button>
              </span>
            </span>
          </a> <a class="list-group-item list-group-item-action"> <span> <span>Hyatt Place -
                Uncovered Self Park</span> <span>110.9 miles away</span> <span><button>$14.70</button>
                <button>Reserve</button></span>
            </span>
          </a> <a class="list-group-item list-group-item-action"><span> <span>Hyatt Place -
                Uncovered Self Park</span> <span>110.9 miles away</span> <span><button>$14.70</button>
                <button>Reserve</button></span>
            </span>
          </a>



        </div>


      </div>

      <!--지도 API-->
      <div class="shadow-sm col-sm-9" id="map"></div>
      <!-- style="width:950px;height:500px;" -->
      <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42"></script>
      <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3,
            /* mapTypeId: new kakao.maps.MapTypeId(SKYVIEW) */
            // 지도의 확대 레벨
          };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl,
          kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      </script>

    </div>
  </div>
</body>





<script>


  function loadView(num) {
    var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
    var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
    var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

    var position = new kakao.maps.LatLng(37.63322721, 127.02071053);

    // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
    roadviewClient.getNearestPanoId(position, 50, function (panoId) {
      roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
    });
  }





  $("#button-addon5").click(function () {
    $.ajax({
      url: "<%=request.getContextPath()%>/ajax/searchAddr.do",
      type: "post",
      data: { addr: $("#searchAddr").val() },
      dataType: "json",
      success: function (data) {
        console.log("들어오냐?");
        console.log(data);


        for (var d in data) {
          console.log(data[d]);
          console.log(typeof data[d]);
        }
      },
      error:function(data){ // 데이터 통신에 실패한 것
    	    console.log("서버 전송 실패");   
    	}

    });

  });





  /*  $(document).ready(
     function () {
       $("#datepicker_start").datepicker(
         {
           numberOfMonths: 1,
           minDate: 0,
           onSelect: function (selected) {
             $("#datepicker_end").datepicker("option", "minDate", selected)
           }
         });
       $("#datepicker_end").datepicker(
         {
           numberOfMonths: 1,
           minDate: 0,
           onSelect: function (selected) {
             $("#datepicker_start").datepicker("option", "maxDate", selected)
           }
         });
     }); */
</script>
<!-- %@ include file="../common/footer.jsp"%-->