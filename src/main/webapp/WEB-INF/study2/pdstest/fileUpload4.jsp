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
  <title>fileUpload4.jsp</title>
  <script>
    'use strict';

    function fCheck() {
    	let fName = document.getElementById("file").value;
    	let fNames = "";
    	let ext = "";
    	let fileSize = 0;
    	let maxSize = 1024 * 1024 * 20;	// 20MByte까지 허용
    	
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	let fileLength = document.getElementById("file").files.length;
    	
    	for(let i=0; i<fileLength; i++) {
    		fName = document.getElementById("file").files[i].name;
    	  ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();		// 예) d:/greenStudy/jsp/works/test/10.35.30.20.jpg
    	  fileSize += document.getElementById("file").files[i].size;
    	
	    	if(ext != 'zip' && ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'txt' && ext != 'doc' && ext != 'pdf' && ext != 'hwp') {
	    		alert("업로드 가능한 파일은 'zip/jpg/gif/png/txt/doc/pdf/hwp' 입니다.");
	    		return false;
	    	}
	    	fNames += fName + "/";
    	}
    	
    	if(fileSize > maxSize) alert("업로드할 파일의 최대용량은 20MByte 입니다.");
    	else {
	    	fNames = fNames.substring(0,fNames.length-1);
	    	document.getElementById("fNames").value = fNames;
    		myform.submit();
    	}
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
  <form name="myform" method="post" action="fileUpload4Ok.st" enctype="multipart/form-data">
    <div class="input-group">
    	<input type="file" name="fName" id="file" multiple class="form-control"/>
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