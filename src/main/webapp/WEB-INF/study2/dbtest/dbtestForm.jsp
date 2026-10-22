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
  <title>dbtestForm.jsp</title>
  <script>
    'use strict';
    
    function dbtestSearch(flag) {
    	let mid = prompt("검색할 아이디를 입력하세요");
    	
    	if(mid.trim() == "") {
    		alert("검색할 아이디를 입력하세요.");
    		return false;
    	}
    	
    	if(flag == 's')	location.href = '${ctp}/dbtestSearch.st?mid=' + mid;
    	else if(flag == 'u') location.href = '${ctp}/dbtestUpdate.st?mid=' + mid;
    	else if(flag == 'd') {
    		let ans = confirm("현재 회원을 삭제 처리 하시겠습니까?");
    		if(ans)	location.href = '${ctp}/dbtestDelete.st?mid=' + mid;
    	}
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>dbtestForm.jsp(데이터베이스 연습)</h2>
  <div>
    <a href="dbtestInput.st" class="btn btn-success">회원가입</a>
    <a href="javascript:dbtestSearch('s')" class="btn btn-info">개별조회</a>
    <a href="dbtestList.st" class="btn btn-primary">자료리스트</a>
    <a href="javascript:dbtestSearch('u')" class="btn btn-warning">자료수정</a>
    <a href="javascript:dbtestSearch('d')" class="btn btn-danger">자료삭제</a>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>