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
  <title>fileUpload2.jsp</title>
  <script>
    'use strict';
    

    function fCheck() {
      const fileInput = document.getElementById("file");
      const files = fileInput.files;

      if (files.length === 0) {
        alert("업로드할 파일을 선택하세요.");
        return false;
      }

      const maxSize = 1024 * 1024 * 20;
      const allowed = ['zip','jpg','gif','png','txt','doc','pdf','hwp'];

      let totalSize = 0;
      let fNames = "";

      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const ext = file.name.split('.').pop().toLowerCase();

        if (!allowed.includes(ext)) {
          alert("업로드할 수 없는 파일입니다: " + file.name);
          return false;
        }

        totalSize += file.size;
        fNames += file.name + "/";
      }

      if (totalSize > maxSize) {
        alert("전체 파일 용량은 20MB 이하이어야 합니다.");
        return false;
      }

      const form = document.myform;

      // 이전에 생성한 파일 input 제거
      form.querySelectorAll(".dynamic-file").forEach(el => el.remove());

      // 선택된 파일마다 고유한 name 부여
      for (let i = 0; i < files.length; i++) {
        const dt = new DataTransfer();
        dt.items.add(files[i]);

        const input = document.createElement("input");
        input.type = "file";
        input.name = "fName" + i;
        input.files = dt.files;
        input.className = "dynamic-file";
        input.style.display = "none";

        form.appendChild(input);
      }

      // 원래 파일 input은 전송하지 않음
      fileInput.disabled = true;

      document.getElementById("fNames").value = fNames.slice(0, -1);

      form.submit();
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습(멀티 파일)</h2>
  <hr/>
  <h4>COS라이브러리를 이용한 파일 업로드</h4>
  <hr/>
  <form name="myform" method="post" action="fileUpload2Ok.st" enctype="multipart/form-data">
    <div class="input-group">
    	<!-- <div class="input-group-text">파일명</div> -->
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