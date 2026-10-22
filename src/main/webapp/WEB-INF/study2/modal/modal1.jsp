<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>modal1.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>Modal 연습1</h2>
  <hr/>
  <div>
    <input type="button" value="표준모달" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal1" />
    <input type="button" value="부드러운모달" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal2" />
    <input type="button" value="더큰모달" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myModal3" />
    <input type="button" value="중앙모달" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#myModal4" />
    <input type="button" value="스크롤모달" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#myModal5" />
    <input type="button" value="응용모달" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal6" />
  </div>
</div>

<!-- The Modal(표준모달) -->
<div class="modal" id="myModal1">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(부드러운 모달) -->
<div class="modal fade" id="myModal2">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(더큰 모달) -->
<div class="modal" id="myModal3">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(중앙모달) -->
<div class="modal" id="myModal4">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(스크롤모달) -->
<div class="modal" id="myModal5">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
        Modal body..<br/>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(응용모달) -->
<div class="modal fade" id="myModal6">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>