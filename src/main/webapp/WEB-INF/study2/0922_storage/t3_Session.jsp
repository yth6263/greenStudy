<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t3_Session.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>세션 연습 메뉴</h2>
  <hr/>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/T3_SessionSave">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">로 그 인(세션아이디 : )</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" value="${sMid}" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="nickName" value="${sNickName}" required class="form-control"/></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="${sName}" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <div class="row">
	          <div class="col"><input type="submit" value="세션저장" class="btn btn-success"></div>
	          <div class="col"><a href="<%=request.getContextPath()%>/T3_SessionCheck" class="btn btn-primary">세션확인</a></div>
				    <div class="col"><a href="<%=request.getContextPath()%>/T3_SessionAllDelete" class="btn btn-danger">전체삭제</a></div>
				    <div class="col"><a href="<%=request.getContextPath()%>/T3_SessionDelete" class="btn btn-info">부분삭제</a></div>
				    <div class="col"><a href="<%=request.getContextPath()%>/" class="btn btn-secondary">홈으로</a></div>
			    </div>
        </td>
      </tr>
    </table>
  </form>
  <hr/>
</div>
<p><br/></p>
</body>
</html>