<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><c:out value="${vo.title}" /> | 마음쉼 요가</title>
  <style>
    *{box-sizing:border-box}
    body{margin:0;background:#f5f8f6;color:#18251f;font-family:"Noto Sans KR","Malgun Gothic",sans-serif}
    .container{width:calc(100% - 40px);max-width:900px;margin:0 auto;padding:50px 0}
    .top{display:flex;justify-content:space-between;align-items:center;margin-bottom:30px}
    .brand{color:#244b3a;font-size:24px;font-weight:700;text-decoration:none}
    .btn{display:inline-flex;align-items:center;justify-content:center;height:42px;padding:0 18px;border:1px solid #9aa8a1;border-radius:8px;background:#fff;color:#43534b;text-decoration:none}
    .card{overflow:hidden;border:1px solid #dfe6e2;border-radius:18px;background:#fff;box-shadow:0 8px 24px rgba(24,37,31,.06)}
    .photo{display:block;width:100%;max-height:520px;object-fit:cover}
    .body{padding:35px}
    .part{display:inline-block;padding:6px 12px;border-radius:20px;background:#e9f6ef;color:#198754;font-size:14px;font-weight:700}
    h1{margin:18px 0 20px;font-size:36px;line-height:1.35;letter-spacing:-1px}
    .content{color:#596760;font-size:17px;line-height:1.9;white-space:pre-wrap}
    @media(max-width:700px){.container{width:calc(100% - 24px);padding:25px 0}.body{padding:24px}h1{font-size:28px}}
  </style>
</head>
<body>
  <div class="container">
    <div class="top">
      <a class="brand" href="${pageContext.request.contextPath}/index.yo">마음쉼 요가</a>
      <a class="btn" href="${pageContext.request.contextPath}/yogaStoryList.yo">목록으로</a>
    </div>
    <c:choose>
      <c:when test="${not empty vo}">
        <article class="card">
          <c:if test="${not empty vo.photo}">
            <img class="photo" src="${pageContext.request.contextPath}/images/data/yogaStory/${vo.photo}" alt="${vo.title}">
          </c:if>
          <div class="body">
            <span class="part"><c:out value="${vo.part}" /></span>
            <h1><c:out value="${vo.title}" /></h1>
            <div class="content"><c:out value="${vo.content}" /></div>
          </div>
        </article>
      </c:when>
      <c:otherwise>
        <div class="card body">등록된 요가스토리 정보를 찾을 수 없습니다.</div>
      </c:otherwise>
    </c:choose>
  </div>
</body>
</html>
