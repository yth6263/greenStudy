<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${vo.title}" /> | 마음쉼 요가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  * {
    box-sizing: border-box;
  }
  body {
    margin: 0;
    background: #f6f8f6;
    color: #222;
    font-family: "Noto Sans KR","Malgun Gothic",Arial,sans-serif;
  }
  .content-wrap {
    max-width: 980px;
    margin: 50px auto;
    padding: 0 20px;
  }
  .content-card {
    overflow: hidden;
    background: #fff;
    border-radius: 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,.08);
  }
  .content-photo {
    width: 100%;
    height: 520px;
    object-fit: cover;
    display: block;
  }
  .photo-empty {
    height: 520px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #edf1ee;
    color: #7b8580;
    font-size: 1.2rem;
  }
  .content-body {
    padding: 42px 48px 48px;
  }
  .content-part {
    display: inline-block;
    margin-bottom: 14px;
    padding: 6px 12px;
    border-radius: 30px;
    background: #e9f6ef;
    color: #198754;
    font-size: .85rem;
    font-weight: 700;
  }
  .content-title {
    margin: 0;
    font-size: clamp(2rem,4vw,3rem);
    font-weight: 700;
    letter-spacing: -1.5px;
    line-height: 1.25;
  }
  .content-divider {
    margin: 28px 0;
    border-top: 1px solid #e9ecef;
  }
  .content-text {
    white-space: pre-wrap;
    color: #555;
    font-size: 1.05rem;
    line-height: 1.9;
  }
  .related-box {
    margin-top: 35px;
    padding: 22px;
    border-radius: 14px;
    background: #f4f8f5;
  }
  .related-title {
    margin-bottom: 10px;
    font-weight: 700;
    color: #244b3a;
  }
  .bottom-actions {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-top: 35px;
  }
  @media (max-width: 767px) {
    .content-wrap {
      margin: 25px auto;
      padding: 0 12px;
    }
    .content-photo,
    .photo-empty {
      height: 320px;
    }
    .content-body {
      padding: 30px 24px 32px;
    }
  }
</style>
</head>
<body>
<div class="content-wrap">
  <c:choose>
    <c:when test="${not empty vo and vo.idx > 0}">
      <article class="content-card">
        <c:choose>
          <c:when test="${not empty vo.photo}">
            <img src="${pageContext.request.contextPath}/images/data/yoga/<c:out value='${vo.photo}' />" class="content-photo" alt="<c:out value='${vo.title}' />">
          </c:when>
          <c:otherwise>
            <div class="photo-empty">YOGA</div>
          </c:otherwise>
        </c:choose>
        <div class="content-body">
          <div class="content-part"><c:out value="${vo.part}" /></div>
          <h1 class="content-title"><c:out value="${vo.title}" /></h1>
          <div class="content-divider"></div>
          <div class="content-text"><c:out value="${vo.content}" /></div>
          <c:if test="${not empty vo.url}">
            <div class="related-box">
              <div class="related-title">관련 자료</div>
              <a href="<c:out value='${vo.url}' />" target="_blank" rel="noopener noreferrer" class="btn btn-success">관련 자료 보기</a>
            </div>
          </c:if>
          <div class="bottom-actions">
            <a href="${pageContext.request.contextPath}/yogaList.yo" class="btn btn-outline-secondary">← 목록으로</a>
            <a href="${pageContext.request.contextPath}/index.yo#yoga-list" class="btn btn-success">홈으로</a>
          </div>
        </div>
      </article>
    </c:when>
    <c:otherwise>
      <div class="alert alert-warning">
        요청한 요가 콘텐츠를 찾을 수 없습니다.
      </div>
      <a href="${pageContext.request.contextPath}/index.yo" class="btn btn-success">홈으로</a>
    </c:otherwise>
  </c:choose>
</div>
</body>
</html>