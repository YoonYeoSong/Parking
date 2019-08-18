<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Failed</title>

</head>
<body>
	<!-- web.xml에 모든 exception에 대한 공통 에러페이지 등록가능 -->
<%--   <h1 style="color:red;">"<%=exception.getMessage() %>" EXCEPTION 에러!</h1>
 --%>
  <h1 style="color:red;">ERROR 발생</h1>
  <p>로그인에 실패하였습니다. 잠시 후 메인화면으로 이동합니다.</p>

  <script>
    setTimeout(function(){
      location.href="<%=request.getContextPath() %>/index.jsp";
    }, 1800);
  </script>

</body>
</html>