<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>modal2.jsp</title>
  <script>
    'use strict';
    
    function fCheck2(name) {
    	$("#modalName2").text(name);
    }
    
    function fCheck3() {
    	$("#modalName3").text('이기자');
    }
    
    function fCheck4() {
    	$("#modalName4").text('${vo.name}');
    }
    
<%
/* 
		MemberDAO dao = new MemberDAO();
		List<MemberVO> vos = dao.getMemberList();
		pageContext.setAttribute("vos", vos);
		System.out.println("vos" + vos);
*/
%>
    function fCheck5() {
    	let str = '';
    	str += '<table class="table table-hover text-center">';
    	str += '<tr class="table-secondary">';
    	str += '<th>번호</th><th>아이디</th><th>성명</th><th>메일주소</th>';
    	str += '</tr>';
    	str += '<c:forEach var="vo" items="${vos}" varStatus="st">';
    	str += '<tr>';
    	str += '<td>${st.count}</td>';
    	str += '<td>${vo.mid}</td>';
    	str += '<td>${vo.name}</td>';
    	str += '<td>${vo.email}</td>';
    	str += '</tr>';
    	str += '</c:forEach>';
    	str += '</table>';
    	$("#modalVos").html(str);
    }
    
    function fCheck6() {
    	alert("${vos[0]}");
    }
    
    function modal2Check() {
    	let mid = document.getElementById("mid").value;
    	
    	$.ajax({
    		url  : "modal2Check.st",
    		type : "post",
    		data : {mid : mid},
    		success : (res) => {
    			alert(res);
    			$("#demo").text(res);
    			console.log("성명 :", res);
    		},
    		error : () => alert('전송오류')
    	});
    }
    
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>Modal 연습2</h2>
  <hr/>
  <div>
    <input type="button" value="폼내용출력1" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal1" />
    <a href="#" onclick="fCheck2('홍길동')" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal2">폼내용출력2</a>
    <a href="#" onclick="fCheck3()" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myModal3">폼내용출력3(성명)</a>
    <a href="#" onclick="fCheck4()" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#myModal4">폼내용출력4(성명)</a>
    <a href="#" onclick="fCheck5()" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#myModal5">폼내용출력5(리스트)</a>
    <input type="button" value="vos출력" onclick="fCheck6()" class="btn btn-danger" />
  </div>
  <hr/>
  <div>
    <form name="myform">
      <div class="input-group">
        <div class="input-group-text">아이디</div>
        <input type="text" name="mid" id="mid" value="hkd1234" class="form-control"/>
        <input type="button" value="아이디검색" onclick="modal2Check()" class="btn btn-success"/>
      </div>
    </form>
    <hr/>
    <div id="demo"></div>
  </div>
</div>

<!-- The Modal(응용모달) -->
<div class="modal fade" id="myModal1">
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

<!-- The Modal(응용모달2) -->
<div class="modal fade" id="myModal2">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <div id="modalName2"></div>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(응용모달3) -->
<div class="modal fade" id="myModal3">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <div id="modalName3"></div>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(응용모달4) -->
<div class="modal fade" id="myModal4">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <div id="modalName4"></div>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal(응용모달5) -->
<div class="modal fade" id="myModal5">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <div id="modalVos"></div>
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