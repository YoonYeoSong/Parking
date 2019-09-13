<%@page import="com.parking.api.model.vo.Parking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<% List<Parking> list = (List)request.getAttribute("list"); %>

<!-- overflow:auto 사용하여 list 내용이 잘릴때 스크롤 사용  -->

<style>
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
} /*가로 카드박스 중간 1em*/
.pl-1 {
	padding-left: 1em;
} /*가로 카드박스 중간 1em*/
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
</style>
<body>

	<div class="container-fluid">

		<!-- row h-100 mt-1 pt-2 -->
		<div class="card-deck text-center container-fluid"
			style="margin-top: 51px;">

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
					<input type="text" class="form-control" id="datepicker_end"
						size="20"> <select name=""
						class="custom-select d-block w-100">
						<option>End Time</option>
					</select> <label class="mt-3">Sort By</label> <select name="sort by"
						class="custom-select d-block w-100">
						<option value="Distace">Distance</option>
						<option>Price(low to high)</option>
						<option>Price(high to low)</option>
						<option>Recommended</option>
					</select> <label class="mt-3">Filter By</label> <select name="Filter By"
						class="custom-select d-block w-100">
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
					<a class="list-group-item list-group-item-action"> <img
						src=".jpg"> <span> <span>Hyatt Place -
								Uncovered Self Park 110.9 miles away Hyatt Place - Uncovered
								Self Park 110.9 miles away Hyatt Place - Uncovered Self Park
								110.9 miles away
								<button>$14.70</button>
								<button>Reserve</button>
						</span>
					</span>
					</a> <a class="list-group-item list-group-item-action"> <img
						src=".jpg"> <span> <span>Hyatt Place -
								Uncovered Self Park</span> <span>110.9 miles away</span> <span><button>$14.70</button>
								<button>Reserve</button></span>
					</span>
					</a> <a class="list-group-item list-group-item-action"> <img
						src=".jpg"> <span> <span>Hyatt Place -
								Uncovered Self Park</span> <span>110.9 miles away</span> <span><button>$14.70</button>
								<button>Reserve</button></span>
					</span>
					</a>



				</div>


			</div>

			<style>
.style_width {
	width: 100%;
}
</style>



			<!--지도 API-->
			<div class="shadow-sm col-sm-9" id="map"></div>
			<!-- style="width:950px;height:500px;" -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42"></script>
			<script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
               center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
               level : 3,
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
   $(document).ready(
      function() {
         $("#datepicker_start").datepicker(
            {
               numberOfMonths : 1,
               minDate : 0,
               onSelect : function(selected) {
                  $("#datepicker_end").datepicker("option", "minDate", selected)
               }
            });
         $("#datepicker_end").datepicker(
            {
               numberOfMonths : 1,
               minDate : 0,
               onSelect : function(selected) {
                  $("#datepicker_start").datepicker("option", "maxDate", selected)
               }
            });
         });
</script>
<!-- %@ include file="../common/footer.jsp"%-->


