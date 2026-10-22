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
  <title>dbtestSearch.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>개별 조회</h2>
  <div>
    <c:if test="${vo.idx == 0}"><div class="text-center"><b>${vo.mid}로 검색한 자료가 없습니다.</b></div></c:if>
    <c:if test="${vo.idx != 0}">
    	검색된 결과 : <br/>
    	<table class="table table-bordered">
    	  <tr>
    	    <th>아이디</th>
    	    <td>${vo.mid}</td>
    	  </tr>
    	  <tr>
    	    <th>비밀번호</th>
    	    <td>${vo.pwd}</td>
    	  </tr>
    	  <tr>
    	    <th>성명</th>
    	    <td>${vo.name}</td>
    	  </tr>
    	  <tr>
    	    <th>성별</th>
    	    <td>${vo.gender}</td>
    	  </tr>
    	  <tr>
    	    <th>나이</th>
    	    <td>${vo.age}</td>
    	  </tr>
    	</table>
    </c:if>
    <div class="text-center"><a href="dbtestForm.st" class="btn btn-warning">돌아가기</a></div>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>