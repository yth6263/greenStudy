<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>ajax.jsp</title>
  <script>
    'use strict';
    
    // 동기식
    function idCheck1() {
    	//let mid = document.getElementById("mid").value;
    	//let mid = $("#mid").val();
    	let mid = document.myform.mid.value;
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요");
    		return false;
    	}
    	
    	location.href = "ajaxIdCheck1.st?mid="+mid;
    }
    
    // fetch() 사용 - 비동기식
    function idCheck2() {
    	let mid = document.myform.mid.value;
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요");
    		return false;
    	}
    	
    	fetch("ajaxIdCheck2.st?mid="+mid)
    		.then((res) => res.text())
    		.then((res) => document.getElementById("demo").innerHTML = res)
    		.then((res) => console.log("res : ", res))
    		.catch((error) => console.log("error : ", error))
    		;
    }
    
    // ajax() 사용 - 비동기식
    function idCheck3() {
    	let mid = document.myform.mid.value;
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요");
    		return false;
    	}
    	
    	$.ajax({
    		url  : "ajaxIdCheck3.st",
    		type : "get",
    		data : {"mid": mid},
    		// dataType : "json",
    		contentType : "application/json",
    		charset : "utf-8",
    		timeout : 10000,
    		beforeSend: () => {
    			console.log("수행전 : ", mid);
    		},
    		success: (res) => {
    			let str = "<font color='blue'>검색아이디 : " + mid + ", 성명 : " + res + "</font>";
    			$("#demo").html(str);
    		},
    		error: () => {
    			alert("전송오류");
    		},
    		complete: () => {
    			console.log("수행후 : ", mid);
    		}
    	});
    }
    
    // ajax() 사용 - 비동기식
    function idCheck4() {
    	let mid = document.myform.mid.value;
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요");
    		return false;
    	}
    	
    	$.ajax({
    		url  : "ajaxIdCheck3.st",
    		type : "get",
    		data : {"mid": mid},
    		success: (res) => {
    			let str = "<font color='blue'>검색아이디2 : " + mid + ", 성명2 : " + res + "</font>";
    			$("#demo").html(str);
    		},
    		error: () => alert("전송오류")
    	});
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>ajax 연습</h2>
  <div>
    <form name="myform">
      <div class="input-group mb-3">
	      <div class="input-group-text">아이디</div>
	      <input type="text" name="mid" id="mid" class="form-control"/>
      </div>
      <div class="text-center">
        <input type="button" value="동기식" onclick="idCheck1()" class="btn btn-success"/>
        <input type="button" value="비동기식2(fetch)" onclick="idCheck2()" class="btn btn-primary"/>
        <input type="button" value="비동기식3(ajax)" onclick="idCheck3()" class="btn btn-info"/>
        <input type="button" value="비동기식4(ajax)" onclick="idCheck4()" class="btn btn-secondary"/>
      </div>
    </form>
    <hr/>
    <div id="demo"><font color='red'><b>출력결과 : ${name}</b></font></div>
    <hr/>
    <h2>HTTP통신</h2>
	  <pre>
	    ☞ 동기식(Synchronous) : 먼저 시작된 하나의 작업이 끝날때까지 다른 작업들은 시작하지않고 기다렸다가, 앞의 작업이 모두 끝나면,
	      새로운 작업을 시작하는 방식이다.
	    ☞ 비동기식(Asynchronous) : 먼저 시작된 작업의 완료여부와 상관없이 새로운 작업을 시작하는 방식
	    - 바닐라 자바스크립트의 비동기식 : 브라우저의 XMLHttpRequest
	    - ECMA6 자바스크립트의 비동기식 : 콜백함수, Promise, Promise를 활용한 async/await, 그리고 fetch()방식
	    
	    <h4>AJAX</h4>
	    ☞ AJAX(Asynchronous Javascript And Xml)
	      자바스크립트 라이브러리중의 하나이며, 브라우저객체인 XMLHttpRequest를 이용해서 전체페이지를 고치지 않아도 부분적인 페이지 일부만을
	      위한 데이터를 로드하는 기법이다.
	      즉, 자바스크립트를 이용하여 서버에 데이터를 요청할때 비동기식으로 통신하는 방식. 과거는 XML방식을 많이 선호하였으나, 지금은 JSON방식을 많이 사용한다.
	      
	    <h5>AJAX에서의 메소드(전송방식) 종류</h5>
	    - GET : 데이터를 읽거나 주로 검색할때 사용
	    - POST : 새로운 리소스를 생성할때 사용
	    - PUT : 리소스를 생성/업데이트할때 사용
	    - DELETE : 지정된 리소스를 삭제할때 사용
	  </pre>
    <hr/>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>