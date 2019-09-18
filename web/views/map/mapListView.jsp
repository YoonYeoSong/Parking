<%@page import="com.parking.api.model.vo.Parking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.parking.member.model.vo.Member"%>
<%@ page import="com.parking.board.model.vo.QnaBoard"%>

<%-- <%@ include file="/views/common/header.jsp"%> --%>

<% /* List<Parking> list = (List)request.getAttribute("list"); */
	String search = (String)request.getAttribute("search");
	Object[] obj = null;
%>
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
  <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42"></script>
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
  
  	
  
  	
  	$(function(){
  		<%if(search != null){%>
		{
		      $.ajax({
		      url: "<%=request.getContextPath()%>/ajax/searchAddr.do",
		      type: "post",
		      data: { addr: "<%=search%>" },
		      dataType: "json",
		      success: function (data) {
		    	
		        console.log("들어오냐?");
		        console.log(data);
		
		        /*    for(var d in data) {
		            console.log(data[d]);
		                  
		            console.log(typeof data[d]);
		          }  */
		        navigator.geolocation.getCurrentPosition(function (pos) {
		          //latitude = pos.coords.latitude;
				  //longitude = pos.coords.longitude;
						$('#listScroll').empty();

				      parkingList(data);
		          parkingMarker(data, pos);
		          // console.log("위도 : " + latitude);
		          //console.log("경도 : " + longitude);
		        });
		      },
		      error: function (data) { // 데이터 통신에 실패한 것
		        console.log("서버 전송 실패");
		      }
		
		    });
		
		}
		<%}else{%>
			return;
		<%}%>
  		
  	});
  	
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
  <%for(int i = 1; i < 1000; i++){%>
    object#daum\:roadview\:<%=i%>
    {
      position: relative !important;
    }
	<%}%>
		
	
    #mapbtn{
      z-index: 2;
      position: absolute;
      left: 0px;
      border-radius: 3px;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px;
    }
    #loadviewbtn{
      z-index: 2;
      position: absolute;
      left: 0px;
      border-radius: 3px;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px;
    }
    #realLocBtn{
      z-index: 2;
      position: absolute;
      left: 70px;
      border-radius: 3px;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px;
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
        <form id="nav-searchbar" action="./" method="post" class="navbar-form mb-0" style="width: 410px">
          <div class="input-group">
            <input type="search" placeholder="Where do you need parking?" aria-describedby="button-addon5"
              class="form-control" name="search" id="searchAddr">
            <input type="hidden" name="searchCopy" id="searchCopy" >
            <div class="input-group-append">
              <button type="button" id="button-addon5" class="btn btn-primary">
                <i class="fa fa-search"></i>
              </button>
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

            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle menu-item mt-1 mr-0 text-white" href="#"
                id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
                  class="fa fa-globe"></i></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <div id="google_translate_element" class="dropdown-item fa fa-globe"></div>
              </div>
            </li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle menu-item mr-0 text-white" href="#"
                id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Help</a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/helpView.jsp"><i
                    class="fa fa-info-circle">&nbsp;&nbsp;</i>Help</a> <a class="dropdown-item"
                  href="<%=request.getContextPath() %>/board/qnaBoardList"><i
                    class="fa fa-question-circle-o">&nbsp;&nbsp;</i>Q&amp;A Board</a>
              </div>
            </li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle menu-item mr-2 text-white" href="#"
                id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=dropdownTxt %></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">

              <% if(loginMember == null) { %>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-cog">&nbsp;&nbsp;</i>Account Settings</a>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-bookmark">&nbsp;&nbsp;</i>Bookmark</a>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-edit">&nbsp;&nbsp;</i>My Reviews</a>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-calendar">&nbsp;&nbsp;</i>My Reservations</a>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-credit-card">&nbsp;&nbsp;</i>Payment Methods</a>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-won">&nbsp;&nbsp;</i>Credit Balance</a>
              <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-car">&nbsp;&nbsp;</i>My Vehicle</a>

              <% } else { %>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/member/memberView.jsp"><i class="fa fa-cog">&nbsp;&nbsp;</i>Settings</a>
                <a class="dropdown-item" href="<%=request.getContextPath() %>/views/bookmark/bookmarkView.jsp"><i class="fa fa-bookmark">&nbsp;&nbsp;</i>Bookmark</a>

                <% if(loginMember != null && loginMember.getUserEmail().equals("admin@com")) { %>
                  <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-list">&nbsp;&nbsp;</i>Member List</a>

                <%}else if(loginMember != null && !loginMember.getUserEmail().equals("admin@com")) { %>
                  <a class="dropdown-item" href="<%=request.getContextPath() %>/views/board/review.jsp"><i class="fa fa-edit">&nbsp;&nbsp;</i>My Reviews</a>
                  <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-calendar">&nbsp;&nbsp;</i>My Reservations</a>
                  <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-credit-card">&nbsp;&nbsp;</i>Payment Methods</a>
                  <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-won">&nbsp;&nbsp;</i>Credit Balance</a>
                  <a class="dropdown-item" href="<%=mypageUrl %>"><i class="fa fa-car">&nbsp;&nbsp;</i>My Vehicle</a>
                <% } %>
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
              <form action="<%=request.getContextPath() %>/logout" method="post" class="mb-0">
                <button type="submit" class="btn btn-sm btn-outline-light mt-1 mr-1"
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
              <form action="<%=request.getContextPath() %>/views/member/loginView.jsp" method="post" class="mb-0">
                <button type="submit" class="btn btn-sm btn-outline-light mt-1 mr-1">Log In</button>
              </form>
            </li>
            <li class="nav-item">
              <button class="btn btn-sm btn-outline-light mt-1"
                onclick='location.href="<%=request.getContextPath() %>/memberEnroll"'>Sign
                Up</button>
            </li>
            <%} %>
          </ul>
        </div>
      </div>
    </nav>
  </header>



  <div class="container-fluid">


    <!-- row h-100 mt-1 pt-2 -->
    <div class="card-deck text-center container-fluid" style="margin-top: 51px;" id="cardmap">

      <!--상단div_1-->
      <div class="shadow-sm col-sm-4">

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
        <div class="card shadow-sm text-left" id="listScroll" style="height:300px">
          
          <!--
          <a class="list-group-item list-group-item-action">
            </span>
          </a> 
          <a class="list-group-item list-group-item-action"> 
            <span>
              <span>Hyatt Place - Uncovered Self Park</span>
               <span>110.9miles away</span>
                <span>
                    <input type="button" class="btn btn-info more-info" onclick="parkingInfoPopup()" value="More Info">    
                    <input type="button" class="btn btn-info more-info" onclick="" value="Pay">           
              </span>
            </span>
          </a> 
          <a class="list-group-item list-group-item-action"><span>
              <span>Hyatt Place - Uncovered Self Park</span> <span>110.9
                miles away</span> <span><button>$14.70</button>
                <button>Reserve</button></span>
            </span> </a>
            -->
		</div>
		<script>
			$('#listScroll').click(function(e){
				console.log($(e.target).children().first().attr('id'));
				var idValue = $(e.target).children().first().attr('id');       
				var data = JSON.parse(localStorage.getItem("parkingList"));
				console.log(data);
				for(var d in data)
				{
					
					if(d == idValue)
					{
						if($("#loadview").css("display") != 'none')
						{
							loadView(data[d]["latitude"],data[d]["hardness"],data[idValue]["hardness"]);
							idValue = window.localStorage.setItem("selectNum", idValue);
						}else{
							
							window.localStorage.setItem("selectNum", idValue);
							mapCopy.setCenter(new kakao.maps.LatLng(data[idValue]["latitude"], data[idValue]["hardness"]));			
							mapCopy.setLevel(2);
						}
            //window.localStorage.setItem("realLat",JSON.data[idValue]["latitude"]);
            //window.localStorage.setItem("realLon",data[idValue]["hardness"]);
            //window.localStorage.setItem("pName",data[d]["parkingName"]);
						//loadView(data[idValue]["latitude"],data[idValue]["hardness"],data[d]["parkingName"]);	
					}
				}
			
			});
			
			
			
			function loadView(lat,lon,pName)
			{
				var load = $("#loadview");
				//var roadview = $("#loadview");
				//var placePosition = mapCopy.setCenter(new kakao.maps.LatLng(lat, lon));			
				//mapCopy.setLevel(2);
				
				if($("#loadview") != null)
				{
					$("#loadview").empty();
				}
				
        		mapTaginit(2);
								
				var roadviewContainer = document.getElementById('loadview'); //로드뷰를 표시할 div
				var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
				var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

				var position = new kakao.maps.LatLng(lat, lon);

				// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
					roadviewClient.getNearestPanoId(position, 800, function(panoId) {
					roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
				});
				
			}

      function realLocClick()
      {
        navigator.geolocation.getCurrentPosition(function (pos) {
            mapCopy.setCenter(new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude));			
            mapCopy.setLevel(2);
            });
            //$("#loadviewbtn").attr("disabled","false");
      }

      function loadviewClick()
      {   
				var idValue = localStorage.getItem("selectNum");     
				console.log("id value : " + idValue);
				var data = JSON.parse(localStorage.getItem("parkingList"));
				for(var d in data)
				{
					if(d == Number(idValue))
					{
            //window.localStorage.setItem("realLat",JSON.data[idValue]["latitude"]);
            //window.localStorage.setItem("realLon",data[idValue]["hardness"]);
            //window.localStorage.setItem("pName",data[d]["parkingName"]);
            loadView(data[d]["latitude"], data[d]["hardness"], data[d]["parkingName"]);
            idValue = window.localStorage.setItem("selectNum", idValue);
					}
				}
				
				
      }

      function mapClick()
      {
        var idValue = localStorage.getItem("selectNum");     
				var data = JSON.parse(localStorage.getItem("parkingList"));

				for(var d in data)
				{
					if(d == Number(idValue))
					{
            //window.localStorage.setItem("realLat",JSON.data[idValue]["latitude"]);
            //window.localStorage.setItem("realLon",data[idValue]["hardness"]);
            //window.localStorage.setItem("pName",data[d]["parkingName"]);
            window.localStorage.setItem("selectNum", idValue);
            mapCopy.setCenter(new kakao.maps.LatLng(data[idValue]["latitude"], data[idValue]["hardness"]));			
				    mapCopy.setLevel(2);
           
					}
				}
        mapTaginit(1);
      }

	
			
			
		</script>


      </div>

      <!--지도 API-->
	  <div class="shadow-sm col-sm-8" id="map">
      
    </div>
    <div class="shadow-sm col-sm-8" id="loadview">
      
      </div>
      <!-- style="width:950px;height:500px;" -->
      <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42"></script>

    </div>
  </div>
</body>


<style>

</style>


<script>

  $("#button-addon5").click(function () {
    $.ajax({
      url: "<%=request.getContextPath()%>/ajax/searchAddr.do",
      type: "post",
      data: { addr: $("#searchAddr").val() },
      dataType: "json",
      success: function (data) {
        console.log("들어오냐?");
        console.log(data);

        /*    for(var d in data) {
            console.log(data[d]);
                  
            console.log(typeof data[d]);
          }  */

        navigator.geolocation.getCurrentPosition(function (pos) {
          //latitude = pos.coords.latitude;
          //longitude = pos.coords.longitude;

          $('#listScroll').empty();
          parkingList(data);
          //주차장 마커찍기
          parkingMarker(data, pos);
         
        });
      },
      error: function (data) { // 데이터 통신에 실패한 것
        console.log("서버 전송 실패");
      }

    });
    // return false;
  });

  
  // 1-현재 위치 or 지도,
  // 2-로드뷰
  function mapTaginit(num)
  {
    var rbtn = $("#realLocBtn").length;
    var mbtn = $("#mapbtn").length;
    var lVbtn = $("#loadviewbtn").length;

    console.log("rbtn :" +rbtn);
		console.log("lVbtn :" +lVbtn);
		console.log("mbtn :" +mbtn);
		
		// map 이 위로 올라오고 현위치버튼 로드뷰 버튼이 위로 올라온다
    if(rbtn == 0 && num == 1)
    {
      rbtn = null;
      rbtn = $("<input type='button' id='realLocBtn' value='현위치' onclick='realLocClick()'>"); //현위치 버튼
      $("#map").append(rbtn);
      console.log("여기왔음");

      lVbtn = null;
      lVbtn = $("<input type='button' id='loadviewbtn' value='로드뷰' onclick='loadviewClick()'>"); // 로드뷰 버튼
			$("#map").append(lVbtn);
	
			$("#loadview").hide();
			
    }else if(rbtn == 1 && num == 1)
		{		
			$("#loadview").hide();
			$("#map").show();
		}
		
    if(num == 2)
    {
    	mbtn = null;
      mbtn = $("<input type='button' id='mapbtn' value='지도' onclick='mapClick()'>"); // 지도 버튼
			console.log("여기왔음");
			$("#loadview").append(mbtn);
			$("#loadview").show();
			$("#map").hide();  
			
				// /$('#search\\_form\\:expression')
				//var obj = $("#loadview").find($("#daum\\:roadview\\:2"));
				//console.log("obj:"+obj);
				//$("object[id^='daum\\:roadview\\:^\d+$']")
				//var name = $("div[id*='daum\\:roadview\\:']").attr("id");
				//var name = document.childNodes;
				
				//var name = $("#loadview")['prevObject'].find("object[id^='daum\\:roadview\\:^\d+$']").attr("id");
			//	console.log(name);
				// for(var i = 0; i < name.prevObject.length(); i++)
				// {
				// 	console.log(name.prevObject[i].children[i]);				
				// }
				// for(var i = 0; i < name.length; i++)
				// {
				// 	 console.log(i+"번째 : "+ name[i].);
				// }
				// console.log(name);
				// if($("#daum\\:roadview\\:2").length)
				// {
				// 	console.log("찾음");
				// 	//obj = null;
				// 	$("#daum\\:roadview\\:2").attr("daum\\:roadview\\:1");
				// }
        		//$("#loadviewbtn").attr("disabled","disabled");
			
    }
		
  }

  function parkingMarker(data, pos) {
    //테스트 자신의 위치 자겨오기
 	
    var obj = data;
    if($("#map") != null)
    {
    	$("#map").empty();
    }
    //1-현위치버튼,2-지도,3-로드뷰
    mapTaginit(1);
    //window.localStorage.setItem("realLat",pos.coords.latitude);
    //window.localStorage.setItem("realLon",pos.coords.longitude);
    //window.localStorage.setItem("pName","현재 내 위치");
    var mapContainer = document.getElementById('map'),
    //var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
        center: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude), // 지도의 중심좌표
        level: 3,
        /* mapTypeId: new kakao.maps.MapTypeId(SKYVIEW) */
        // 지도의 확대 레벨
      };
	  mapCopy = null;
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	  mapCopy = map;
    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl,
      kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
 
	var realLoc = [];
	var realiwContens=[];
    var positions = [];
	var iwContents = [];
	
	positions.push({
		title: "나",
		latlng: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
		//clickable:true
	});
	
	iwContents.push({
		iwContent : '<div style="padding:2px;">'+"현재 내 위치"+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	// iwPosition : new kakao.maps.LatLng(data[d]['latitude'], data[d]['hardness']), //인포윈도우 표시 위치입니다
		iwRemoveable : true // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	});		
	
    for (var d in data) {
			positions.push({
				title: data[d]['parkingName'],
				latlng: new kakao.maps.LatLng(data[d]['latitude'], data[d]['hardness']),
				//clickable:true
			});
				
			iwContents.push({
				iwContent : '<div style="padding:2px;">'+data[d]['parkingName']+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			// iwPosition : new kakao.maps.LatLng(data[d]['latitude'], data[d]['hardness']), //인포윈도우 표시 위치입니다
				iwRemoveable : true // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			});		  
	}
    
  /*   var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다 */

    for (var i in data) {
      console.log(data[d]);
    }

    // 마커를 표시할 위치와 title 객체 배열입니다 
    /*  var positions = [
       {
         title: '카카오',
         latlng: new kakao.maps.LatLng(33.450705, 126.570677)
       },
       {
         title: '생태연못',
         latlng: new kakao.maps.LatLng(33.450936, 126.569477)
       },
       {
         title: '텃밭',
         latlng: new kakao.maps.LatLng(33.450879, 126.569940)
       },
       {
         title: '근린공원',
         latlng: new kakao.maps.LatLng(33.451393, 126.570738)
       }
     ]; */

    // 마커 이미지의 이미지 주소입니다
    //var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (var i = 0; i < positions.length; i++) {

      // 마커 이미지의 이미지 크기 입니다
      //var imageSize = new kakao.maps.Size(24, 35);

      // 마커 이미지를 생성합니다    
      //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        //image: markerImage // 마커 이미지 
      });
      marker.setClickable(true);
      //marker.setMap(map);
      
      // 인포윈도우를 생성하고 지도에 표시합니다
    /*   var infowindow = new kakao.maps.InfoWindow({
          //map: map, // 인포윈도우가 표시될 지도
          position : iwContents[i].iwPosition, 
          content : iwContents[i].iwContent,
          removable : iwContents[i].iwRemoveable
      }); */
      
      	var infowindow  = new kakao.maps.InfoWindow({
    	    content: iwContents[i].iwContent, // 인포윈도우 내부에 들어갈 컨텐츠 입니다.
    	    removable : iwContents[i].iwRemoveable
      });
      
      if(marker.getTitle() == "나")
      {
      infowindow.open(map,marker);
      }
        
        kakao.maps.event.addListener(marker,'click',makeOverListener(map, marker, infowindow));
        //kakao.maps.event.addListener(marker,'click',makeOutListener(infowindow));     
        //infowindow.open(map, marker); // 지도에 올리면서, 두번째 인자로 들어간 마커 위에 올라가도록 설정합니다.
      }
      //var togglebtn = $("<input id='mapbtn' type='button' value='현위치'>");
      //var togglebtn = $("<input id='mapbtn' type='button' value='현위치'>");
      //var togglebtn = $("<input id='mapbtn' type='button' value='현위치'>");
      //$("#map").append(togglebtn);
      //$("#map").append(togglebtn);
      //$("#map").append(togglebtn);



  }
  
  function makeOverListener(map,marker,infowindow)
  {
    return function(){
      console.log(marker.getTitle());
      infowindow.open(map,marker);
    };
  }

  function makeOutListener(infowindow)
  {
    return function(){
      infowindow.close();
    };
  }
  
  function parkingList(data)
  {
    window.localStorage.setItem("parkingList",JSON.stringify(data));
    for(var d in data)
    {
      var listScroll = $("#listScroll");
      var aTag = $("<a class='list-group-item list-group-item-action'>");
      var span0 = $("<span id="+d+">");
      var span1 = $("<span>").html(data[d]["parkingName"]+"<br>");
      var span2 = $("<span>").html(data[d]["addr"]+"<br>");
      var div = $("<div class='mt-2'>");
      // var btnStr = "<button class='btn btn-sm btn-outline-info mr-1' "
      //                       // + "data-toggle='modal' "
      //                       // + "data-target='#myModal' "
      //                       + "onclick='parkingListPopup();' "
      //                       + ">More Info</button>";
      var btnStr = "<button class='btn btn-sm btn-outline-info mr-1' "
                            + "id='parking" + d + "'>"
                            + "More Info</button>";
      var infoBtn = $(btnStr);
      var input2 = $("<input type='button' class='btn btn-sm btn-outline-info pay' onclick='payment()' value='Pay'>");
      div.append(infoBtn).append(input2);
      span0.append(span1).append(span2).append(div);
      aTag.append(span0);
      listScroll.append(aTag);	

    }
    // + "onclick='parkingListPopup();' "
    $(function(){
      var data = JSON.parse(window.localStorage.getItem('parkingList'));

      /* read  */
      $.each(data, function(d, item) {
        // console.log(item);
        $('#parking' + d).click(function(){
          var parkingName = data[d]["parkingName"];
          var addr = data[d]["addr"];
          var operationRuleNm = data[d]["operationRuleNm"];
          var parkingTypeNm = data[d]["parkingTypeNm"];
          var tel = data[d]["tel"];
          var capacity = data[d]["capacity"];
          var curParking = data[d]["curParking"];
          var latitude = data[d]["latitude"];
          var longitude = data[d]["hardness"];
          var parkingCode = data[d]["parkingCode"];
          console.log(parkingName);

          // $.ajax({
          //   url: "<%=request.getContextPath()%>/bookmark/checkBookmarkSaved",
          //   type: "POST",
          //   data: { "userCode": "<%=loginMember.getUserCode()%>",
          //           "parkingCode": parkingCode },
          //   dataType: "JSON",
          //   success: function (data) {
          //     console.log("bookmark들어오냐?");
          //     console.log(data);
          //   },
          //   error: function(data){ //데이터 통신에 실패
          //     console.log("Bookmark retrieval Failed!");
          //   }

          // });

          $('#myModal').modal('show');

          $('#modalLabelParkingName').html(parkingName);
          $('#parkingName').html(parkingName);
          $('#addr').html(addr);
          $('#operationRuleNm').html(operationRuleNm);
          $('#parkingTypeNm').html(parkingTypeNm);
          $('#tel').html(tel);
          $('#capacity').html(capacity);
          $('#curParking').html(curParking);
          listPopRoadView(latitude,longitude); // 팝업로드뷰 생성

        });
        // alert(data[i]);
      });
    });
                  /*
                  <div class="card shadow-sm text-left" id="listScroll">
                    <a class="list-group-item list-group-item-action"> 
                          <span>
                            <span>Hyatt Place - Uncovered Self Park</span>
                            <span>110.9miles away</span>
                              <span>
                                  <input type="button" class="btn btn-info more-info" onclick="parkingInfoPopup()" value="More Info">    
                                  <input type="button" class="btn btn-info more-info" onclick="" value="Pay">           
                            </span>
                          </span>
                        </a> 
                  */
  }

  //팝업 로드뷰생성
  function listPopRoadView(lat, lon)
  {							
				var roadviewContainer = document.getElementById('popRoadView'); //로드뷰를 표시할 div
				var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
				var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

				var position = new kakao.maps.LatLng(lat, lon);

				// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
					roadviewClient.getNearestPanoId(position, 800, function(panoId) {
					roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
				});
  }





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


<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="modalLabelParkingName" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title ml-auto" id="modalLabelParkingName"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="card mb-4 rounded">
          <div class="social-card-header align-middle text-center bg-light rounded border"
               style="height:400px;" id="popRoadView">
              <!-- <img class="mr-3" src="" alt="" width="48" height="48"> -->
              <!-- <img src="<%=request.getContextPath() %>/images/qna.png" class="mr-3" width="60px"> -->
              <!-- <div class="lh-100">
                <p class="h5 mb-0 text-white lh-100">&nbsp;</p>
                 <small>Since 2019.09</small> 
              </div> -->
          </div>
          <div class="card-body text-center">
            <div class="row">
              <div class="col border-right">
                <span class="text-muted"><a href="javascript:;" id="bookmarkToggleBtn">
                  <i class="fa fa-star-o text-twitter" id="bookmarkIcon">&nbsp;&nbsp;</i>Bookmark</a></span>
                <div class="font-weight-bold"></div>
                <script>

                  $(function(){
                    $('#bookmarkToggleBtn').click(function(){
                      if($('i#bookmarkIcon').hasClass("fa-star")){
                        $('i#bookmarkIcon').removeClass("fa-star").addClass("fa-star-o");
                      }
                      else if($('i#bookmarkIcon').hasClass("fa-star-o")){
                        $('i#bookmarkIcon').removeClass("fa-star-o").addClass("fa-star");
                      }
                    });
                  });
                </script>

              </div>
              <div class="col">
                <span class="text-muted"><a href="#"><i class="fa fa-edit text-twitter">&nbsp;&nbsp;</i>Review</a></span>
                <div class="font-weight-bold">1K</div>
              </div>
            </div>
          </div>
        </div>
        <div class="card mb-4 rounded">
          <div class="card-body">
            <!-- <h3 class="mr-auto text-center my-4">Information</h3> -->

            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-map-signs">&nbsp;&nbsp;</i>Parking lot Name</div>
              <div class="col-md-8" id="parkingName"><i class=""></i></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-map-marker">&nbsp;&nbsp;</i>Address</div>
              <div class="col-md-8" id="addr"></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-hourglass">&nbsp;&nbsp;</i>Operation Time</div>
              <div class="col-md-8" id="operationTime"></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-info-circle">&nbsp;&nbsp;</i>Operation Rule Name</div>
              <div class="col-md-8" id="operationRuleNm"></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-exclamation-triangle">&nbsp;&nbsp;</i>Parking Type Name</div>
              <div class="col-md-8" id="parkingTypeNm"></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-globe">&nbsp;&nbsp;</i>Web Link</div>
              <div class="col-md-8 "><a href="#">https://example.com</a></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-car">&nbsp;&nbsp;</i>Capacity</div>
              <div class="col-md-8" id="capacity"></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-car">&nbsp;&nbsp;</i>Current Parking</div>
              <div class="col-md-8" id="curParking"></div>
            </div>
            <div class="row my-2">
              <div class="col-md-4 border-right"><i class="fa fa-phone">&nbsp;&nbsp;</i>Tel</div>
              <div class="col-md-8" id="tel"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

  <script>
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })
</script>
<!-- %@ include file="../common/footer.jsp"%-->