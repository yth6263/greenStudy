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
  <title>boardSearchList.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h4 class="text-center">게 시 판 검 색 리 스 트</h4>
  <div class="row mt-4 mb-1">
    <div class="col">(<font color="blue"><b>${searchStr}</b></font>(으)로 <font color="orange"><b>${searchString}</b></font>를 검색한 결과 <font color="red"><b>${searchCnt}</b></font>건이 검색 되었습니다.)</div>
    <div class="col text-end"><a href="boardList.bo" class="btn btn-primary btn-sm">돌아가기</a></div>
  </div>
  <table class="table table-hover">
    <tr class="table-secondary text-center">
      <th>글번호</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>글쓴날짜</th>
      <th>조회수(좋아요)</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr class="text-center">
        <td>${searchCnt - st.index}</td>
        <td>
          <a href="boardContent.bo?idx=${vo.idx}&search=${search}&searchString=${searchString}&flag=S">${vo.title}</a>
        </td>
        <td>${vo.nickName}</td>
        <td>${vo.wDate}</td>
        <td>${vo.readNum}</td>
      </tr>
    </c:forEach>
  </table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>