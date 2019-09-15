<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.parking.member.model.vo.Member" %>

<%@ include file="/views/common/mypageHeader.jsp" %>

  <section class="py-4 subMenu-container">
    <div class="card card-fluid">
      <h6 class="card-header">Bookmark</h6>
      <!-- .card-body -->
      <div class="card-body">
        <!-- .media -->
        <div class="media mb-3">
          <!-- <div class="user-avatar user-avatar-xl fileinput-button">
            <div class="fileinput-button-label">Change photo</div>
            <img src="<%=request.getContextPath() %>/images/profile.png" alt="User Avatar">
            <input id="fileupload-avatar" type="file" name="avatar"> </div> -->
          <!-- .media-body -->
          <div class="media-body pl-3">
            <h3 class="card-title">Bookmark list</h3>
            <h6 class="card-subtitle text-muted">Saved Parking locations</h6>
            <p class="card-text">
              <small>You have saved 9999 parking spaces.</small>
            </p>
            <!-- The avatar upload progress bar -->
            <div id="progress-avatar" class="progress progress-xs fade">
              <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <!-- /avatar upload progress bar -->
          </div>
          <!-- /.media-body -->
        </div>
        <!-- /.media -->
        <!-- form -->



        <!-- 카카오 Map API -->
        <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42"></script>
        
        <!-- 카카오 Map 라이브러리 : services, clusterer, drawing -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42&libraries=services,clusterer,drawing"></script>

        <!-- Map -->
        <div class="container ml-3">

          <button class="btn btn-outline-primary" onclick="loadKakaoMap()"><i class="fa fa-map-marker">&nbsp;&nbsp;</i>refresh</button>
          <div id="map" class="shadow-sm row " style="width:100%;height:400px;"></div>
        </div>

        <!-- manipulate data -->
        <script>
          $(function(){
            loadKakaoMap();
          });

          /* Show Kakao Map */
          function loadKakaoMap(){
            var mapContainer = document.getElementById('map'); // 지도를 표시할 container
            var mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
  
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성
  
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
            var mapTypeControl = new kakao.maps.MapTypeControl();
            // 지도 타입 컨트롤을 지도에 표시
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);


            /* get Info */
            // 지도의 현재 중심좌표를 얻어옵니다 
            var center = map.getCenter(); 
            
            // 지도의 현재 레벨을 얻어옵니다
            var level = map.getLevel();
            
            // 지도타입을 얻어옵니다
            var mapTypeId = map.getMapTypeId(); 
            
            // 지도의 현재 영역을 얻어옵니다 
            var bounds = map.getBounds();
            
            // 영역의 남서쪽 좌표를 얻어옵니다 
            var swLatLng = bounds.getSouthWest(); 
            
            // 영역의 북동쪽 좌표를 얻어옵니다 
            var neLatLng = bounds.getNorthEast(); 
            
            // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
            var boundsStr = bounds.toString();
  
            var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
            message += '경도 ' + center.getLng() + ' 이고 <br>';
            message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
            message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
            message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
            message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
            
            // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
            console.log(message);
          }

        </script>
            
      </div>
      <!-- /.card-body -->
    </div>

  </section>

<%@ include file="/views/common/mypageFooter.jsp" %>