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
  <title>yogaList.jsp</title>
  <script>
    'use strict';
    
    function delCheck(idx) {
    	let ans = confirm("정말로 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : "yogaDelete.yo",
    		type : "post",
    		data : {idx :idx},
    		success: (res) => {
    			if(res != "0") {
    				alert("삭제완료");
    				location.reload();
    			}
    			else alert("삭제 실패~~");
    		},
    		error : () => alert("전송오류!")
    	});
    }
    
    function partCheck() {
    	let part = document.getElementById("part").value;
    	//alert("part : " + part);
    	location.href="yogaList.yo?part="+part;
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-4">요가 리스트</h2>
  <div class="mb-2">
    <select name="part" id="part" onchange="partCheck()">
      <option value="전체" selected>전체조회</option>
      <option ${part == '집중명상' ? "selected" : ""}>집중명상</option>
      <option ${part == '통찰명상' ? "selected" : ""}>통찰명상</option>
      <option ${part == '자비명상' ? "selected" : ""}>자비명상</option>
      <option ${part == '자애명상' ? "selected" : ""}>자애명상</option>
      
    </select>
  </div>
	<table class="table table-hover">
    <tr class="table-secondary">
      <th>번호</th>
      <th>분류</th>
      <th>제목</th>
      <th>주소</th>
      <th>사진</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${st.count}</td>
	      <td>${vo.part}</td>
	      <td>${vo.title}</td>
	      <td>${vo.url}</td>
	      <td><img src="${ctp}/images/data/yoga/${vo.photo}" width="100px"/></td>
	      <td><a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a></td>
	    </tr>
    </c:forEach>
  </table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>