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
  <title>jstl2.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>jstl2.jsp(반복문)</h2>
  <hr/>
  <%-- <div class="text-end"><a href="<%=request.getContextPath()%>/study2/jstl/JstlMenu" class="btn btn-warning">돌아가기</a></div> --%>
  <div class="text-end"><a href="${ctp}/study2/jstl/JstlMenu" class="btn btn-warning">돌아가기</a></div>
  <hr/>
  1~10까지를 출력?<br/>
  <c:forEach var="i" begin="1" end="10">
    ${i} /
  </c:forEach>
  <br/>
<%
  String[] cards = {"국민","BC","LG","현대","삼성","신한","농협","비자"};
	pageContext.setAttribute("cards", cards);
%>
  A번 :
  <c:forEach var="card" items="${cards}">
  	${card} /
  </c:forEach>
  <br/>
  B번 : <br/>   <!-- count, index, first, last -->
  <c:forEach var="card" items="${cards}" varStatus="st">
  	${st.count},${st.index},${st.first},${st.last},${st.current} : ${card}<br/>
  </c:forEach>
  <br/>
  C번 : <br/>
  <c:forEach var="kard" items="${kards}" varStatus="st">
  	${st.count},${st.index},${st.first},${st.last},${st.current} : ${kard}<br/>
  </c:forEach>
  <hr/>
  <h4>사용예제</h4>
  <h5>1.구구단 5단을 출력하시요</h5>
  
  
  <br/>
  <h5>2.구구단 3단~5단까지 출력하시오(2중 for문)</h5>
  
  
  <br/>
  <h5>3.저장된 그림 5장을 출력하시오.(13.png~17.png)</h5>
  <c:set var="im" value="14"/>
  <img src="<%=request.getContextPath()%>/images/${im}.png" width="200px"/><br/>
  <img src="${pageContext.request.contextPath}/images/${im}.png" width="200px"/><br/>
  <hr/>
  <h4>vos값 출력</h4>
  <c:forEach var="vo" items="${vos}">
    ${vo} / 
  </c:forEach>
  <br/>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>