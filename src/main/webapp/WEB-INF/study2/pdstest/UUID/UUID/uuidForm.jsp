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
  <title>uuidForm.jsp</title>
  <script>
    'use strict';
    
    let str = '';
    function uuidCheck() {
    	$.ajax({
    		url  : "uuidCheck.st",
    		type : "post",
    		success: (res) => {
    			str += res + "<br/>";
    			demo.innerHTML = str;
    		},
    		error : () => alert("전송오류")
    	});
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>UUID 연습</h2>
  <div>
    UUID는 Universally Unique Identifier(범용 고유 식별자)의 약자로, 컴퓨터 시스템에서 데이터를 유일하게 구분하기 위해 사용하는 128비트 길이의 고유 식별자<br/>
    128Bit로, 16진수 표기로는 32자료 표현된다.(8-4-4-4-12)
  </div>
  <form name="myform">
    <input type="button" value="UUID생성" onclick="uuidCheck()" class="btn btn-success" />
    <input type="button" value="다시하기" onclick="location.reload()" class="btn btn-warning" />
  </form>
  <hr/>
  출력결과 : <br/>
  <div id="demo"></div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>