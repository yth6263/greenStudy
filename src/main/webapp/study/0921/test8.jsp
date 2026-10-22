<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test8.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 가입</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/Test8Ok">
	  <div class="input-group mb-2">
	  	<div class="input-group-text">아이디</div>  
	  	<input type="text" name="mid" id="mid" value="khd1234" class="form-control" autofocus required />
	  </div>
	  <div class="input-group mb-2">
	  	<div class="input-group-text">비밀번호</div>  
	  	<input type="password" name="pwd" id="pwd" value="1234" class="form-control" required />
	  </div>
	  <div class="input-group mb-2">
	  	<div class="input-group-text">성명</div>  
	  	<input type="text" name="name" id="name" value="홍길동" class="form-control" required />
	  </div>
	  <div class="input-group mb-2">
	  	<div class="input-group-text">나이</div>  
	  	<input type="number" name="age" id="age" value="21" class="form-control" />
	  </div>
	  <div class="input-group mb-2">
	  	<div class="input-group-text">성별</div>  
	  	<input type="radio" name="gender" id="gender1" value="남자" class="ms-3" />남자
	  	<input type="radio" name="gender" id="gender2" value="여자" class="ms-5" checked />여자
		</div>
		<div>
		  <div class="input-group-text">카드</div>  
	  	<input type="checkbox" name="card" value="LG카드" class="ms-3" />LG카드
	  	<input type="checkbox" name="card" value="KB카드" class="ms-5" checked />KB카드
	  	<input type="checkbox" name="card" value="롯데카드" class="ms-5" />롯데카드
	  	<input type="checkbox" name="card" value="신한카드" class="ms-5" />신한카드
	  	<input type="checkbox" name="card" value="삼성카드" class="ms-5" />삼성카드
	  	<input type="checkbox" name="card" value="BC" class="ms-5" />BC카드
	  	<input type="checkbox" name="card" value="외한카드" class="ms-5" />외한카드
		</div>
		<div class="input-group mb-2">
			<div class="input-group-text">직업</div>
		  <select name="job" id="job" class="form-select">
		    <option selected>학생</option>
		    <option>회사원</option>
		    <option>공무원</option>
		    <option>군인</option>
		    <option>가사</option>
		    <option>기타</option>
		  </select>
		</div>
		<div class="input-group mb-2">
			<div class="input-group-text">자기소개서</div>
		  <textarea rows="5" name="content" id="content" class="form-control"></textarea>
		</div>
		<div class="row text-center">
		  <div class="col"><a href="/greenStudy" class="btn btn-success">홈으로</a></div>
  		<div class="col"><input type="submit" value="전송" class="btn btn-primary"/></div>
  	</div>
  </form>
  <hr/>
</div>
<p><br/></p>
</body>
</html>