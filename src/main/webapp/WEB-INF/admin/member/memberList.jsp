<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>memberList.jsp(관리자)</title>
  <script>
    'use strict';
    
    function levelCheck(idx) {
    	let level = document.getElementById("level"+idx).value;
    	let strLevel = "";
    	if(level == 0) strLevel = "관리자";
    	else if(level == 1) strLevel = "준회원";
    	else if(level == 2) strLevel = "정회원";
    	else if(level == 3) strLevel = "우수회원";
    	else if(level == 4) strLevel = "운영자";
    	
    	let ans = confirm("현재 등급을 "+strLevel+" 변경하시겠습니까?");
    	
    	if(!ans) return false;
    	
      $.ajax({
    	  url  : "memberLevelChange.ad",
    	  type : "post",
    	  data : {
    		  idx : idx,
    		  level : level
    	  },
    	  success: (res) => {
    		  if(res != '0') {
    			  alert('레벨이 변경 되었습니다.');
    			  location.reload();
    		  }
    		  else alert('레벨이 변경 오류~~');
    	  },
    	  error  : () => alert("전송오류")
      });
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <div class="d-flex justify-content-end gap-2 mb-3">
    <a href="${ctp}/index.yo" class="btn btn-outline-success">홈으로</a>
    <a href="${ctp}/admin.yo" class="btn btn-success">대시보드</a>
  </div>
  <h2 class="text-center mb-3">회 원 리 스 트(관리자)</h2>
  <table class="table table-hover">
    <tr class="table-secondary">
      <th>번호</th>
      <th>아이디</th>
      <th>닉네임</th>
      <th>성명</th>
      <th>이메일</th>
      <th>생일</th>
      <th>직업</th>
      <th>현재레벨</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${memberStartNo - st.index}</td>
	      <td><a href="memberContent.ad?mid=${vo.mid}">${vo.mid}</a></td>
	      <td>${vo.nickName}</td>
	      <td>${vo.name}</td>
	      <td>${vo.email}</td>
	      <td>${fn:substring(vo.birthday, 0, 10)}</td>
	      <td>${vo.job}</td>
	      <td>
	        <div class="input-group">
		      	<select name="level" id="level${vo.idx}">
		      	  <option value="0" ${vo.level==0 ? 'selected' : ''}>관리자</option>
		      	  <option value="1" ${vo.level==1 ? 'selected' : ''}>준회원</option>
		      	  <option value="2" ${vo.level==2 ? 'selected' : ''}>정회원</option>
		      	  <option value="3" ${vo.level==3 ? 'selected' : ''}>우수회원</option>
		      	  <option value="4" ${vo.level==4 ? 'selected' : ''}>운영자</option>
		      	</select>
		      	<input type="button" value="등급변경" onclick="levelCheck(${vo.idx})" class="btn btn-success"/>
	      	</div>
	      </td>
	    </tr>
    </c:forEach>
  </table>
  <div class="d-flex justify-content-center align-items-center gap-2 mb-4">
    <c:if test="${memberStartPage > 1}">
      <a class="btn btn-sm btn-outline-secondary" href="${ctp}/memberList.ad?page=${memberStartPage - 1}">이전블록</a>
    </c:if>
    <c:forEach var="pageNo" begin="${memberStartPage}" end="${memberEndPage}">
      <a class="btn btn-sm ${pageNo == memberCurrentPage ? 'btn-success' : 'btn-outline-success'}" href="${ctp}/memberList.ad?page=${pageNo}">${pageNo}</a>
    </c:forEach>
    <c:if test="${memberEndPage < memberTotalPage}">
      <a class="btn btn-sm btn-outline-secondary" href="${ctp}/memberList.ad?page=${memberEndPage + 1}">다음블록</a>
    </c:if>
  </div>
</div>
<p><br/></p>
</body>
</html>
