<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>포토갤러리</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f8f9f7; color: #333; font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; }
    .wrap { width: min(1120px, calc(100% - 32px)); margin: 48px auto 80px; }
    .top { display: flex; align-items: center; justify-content: space-between; gap: 16px; margin-bottom: 30px; }
    h1 { margin: 0; color: #243b30; font-size: 34px; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 18px; border: 1px solid #198754; border-radius: 24px; color: #198754; text-decoration: none; }
    .grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 22px; }
    .link { display: block; height: 100%; color: inherit; text-decoration: none; }
    .card { overflow: hidden; height: 100%; border-radius: 16px; background: #fff; box-shadow: 0 5px 20px rgba(0, 0, 0, .07); transition: transform .2s ease, box-shadow .2s ease; }
    .link:hover .card { transform: translateY(-5px); box-shadow: 0 12px 26px rgba(0, 0, 0, .12); }
    .cover { display: block; width: 100%; height: 220px; object-fit: cover; }
    .body { padding: 18px 20px 20px; }
    h2 { margin: 0 0 7px; color: #222; font-size: 19px; }
    .date { margin-bottom: 10px; color: #87918b; font-size: 13px; }
    .description { display: -webkit-box; min-height: 3.2em; margin: 0; overflow: hidden; color: #68736c; line-height: 1.6; white-space: pre-wrap; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
    .empty { grid-column: 1 / -1; padding: 55px 20px; border: 1px dashed #cbd6cf; border-radius: 12px; color: #718078; text-align: center; background: #fff; }
    @media (max-width: 850px) { .grid { grid-template-columns: repeat(2, minmax(0, 1fr)); } }
    @media (max-width: 580px) {
      .wrap { margin-top: 28px; }
      .top { align-items: flex-start; flex-direction: column; }
      .grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top">
      <h1>포토갤러리</h1>
      <a class="btn" href="${ctp}/index.yo">홈으로</a>
    </header>
    <div class="grid">
      <c:choose>
        <c:when test="${not empty photoVos}">
          <c:forEach var="photo" items="${photoVos}">
            <c:url var="photoContentUrl" value="/photoContent.photo">
              <c:param name="idx" value="${photo.idx}" />
            </c:url>
            <a class="link" href="${photoContentUrl}">
              <article class="card">
                <img class="cover" src="${ctp}/images/data/photo/${fn:substringBefore(photo.photoName, '|')}" alt="<c:out value='${photo.title}'/>" loading="lazy">
                <div class="body">
                  <h2><c:out value="${photo.title}" /></h2>
                  <div class="date"><c:out value="${photo.photoDate}" /></div>
                  <p class="description"><c:out value="${photo.content}" /></p>
                </div>
              </article>
            </a>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="empty">등록된 포토갤러리가 없습니다.</div>
        </c:otherwise>
      </c:choose>
    </div>
  </main>
</body>
</html>
