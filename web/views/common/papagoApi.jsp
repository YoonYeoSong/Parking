<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="parking web application">
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id" content="847270498494-dj5o04t83q5uja6ccp6eekr3en7qcb8p.apps.googleusercontent.com">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <title>Locate Parking Spaces</title>

  <!-- favicon -->
  <link rel="icon" href="https://img.icons8.com/ios/50/000000/parking.png?v=1.1">

  <!-- CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  
  <!-- JQUERY -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

  <!-- JAVASCRIPT -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <style>
      body#papago-body{
        padding-top: 55px;
      }
  </style>
  
</head>
<body>

  <div class="container">
    <textarea id="send_text" class="form-control" name="content" cols="40" rows="4" placeholder="send text"></textarea>
    <button id="jsonConvertStringSend" type="button" class="btn btn-primary"> Translate </button>
    <textarea id="result_text" class="form-control" name="content" cols="40" rows="4" placeholder="result text" readonly></textarea>
  </div>

  <script>
    //번역을 위해서 button 이벤트를 위해서 사용하는 것
    $('#jsonConvertStringSend').click(function () {
        //번역할 object를 생성 
        console.log("clicked!");
        var test = {
            "original_str": $("#send_text").val(),
        };
        console.log(test);
        jsonSend(test);
    });
    
    function jsonSend(test) {
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath() %>/common/papagoNMTApi",
            data: test, //json을 보내는 방법
            dataType: "text",
            success: function (data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
                console.log(data);
                //alert(data);

                //string의 값을 object 형식으로 변환합니다.
                var result_obj = JSON.parse(data);
                console.log(data);
                console.log(result_obj);
                
                //결과값을 textarea에 넣기 위해서
                $("#result_text").val(result_obj.message.result.translatedText);
            },
            error: function (e) {
                console.log(e);
                alert('실패했습니다.');
            }
        });
    }
  </script>


</body>
</html>