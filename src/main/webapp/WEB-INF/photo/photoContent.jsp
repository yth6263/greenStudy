<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>포토갤러리 상세보기</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f8f9f7; color: #333; font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; }
    .wrap { width: min(1000px, calc(100% - 32px)); margin: 45px auto 80px; }
    .top { display: flex; align-items: center; justify-content: space-between; gap: 16px; margin-bottom: 22px; }
    h1 { margin: 0; color: #243b30; font-size: 32px; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 18px; border: 1px solid #198754; border-radius: 24px; color: #198754; text-decoration: none; }
    .card { overflow: hidden; border: 1px solid #e5ebe6; border-radius: 16px; background: #fff; box-shadow: 0 5px 20px rgba(0, 0, 0, .07); }
    .head { padding: 24px 28px; border-bottom: 1px solid #edf1ee; }
    .title { margin: 0 0 8px; color: #222; font-size: 25px; }
    .date { color: #87918b; font-size: 14px; }
    .photo-list { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 8px; padding: 8px; background: #f1f4f2; }
    .photo-list img { display: block; width: 100%; max-height: 560px; object-fit: contain; background: #fff; }
    .photo-list img:only-child { grid-column: 1 / -1; max-height: 720px; }
    .content { padding: 28px; color: #4c5d53; font-size: 16px; line-height: 1.8; white-space: pre-wrap; overflow-wrap: anywhere; }
    .empty { padding: 55px 20px; color: #718078; text-align: center; }
    @media (max-width: 640px) {
      .wrap { margin-top: 28px; }
      .top { align-items: flex-start; flex-direction: column; }
      h1 { font-size: 27px; }
      .head, .content { padding: 20px; }
      .photo-list { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top">
      <h1>포토갤러리 상세보기</h1>
      <a class="btn" href="${ctp}/photoList.photo">리스트</a>
    </header>
    <c:choose>
      <c:when test="${not empty photoVo}">
        <article class="card">
          <div class="head">
            <h2 class="title"><c:out value="${photoVo.title}" /></h2>
            <div class="date">등록일: <c:out value="${photoVo.photoDate}" /></div>
          </div>
          <div class="photo-list">
            <c:forEach var="photoName" items="${fn:split(photoVo.photoName, '|')}">
              <img src="${ctp}/images/data/photo/${photoName}" alt="<c:out value='${photoVo.title}'/>">
            </c:forEach>
          </div>
          <div class="content"><c:out value="${photoVo.content}" /></div>
        </article>
      </c:when>
      <c:otherwise>
        <div class="card empty">요청하신 사진·미디어를 찾을 수 없습니다.</div>
      </c:otherwise>
    </c:choose>
  </main>
</body>
</html>
