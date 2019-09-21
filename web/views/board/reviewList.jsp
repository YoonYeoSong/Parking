<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.parking.board.model.vo.Review" %>

<%
  List<Review> list = (ArrayList<Review>)request.getAttribute("reviewlist");
  String pageBar = (String)request.getAttribute("pageBar");
  int cPage = (Integer)request.getAttribute("cPage");
%>

<%@ include file="/views/common/mypageHeader.jsp" %>

  <section class="py-4 subMenu-container">
    <div class="card card-fluid">

      <h6 class="card-header">
        <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
          <!-- <img class="mr-3" src="" alt="" width="48" height="48"> -->
          <!-- <img src="<%=request.getContextPath() %>/images/qna.png" class="mr-3" width="60px"> -->
          <i class="fa fa-edit text-white mr-3 my-2" style="font-size:42px;"></i>
          <div class="lh-100 ml-2">
            <p class="h5 mb-0 text-white lh-100">&nbsp;&nbsp;Review</p>
            <small>Since 2019.09</small>
          </div>
        </div>
      </h6>

      <div class="card-body">
        <!-- .media -->
        <div class="media mb-2">
          <!-- <div class="user-avatar user-avatar-xl fileinput-button">
            <div class="fileinput-button-label">Change photo</div>
            <img src="<%=request.getContextPath() %>/images/profile.png" alt="User Avatar">
            <input id="fileupload-avatar" type="file" name="avatar"> </div> -->
          <!-- .media-body -->
          <div class="media-body pl-3 my-0 py-0">
            <h3 class="card-title">Review list</h3>
            <h6 class="card-subtitle text-muted">Reviews by <b><%=loginMember.getUserName() %></b></h6>
            <p class="card-text">
              <small>You have visited <b id="parkingNum"></b>&nbsp; parking lots.</small>
            </p>
          </div>
          <div class="row d-flex mt-5">
            <% if(loginMember != null){ %>
              <input type="button" value="write" class= "btn btn-sm btn-outline-primary mr-4 mb-1" id="write-add" onclick="">
            <%} %>
          </div>
          <!-- /.media-body -->
        </div>
        <!-- /.media -->
        <!-- form -->
        <table class="table table-sm" id='qna_table'>
          <thead>
            <tr>
              <th class="text-center">NO.</th>
              <th class="text-center">Author</th>
              <th class="text-center">Title</th>
              <th class="text-center">Content</th>
              <th class="text-center">Picture</th>
              <th class="text-center">Rating</th>
            </tr>
          </thead>
          <tbody>
            <% for(Review r : list){ %>
            <tr>
              <td><%=r.getReviewNo() %> </td>
              <td>
                <div class="media text-muted pt-3">
                  <svg class="bd-placeholder-img mr-2 rounded " width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32">
                    <title>Placeholder</title><rect width="100%" height="100%" fill="#132535" class="bg-secondary"></rect>
                    <text x="50%" y="50%" fill="#132535" dy=".3em">32x32</text>
                  </svg>
                  <!-- <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray"> -->
                  <p class="media-body pb-4 mb-0 small lh-125">
                    <strong class="d-block text-gray-dark"><%=loginMember.getUserName() %></strong>
                  </p>
                </div>
              </td>
              <td>
                <a href="<%=request.getContextPath() %>/board/reviewContentView?no=<%=r.getReviewNo() %>">
                  <%=r.getReviewTitle() %>
                </a>
              </td>
              <td>
                  <%= r.getReviewContent().substring(0, java.lang.Math.min(100,r.getReviewContent().length())) %>
                </a>
              </td>
              <td>
                <%-- <% if(r.getReviewOriginalFile() != null){ %>
                  <img src="<%=request.getContextPath() %>/images/file.png" width="16px">
                <% } %> --%>
              </td>
              <td><%=r.getReviewRating() %></td>
    
            </tr>
            <% } %>
          </tbody>
        </table>
        <script>
          function getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++) {
              color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
          }

        </script>

        <small class="d-block text-right mt-3"><a href="#">All updates</a></small>

        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <%=pageBar %>
          </ul>
        </nav>
          <!-- <a class="dropdown-item" href="javascript:;" onclick="ajaxRequestPage();"><i class="fa fa-question-circle-o">&nbsp;&nbsp;</i>Q&A Board</a> -->
        <script>
          function ajaxRequestPage(pageNo){
            var url = "<%=request.getContextPath() %>/board/reviewList";
            $.ajax({
              type: "POST",
              url: url,
              dataType: "html",
              data: {cPage: pageNo},
              success: function(data){
                html = $('<div>').html(data);
                console.log(html.find('div#review-container'));
                // var tag = $("<h3>").html(data).css("color", "blue");
                // $('#content').append(tag);
                // $('#qna_table tbody')
                  // location.href="<%=request.getContextPath() %>/board/qnaBoardList?cPage=" + pageNo;

                $('main#review-main').html(html.find('div#review-container'));
              },
              error: function(request, status, error){
                console.log("error 함수 실행!");
                console.log(request);
                console.log(status);
                console.log(error);
              },
            });
          }

          $(function(){
            $('#listScroll').show();
            $('#listScrollTitle').show();
            $('#listScrollTitle').html('<i class="fa fa-history"></i>&nbsp;&nbsp;My History');

            loadParkingList("userHistoryParkingList");
          });

          function loadParkingList(mapping){
            $.ajax({
              url: "<%=request.getContextPath()%>/history/" + mapping,
              type: "POST",
              data: { "userCode": "<%=loginMember.getUserCode()%>" },
              dataType: "JSON",
              success: function (data) {
                var listScroll = $("#listScroll");

                if(listScroll != null)
                  listScroll.empty();

                $('#parkingNum').html(Object.keys(data).length);

                // marker : bookmarked locations
                var positions = [];

                for(var d in data) {

                  var aTag = $("<a class='list-group-item list-group-item-action'>");
                  if(mapping == "userHistoryParkingList"){
                  }
                  if(mapping == "userHistoryList"){
                  }
                  var span0 = $("<span id="+d+">");
                  var span1 = $("<span id='pName'>").html((Number(d)+1)+". "+data[d]["parkingName"]+"<br>");
                  var span2 = $("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;Addr. : "+data[d]["addr"]+"<br>");
                  var span3 = $("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;Parking Code : "+data[d]["parkingCode"]+"<br>");
                  var span4 = $("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;LAT. : "+data[d]["latitude"]+"<br>");
                  var span5 = $("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;LNG. : "+data[d]["longitude"]+"<br>");
                  var div = $("<div class='mt-2'>");
                  // var btnStr = "<button class='btn btn-sm btn-outline-info mr-1' "
                  //                       // + "data-toggle='modal' "
                  //                       // + "data-target='#myModal' "
                  //                       + "onclick='parkingListPopup();' "
                  //                       + ">More Info</button>";
                  var btnStr = "<button class='btn btn-sm btn-outline-info mr-1' "
                                        + "id='parking" + d + "'>"
                                        + "Details</button>";
                  var infoBtn = $(btnStr);
                  var input = $("<input type='button' class='btn btn-sm btn-outline-info pay'"
                                + "onclick='reviewWrite(" + data[d]["parkingCode"]+ ")' value='Review'>");
                  div.append(infoBtn).append(input);
                  span0.append(span1).append(span2).append(span3).append(span4).append(span5).append(div);
                  aTag.append(span0);

                  listScroll.append(aTag);	

                  //Marker : ParkingList
                  var lat = data[d]["latitude"];
                  var lng = data[d]["longitude"];

                  positions.push({title: data[d]["parkingName"], latlng: new kakao.maps.LatLng(lat, lng)});
                }

                if(localStorage.hasOwnProperty("positions"))
                  localStorage.removeItem("positions");

                localStorage.setItem("positions", positions);

                if(data.length ==0){
                  listScroll.append("<div class='card card-text text-center' style='height:70px;'><br>"
                    + "No Reviews from you!<br></div>");
                }

              },
              error: function (data) { // 데이터 통신에 실패
                console.log("서버 전송 실패");
              }
            });
          }

          function reviewWrite(parkingCode){
            var url = "<%=request.getContextPath() %>/board/reviewWrite";
            $.ajax({
              type: "POST",
              url: url,
              dataType: "html",
              data: {userCode: "<%=loginMember.getUserCode() %>",
                     parkingCode: parkingCode},
              success: function(data){
                html = $('<div>').html(data);

                $('div#mypage-container').html(html.find('section.subMenu-container'));
              },
              error: function(request, status, error){
                console.log("error 함수 실행!");
                console.log(request);
                console.log(status);
                console.log(error);
              },
            });
          }

        </script>


        <!-- Review List container-->
        <!-- <div class="container review-container" id="" style="height: 500px">
        </div> -->
      </div>
    </div>
  </section>

<%@ include file="/views/common/mypageFooter.jsp" %>