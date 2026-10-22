<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <%-- <a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a> --%>
    <a class="navbar-brand" href="http://192.168.50.51:9090/greenStudy/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Guest</a>
        </li>
        <c:if test="${sLevel <= 4}">
	        <li class="nav-item">
	          <a class="nav-link" href="boardList.bo">Board</a>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <%-- <a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a> --%>
    <a class="navbar-brand" href="http://192.168.50.51:9090/greenStudy/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Guest</a>
        </li>
        <c:if test="${sLevel <= 4}">
	        <li class="nav-item">
	          <a class="nav-link" href="boardList.bo">Board</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">PDS</a>
	        </li>
	        <c:if test="${sLevel != 1}">
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Study</a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study2/jstl/JstlMenu">명상글올리기[JSTL]</a></li>
	<!-- 	            <li><a class="dropdown-item" href="${ctp}/study2/mapping/Test1">디렉토리매핑</a></li>
		            <li><a class="dropdown-item" href="mapping.do">확장자매핑</a></li>
		            <li><a class="dropdown-item" href="ajax.st">AJax</a></li>
		            <li><a class="dropdown-item" href="password.st">비밀번호암호화</a></li>
		            <li><a class="dropdown-item" href="dbtestForm.st">데이터베이스연습</a></li>
		            <li><a class="dropdown-item" href="fileUploadForm.st">파일업로드연습</a></li>
		            <li><a class="dropdown-item" href="uuidForm.st">UUID 연습</a></li>
		            <li><a class="dropdown-item" href="modal1.st">모달연습1</a></li>
		            <li><a class="dropdown-item" href="modal2.st">모달연습2</a></li>
		          
	 -->	          </ul>
		        </li>
	        </c:if>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">MyPage</a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="memberMain.mem">회원메인방</a></li>
	            <c:if test="${sLevel <= 4 && (sLevel > 1 || sLevel == 0)}">
		            <li><a class="dropdown-item" href="">일정관리</a></li>
		            <li><a class="dropdown-item" href="">메세지관리</a></li>
		            <li><a class="dropdown-item" href="memberList.mem">회원리스트</a></li>
	            </c:if>
	            <li><a class="dropdown-item" href="">회원정보수정</a></li>
	            <li><a class="dropdown-item" href="">회원탈퇴</a></li>
	            <c:if test="${sLevel == 0}"><li><a class="dropdown-item" href="adminMain.ad">관리자</a></li></c:if>
	          </ul>
	        </li>
        </c:if>
        <li class="nav-item">
          <c:if test="${!empty sLevel}"><a class="nav-link" href="memberLogout.mem">Logout</a></c:if>
          <c:if test="${empty sLevel}"><a class="nav-link" href="memberLogin.mem">Login</a></c:if>
        </li>
        <li class="nav-item">
          <c:if test="${empty sLevel}"><a class="nav-link" href="memberJoin.mem">Join</a></c:if>
        </li> 
      </ul>
    </div>
  </div>
</nav>        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">PDS</a>
	        </li>
	        <c:if test="${sLevel != 1}">
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Study</a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/study2/jstl/JstlMenu">JSTL</a></li>
	  	            <li><a class="dropdown-item" href="${ctp}/study2/mapping/Test1">디렉토리매핑</a></li>
		            <li><a class="dropdown-item" href="mapping.do">확장자매핑</a></li>
		            <li><a class="dropdown-item" href="ajax.st">AJax</a></li>
		            <li><a class="dropdown-item" href="password.st">비밀번호암호화</a></li>
		            <li><a class="dropdown-item" href="dbtestForm.st">데이터베이스연습</a></li>
		            <li><a class="dropdown-item" href="fileUploadForm.st">파일업로드연습</a></li>
		            <li><a class="dropdown-item" href="uuidForm.st">UUID 연습</a></li>
		            <li><a class="dropdown-item" href="modal1.st">모달연습1</a></li>
		            <li><a class="dropdown-item" href="modal2.st">모달연습2</a></li>
		          
		          </ul>
	          
		        </li>
	        </c:if>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">MyPage</a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="memberMain.mem">회원메인방</a></li>
	            <c:if test="${sLevel <= 4 && (sLevel > 1 || sLevel == 0)}">
		            <li><a class="dropdown-item" href="">일정관리</a></li>
		            <li><a class="dropdown-item" href="">메세지관리</a></li>
		            <li><a class="dropdown-item" href="memberList.mem">회원리스트</a></li>
	            </c:if>
	            <li><a class="dropdown-item" href="">회원정보수정</a></li>
	            <li><a class="dropdown-item" href="">회원탈퇴</a></li>
	            <c:if test="${sLevel == 0}"><li><a class="dropdown-item" href="adminMain.ad">관리자</a></li></c:if>
	          </ul>
	        </li>
        </c:if>
        <li class="nav-item">
          <c:if test="${!empty sLevel}"><a class="nav-link" href="memberLogout.mem">Logout</a></c:if>
          <c:if test="${empty sLevel}"><a class="nav-link" href="memberLogin.mem">Login</a></c:if>
        </li>
        <li class="nav-item">
          <c:if test="${empty sLevel}"><a class="nav-link" href="memberJoin.mem">Join</a></c:if>
        </li> 
      </ul>
    </div>
  </div>
</nav>