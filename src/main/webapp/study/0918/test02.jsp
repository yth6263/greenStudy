<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test02.jsp</title>
  <script>
    'use strict';
           
    function fCheck() {
    	let su = document.getElementById("su").value;
    	location.href='test02.jsp?su=' + su;
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSP 선언문</h2>
  <hr/>
  <%!
    public String suCheck(int su) {
  	  String str = "";
  	  if(su % 2 == 0) str = "짝수";
  	  else str = "홀수";
  	  
  		return str;
	  }
  %>
  <h3>수를 입력하면 홀수와 짝수로 알려줍니다.</h3>
  <div class="input-group">
  	<div class="input-group">수</div>  
  	<input type="number" name="su" id="su" value="10" class="form-control" />
  	<!-- <input type="button" value="확인" onclick="fCheck()" class="btn btn-primary"/> -->
  	<a href="javascript:fCheck()" class="btn btn-primary">확인</a>
  </div>
  <hr/>
  <div id="demo">${param.su}</div>
  <hr/>
  <div><a href="/greenStudy" class="btn btn-success">홈으로</a></div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>