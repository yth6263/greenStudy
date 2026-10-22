<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>jstl1.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>jstl1.jsp</h2>
  <hr/>
  <div class="text-end"><a href="<%=request.getContextPath()%>/study2/jstl/JstlMenu" class="btn btn-warning">돌아가기</a></div>
  <hr/>
  <table class="table table-bordered">
    <tr>
      <th>라이브러리</th>
      <th>주소(URI)-예전</th>
      <th>주소(URI)-지금</th>
      <th>접두어</th>
      <th>기본문법</th>
    </tr>
    <tr>
      <td>Core</td>
      <td>http://java.sun.com/jsp/jstl/core</td>
      <td>jakarta.tags.core</td>
      <td>c</td>
      <td>< c : 태그명.... ></td>
    </tr>
    <tr>
      <td>Formatting</td>
      <td>http://java.sun.com/jsp/jstl/fmt</td>
      <td>jakarta.tags.fmt</td>
      <td>fmt</td>
      <td>< fmt : 태그명.... ></td>
    </tr>
    <tr>
      <td>Function</td>
      <td>http://java.sun.com/jsp/jstl/function</td>
      <td>jakarta.tags.function</td>
      <td>fn</td>
      <td>$ { fn : 태그명.... }</td>
    </tr>
    <tr>
      <td>SQL</td>
      <td>http://java.sun.com/jsp/jstl/sql</td>
      <td>jakarta.tags.sql</td>
      <td>sql</td>
      <td>< sql : 태그명.... ></td>
    </tr>
  </table>
  <hr/>
  <div>
    앞의 라이브러리를 사용할 경우에는 반드시 상단에 jsp지시자중 'taglib'를 이용하여 먼저 선언후 사용해야 한다.
  </div>
  <hr/>
  <h2>Core 라이브러리 사용예</h2>
  <pre>
    <h4>용도 : 변수제어(선언/값(일반,객체)할당/출력/제거), 제어문(조건문, 반복문)</h4>
    변수선언 : < c : set var="변수명" value="값" >< / c :set>
    변수출력 : < c : out value="값/변수/수식" />"
    변수제거 : < c : remove var="변수명" />
  </pre>
  <hr/>
  su1변수 선언후 초기값으로 100을 할당? <c:set var="su1" value="100"></c:set><br/>
  값은(200)? <c:out value="200"></c:out><br/>
  1.su1변수의 값은? <c:out value="${su1}"></c:out><br/>
  2.su1변수의 값은? ${su1}<br/>
  3.파라메타변수 sw의 값? ${param.sw}<br/>
  <c:remove var="su1" />
  4.su1변수의 값은? ${su1}<br/>
  <hr/>
  <h4>제어문(조건문(if), 반복문(foreach))</h4>
  <c:set var="su1" value="200"/>
  <c:set var="su2" value="200"/>
  <div>su1과 su2는 
    <c:if test="${su1 > su2}">su1</c:if>
    <c:if test="${su2 > su1}">su2</c:if>
    <c:if test="${su2 == su1}">같다</c:if>
    <c:if test="${su2 != su1}">더 크다.</c:if>
  </div>
  <br/>
  <div>예제 : URL에 sw값에 따른 학점을 출력하시오.(90점이상은 A학점, ~~~~60점 미만은 F학점)</div>
  <!-- " > gt, < lt, >= ge, <= le, == eq, != ne " -->
  <div>
    <c:set var="jumsu" value="${param.sw}"/>
    <!-- 학생들이 시험본 점수에 가산점을 모두 5점씩 부가한다. -->
    <c:set var="jumsu" value="${jumsu + 5}"/>
    <c:if test="${jumsu >= 60}"><c:set var="grade" value="D"/></c:if>
    <c:if test="${jumsu >= 70}"><c:set var="grade" value="C"/></c:if>
    <c:if test="${jumsu >= 80}"><c:set var="grade" value="B"/></c:if>
    <c:if test="${jumsu ge 90}"><c:set var="grade" value="A"/></c:if>
    <c:if test="${jumsu lt 60}"><c:set var="grade" value="F"/></c:if>
    입력받은 점수는 ${jumsu}, 학점은 ${grade} 입니다.
  </div>
  <br/>
  <div>
    학점은 : 
    <c:choose>
    	<c:when test="${jumsu >= 90}">A</c:when>
    	<c:when test="${jumsu >= 80}">B</c:when>
    	<c:when test="${jumsu >= 70}">C</c:when>
    	<c:when test="${jumsu >= 60}">D</c:when>
    	<c:otherwise>F</c:otherwise>
    </c:choose>
    학점<br/>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>