<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
  String name = request.getParameter("name");
  int age = Integer.parseInt(request.getParameter("age"));
  String gender = request.getParameter("gender");
  String job = request.getParameter("job");
  String content = request.getParameter("content");
  content = content.replace("\n", "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test06Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원가입 결과창</h2>
  <div>아이디 : <%=mid%></div>
  <div>비밀번호 : <%=pwd%></div>
  <div>성명 : <%=name%></div>
  <div>나이 : <%=age%></div>
  <div>성별 : <%=gender%></div>
  <div>직업 : <%=job%></div>
  <div>자기소개서 : <%=content%></div>
	<hr/>
  <div>
    <a href="/greenStudy" class="btn btn-success">홈으로</a>
    <!-- <a href="/greenStudy/study/0918/test06.jsp" class="btn btn-info">돌아가기</a> -->
    <a href="<%=request.getContextPath()%>/study/0918/test06.jsp" class="btn btn-info">돌아가기</a>
  </div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>