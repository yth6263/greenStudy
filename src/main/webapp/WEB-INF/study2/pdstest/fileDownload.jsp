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
  <title>fileDownload.jsp</title>
  <link rel="stylesheet" type="text/css" href="${ctp}/css/linkPink.css"/>
  <script>
    'use strict';
    
    // 1개 파일만 삭제처리
    function fileDelete(fileName) {
    	let ans = confirm("현재파일을 삭제하시겠습니가?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : "fileDelete.st",
    		type : "post",
    		data : {fileName: fileName},
    		success: (res) => {
    			if(res != '0') {
    				alert('삭제완료!');
    				location.reload();
    			}
    			else alert("삭제 실패~~");
    		},
    		error : () => alert('전송오류!')
    	});
    }
    
    // 전체선택
    function allCheck() {
      for(let i=0; i<myform.fileFlag.length; i++) {
        myform.fileFlag[i].checked = true;
      }
    }

    // 전체취소
    function allReset() {
      for(let i=0; i<myform.fileFlag.length; i++) {
        myform.fileFlag[i].checked = false;
      }
    }

    // 선택반전
    function reverseCheck() {
      for(let i=0; i<myform.fileFlag.length; i++) {
        myform.fileFlag[i].checked = !myform.fileFlag[i].checked;
      }
    }
    
    // 선택항목 삭제처리
    function selectFileDelete() {
    	let selectFileArray = '';
    	
      for(let i=0; i<myform.fileFlag.length; i++) {
        if(myform.fileFlag[i].checked) selectFileArray += myform.fileFlag[i].value + "/";
      }
    	selectFileArray = selectFileArray.substring(0,selectFileArray.lastIndexOf("/"));
    	
    	if(selectFileArray == '') {
    		alert("삭제할 파일 항목을 1개 이상 선택하세요");
    		return false;
    	}
    	
    	let ans = confirm("선택된 파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
      $.ajax({
    	  url  : "fileDeleteCheck.st",
    	  type : "post",
    	  data : {selectFileArray : selectFileArray},
    	  success:function(res) {
    		  if(res != "0") { 
    			  alert("선택한 항목들을 삭제하셨습니다.");
    			  location.reload();
    		  }
    		  else alert("삭제 실패~");
    	  },
    	  error : function() {
    		  alert("전송 실패~~");
    	  }
      });
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2 class="text-center">저장된 파일 정보 보기</h2>
  <hr/>
  <div class="row">
  	<div class="col input-group">
	    <input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1"/>
	    <input type="button" value="전체취소" onclick="allReset()" class="btn btn-primary btn-sm mr-1"/>
	    <input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-info btn-sm mr-1"/>
	    <input type="button" value="선택항목삭제" onclick="selectFileDelete()" class="btn btn-danger btn-sm" />
	  </div>
    <div class="col text-end"><a href="fileUploadForm.st" class="btn btn-warning btn-sm">돌아가기</a></div>
  </div>
  <hr/>
  <form name="myform">
	  <table class="table table-bordered text-center">
	    <tr class="table table-secondary">
	      <th>번호</th>
	      <th>파일명</th>
	      <th>파일형식</th>
	      <th>비고</th>
	    </tr>
		  <c:forEach var="file" items="${files}" varStatus="st">
		    <tr>
		      <td>
		        <input type="checkbox" name="fileFlag" id="fileFlag${st.index}" value="${file}"/>
		        ${st.count}
		      </td>
		      <td><a href="${ctp}/images/data/pdstest/${file}" download>${file}</a></td>
		      <td>
		        <c:set var="fNameArr" value="${fn:split(file, '.')}"/>
		        <c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
		        <c:if test="${extName == 'zip'}">압축파일</c:if>
		        <c:if test="${extName == 'hwp'}">한글파일</c:if>
		        <c:if test="${extName == 'txt'}">텍스트파일</c:if>
		        <c:if test="${extName == 'doc'}">도큐먼트파일</c:if>
		        <c:if test="${extName == 'jpg' || extName == 'gif' || extName == 'png'}">
		        	<a href="${ctp}/images/data/pdstest/${file}" target="_blank"><img src="${ctp}/images/data/pdstest/${file}" width="150px"/></a>
		        </c:if>
		      </td>
		      <td>
		        <a href="${ctp}/images/data/pdstest/${file}" download class="badge bg-primary">다운로드</a><br/>
		        <a href="javascript:fileDelete('${file}')" class="badge bg-danger">삭제</a>
		      </td>
		    </tr>
		  </c:forEach>
	  </table>
  </form>
  <hr/>
  <div class="row text-center">
    <div class="col"><a href="fileUploadForm.st" class="btn btn-warning">돌아가기</a></div>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>