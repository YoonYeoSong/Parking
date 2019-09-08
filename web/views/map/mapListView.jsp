<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/views/common/header.jsp" %>
    
    
    
        <!-- overflow:auto 사용하여 list 내용이 잘릴때 스크롤 사용  -->




    <!-- <script type="text/javascript">

    $( function() {
      $( "#datepicker1" ).datepicker({minDate:0});
    } );

    $( function() {
      $( "#datepicker2" ).datepicker({minDate:0});
    } );

    ---------------------------------------------------
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script> -->


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
</style>

<body>

		<div class="">   <!-- row h-100 mt-1 pt-2 -->
  <div class="card-deck text-center">
      
    <!--상단div_1-->
    <div class="shadow-sm col-sm-3"> <!--card / shadow-sm -->
      <div class="card-body align-left">
        <label for="firstName">From</label> <!--From-->
        <input type="text" class="form-control" id="datepicker_start">
        <select name="" class="custom-select d-block w-100">
          <option class="">Start Time</option>
        </select>

        <label for="firstName" class="mt-3">To</label> <!--To-->
        <input type="text" class="form-control" id="datepicker_end">          
        <select name="" class="custom-select d-block w-100">
          <option>End Time</option>
        </select>

        <label class="mt-3">Sort By</label>
        <select name="sort by" class="custom-select d-block w-100">
          <option value="Distace">Distance</option>
          <option>Price(low to high)</option>
          <option>Price(high to low)</option>
          <option>Recommended</option>
        </select>
        
        <label class="mt-3">Filter By</label>
        <select name="Filter By" class="custom-select d-block w-100"> 
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
        </select>

        <div class="mt-3 pb-5">Duration : 1D2H</div>
        
      </div>
    </div>
    
    <!-- div class="container"-->   
  <!-- div class="card-deck text-center"-->
    

      <!--상단div_2-->
      <!--div class="shadow-sm col-sm-9 "--> <!--card / shadow-sm ml-2-->       
          <!--지도 API-->
    <div class="shadow-sm col-sm-9" id="map"></div> <!-- style="width:950px;height:500px;" -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=002ce24c1581207f304dfb0ead53db42"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
      
    </div>
  </div>
<!-- </div> -->

<!--하단 list-->
<div class="card shadow-sm text-left row">

    <a class="list-group-item list-group-item-action">
      <img src=".jpg">
        <span>
          <span>Hyatt Place - Uncovered Self Park</span>
          <span>110.9 miles away</span>
          <span>
            <button>$14.70</button>
            <button>Reserve</button>
          </span>
        </span>
    </a>       
    
    <a class="list-group-item list-group-item-action">
        <img src=".jpg">
          <span>
            <span>Hyatt Place - Uncovered Self Park</span>
            <span>110.9 miles away</span>
            <span>
              <button>$14.70</button>
              <button>Reserve</button>
            </span>
          </span>
      </a>    

      <a class="list-group-item list-group-item-action">
          <img src=".jpg">
            <span>
              <span>Hyatt Place - Uncovered Self Park</span>
              <span>110.9 miles away</span>
              <span>
                <input type="button" value="$14.70">
                <button>Reserve</button>
              </span>
            </span>
        </a>    
  </div>
 


     
    

</body>





<script>
	  $(document).ready(function(){
	    $("#datepicker_start").datepicker({
	      numberOfMonths: 1,
	      minDate:0,
	        onSelect: function(selected) {
	    $("#datepicker_end").datepicker("option","minDate", selected)
	      }
	    });
	
	  $("#datepicker_end").datepicker({
	    numberOfMonths: 1,
	    minDate:0,
	      onSelect: function(selected) {
	        $("#datepicker_start").datepicker("option","maxDate", selected)
	      }
	    });
	  });
  </script>
    <%@ include file="../common/footer.jsp" %>