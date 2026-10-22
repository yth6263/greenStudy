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
  <title>fileUpload3.jsp</title>
  <script>
    'use strict';

    function fCheck() {
    	let fName = document.getElementById("file").value;
    	let maxSize = 1024 * 1024 * 10;	// 10MByte까지 허용
    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();		// 예) d:/greenStudy/jsp/works/test/10.35.30.20.jpg
    	
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	let fileSize = document.getElementById("file").files[0].size;
    	if(fileSize > maxSize) alert("업로드할 파일의 최대용량은 10MByte 입니다.");
    	else if(ext != 'zip' && ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'txt' && ext != 'doc' && ext != 'pdf' && ext != 'hwp') {
    		alert("업로드 가능한 파일은 'zip/jpg/gif/png/txt/doc/pdf/hwp' 입니다.");
    	}
    	else myform.submit();
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>3.파일 업로드 연습(싱글파일)</h2>
  <hr/>
  <h4>Part객체를 이용한 파일 업로드</h4>
  <hr/>
  <form name="myform" method="post" action="fileUpload3Ok.st" enctype="multipart/form-data">
    <div class="input-group">
    	<input type="file" name="fName" id="file" class="form-control"/>
    	<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success"/> 
    </div>
    <input type="hidden" name="fNames" id="fNames"/>
  </form>
  <hr/>
  <div class="row text-center">
    <div class="col"><a href="fileUploadForm.st" class="btn btn-warning">돌아가기</a></div>
    <div class="col"><a href="fileDownload.st" class="btn btn-info">다운로드폴더이동</a></div>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>