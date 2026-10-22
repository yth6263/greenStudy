<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>마음쉼 요가 | 요가와 명상으로 시작하는 하루</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      color: #333;
      background: #f8f9f7;
      font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif;
    }
    a {
      text-decoration: none;
    }
    .main-header {
      background: rgba(255,255,255,.96);
      border-bottom: 1px solid #e9ecef;
      position: sticky;
      top: 0;
      z-index: 1000;
      backdrop-filter: blur(10px);
    }
    .brand {
      color: #244b3a;
      font-size: 1.35rem;
      font-weight: 700;
      letter-spacing: -1px;
    }
    .brand:hover {
      color: #198754;
    }
    .nav-link {
      color: #555;
      font-weight: 500;
    }
    .nav-link:hover {
      color: #198754;
    }
    .admin-btn {
      border-radius: 30px;
      padding: 7px 18px;
      font-weight: 600;
    }
    .hero {
      min-height: 470px;
      display: flex;
      align-items: center;
      background: linear-gradient(90deg, rgba(20,55,40,.80), rgba(20,55,40,.38)), url("${pageContext.request.contextPath}/images/yoga-main.jpg") center / cover no-repeat;
    }
    .hero-content {
      color: #fff;
      max-width: 650px;
    }
    .hero-label {
      display: inline-block;
      padding: 7px 15px;
      border: 1px solid rgba(255,255,255,.5);
      border-radius: 30px;
      margin-bottom: 18px;
      font-size: .9rem;
    }
    .hero h1 {
      font-size: clamp(2.2rem, 5vw, 4rem);
      line-height: 1.2;
      font-weight: 700;
      letter-spacing: -2px;
    }
    .hero p {
      font-size: 1.1rem;
      line-height: 1.8;
      opacity: .92;
    }
    .hero-btn {
      border-radius: 30px;
      padding: 11px 25px;
      font-weight: 600;
    }
    .section {
      padding: 75px 0;
    }
    .section-title {
      font-weight: 700;
      letter-spacing: -1px;
    }
    .section-description {
      color: #777;
      margin-bottom: 35px;
    }
    .yoga-card,
    .story-card {
      border: 0;
      border-radius: 16px;
      overflow: hidden;
      background: #fff;
      box-shadow: 0 5px 20px rgba(0,0,0,.07);
      height: 100%;
      transition: transform .25s ease, box-shadow .25s ease;
    }
    .yoga-card:hover,
    .story-card:hover {
      transform: translateY(-7px);
      box-shadow: 0 12px 28px rgba(0,0,0,.12);
    }
    .yoga-photo,
    .story-photo {
      width: 100%;
      height: 230px;
      object-fit: cover;
    }
    .yoga-card-body,
    .story-card-body {
      padding: 20px;
    }
    .category-badge {
      color: #198754;
      background: #e9f6ef;
      border-radius: 30px;
      padding: 5px 11px;
      font-size: .78rem;
      font-weight: 600;
    }
    .yoga-title,
    .story-title {
      margin-top: 13px;
      margin-bottom: 8px;
      font-size: 1.15rem;
      font-weight: 700;
      color: #222;
    }
    .yoga-description {
      color: #777;
      font-size: .9rem;
      line-height: 1.6;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
    .story-description {
      color: #777;
      font-size: .9rem;
      line-height: 1.6;
      display: -webkit-box;
      -webkit-line-clamp: 5;
      -webkit-box-orient: vertical;
      overflow: hidden;
      min-height: 7.2em;
    }
    .story-section {
      background: #fff;
    }
    .photo-gallery-section {
      padding: 30px 0 70px;
      background: #fff;
    }
    .photo-gallery-grid {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 22px;
    }
    .photo-gallery-card {
      overflow: hidden;
      height: 100%;
      border: 1px solid #e7ece8;
      border-radius: 16px;
      background: #fff;
      box-shadow: 0 5px 20px rgba(0, 0, 0, .07);
      transition: transform .2s ease, box-shadow .2s ease;
    }
    .photo-gallery-link {
      display: block;
      height: 100%;
      color: inherit;
    }
    .photo-gallery-link:hover .photo-gallery-card {
      transform: translateY(-5px);
      box-shadow: 0 12px 26px rgba(0, 0, 0, .12);
    }
    .photo-gallery-image {
      display: block;
      width: 100%;
      height: 220px;
      object-fit: cover;
    }
    .photo-gallery-body {
      padding: 18px 20px 20px;
    }
    .photo-gallery-title {
      margin: 0 0 6px;
      color: #222;
      font-size: 1.1rem;
      font-weight: 700;
    }
    .photo-gallery-date {
      margin-bottom: 10px;
      color: #87918b;
      font-size: .82rem;
    }
    .photo-gallery-description {
      display: -webkit-box;
      min-height: 3.2em;
      margin: 0;
      overflow: hidden;
      color: #777;
      font-size: .9rem;
      line-height: 1.6;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 2;
    }
    .info-banner {
      background: #e9f4ed;
      border-radius: 20px;
      padding: 45px;
    }
    .info-icon {
      width: 58px;
      height: 58px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      background: #198754;
      color: #fff;
      font-size: 1.5rem;
      font-weight: 700;
    }
    .main-footer {
      background: #202923;
      color: #d7ded9;
      padding: 50px 0 25px;
    }
    .footer-brand {
      color: #fff;
      font-size: 1.3rem;
      font-weight: 700;
    }
    .footer-link {
      color: #bfc9c2;
    }
    .footer-link:hover {
      color: #fff;
    }
    .copyright {
      border-top: 1px solid rgba(255,255,255,.1);
      margin-top: 35px;
      padding-top: 20px;
      color: #909b94;
      font-size: .85rem;
    }
    #scrollTopBtn {
      display: none;
      position: fixed;
      right: 25px;
      bottom: 25px;
      width: 48px;
      height: 48px;
      border: 0;
      border-radius: 50%;
      background: #198754;
      color: #fff;
      font-size: 24px;
      line-height: 48px;
      text-align: center;
      cursor: pointer;
      box-shadow: 0 4px 12px rgba(0,0,0,.2);
      z-index: 1050;
      transition: opacity .2s ease, transform .2s ease;
    }
    #scrollTopBtn:hover {
      background: #146c43;
      transform: translateY(-3px);
    }
    @media (max-width: 767px) {
      .hero {
        min-height: 430px;
      }
      .section {
        padding: 55px 0;
      }
      .info-banner {
        padding: 30px 22px;
      }
      .yoga-photo,
      .story-photo {
        height: 210px;
      }
      .photo-gallery-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }
      .photo-gallery-link:nth-child(n+5) {
        display: none;
      }
    }
    @media (max-width: 575px) {
      .photo-gallery-grid {
        grid-template-columns: 1fr;
      }
      .photo-gallery-link:nth-child(n+3) {
        display: none;
      }
    }
  </style>
</head>
<body>
  <header class="main-header">
    <nav class="navbar navbar-expand-lg">
      <div class="container">
        <a class="navbar-brand brand" href="${pageContext.request.contextPath}/index.yo">마음쉼 요가</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="메뉴 열기">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
          <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link px-3" href="#yoga-list">요가</a></li>
            <li class="nav-item"><a class="nav-link px-3" href="#story-list">요가 이야기</a></li>
            <li class="nav-item"><a class="nav-link px-3" href="#about">마음챙김</a></li>
            <li class="nav-item"><a class="nav-link px-3" href="${pageContext.request.contextPath}/questionMain.qu">문의&amp;답변</a></li>
          </ul>
          <c:choose>
            <c:when test="${not empty sessionScope.sLevel and sessionScope.sLevel <= 4}">
              <span class="me-2"><c:out value="${sessionScope.sMid}" />님</span>
              <c:if test="${sessionScope.sMid eq 'admin'}">
                <a href="${pageContext.request.contextPath}/admin.yo" class="btn btn-success admin-btn me-2">관리자메뉴</a>
              </c:if>
              <a href="${pageContext.request.contextPath}/memberLogout.mem" class="btn btn-success admin-btn">로그아웃</a>
            </c:when>
            <c:otherwise>
              <a href="${pageContext.request.contextPath}/adminLogin.mem" class="btn btn-success admin-btn">관리자</a>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </nav>
  </header>
  <section class="hero">
    <div class="container">
      <div class="hero-content">
        <span class="hero-label">YOGA & MINDFULNESS</span>
        <h1>잠시 멈추고,<br>나에게 집중하는 시간</h1>
        <p class="mt-3 mb-4">요가와 명상으로 몸의 긴장을 내려놓고<br>복잡한 마음을 편안하게 정리해보세요.</p>
        <a href="#yoga-list" class="btn btn-light hero-btn">요가 프로그램 보기</a>
      </div>
    </div>
  </section>
  <section id="yoga-list" class="section">
    <div class="container">
      <div class="text-center">
        <h2 class="section-title">지금 만나는 요가</h2>
        <p class="section-description">현재 서비스중인 요가와 명상 콘텐츠를 만나보세요.</p>
      </div>
      <div class="row g-4">
        <c:choose>
          <c:when test="${not empty yogaVos}">
            <c:forEach var="vo" items="${yogaVos}" begin="0" end="7">
              <div class="col-12 col-sm-6 col-lg-3">
                <c:url var="contentUrl" value="/yogaContent.yo">
                  <c:param name="idx" value="${vo.idx}" />
                </c:url>
                <a href="${contentUrl}" class="text-decoration-none">
                  <div class="card yoga-card">
                    <c:choose>
                      <c:when test="${not empty vo.photo}">
                        <img src="${pageContext.request.contextPath}/images/data/yoga/<c:out value='${vo.photo}'/>" class="yoga-photo" alt="<c:out value='${vo.title}'/>">
                      </c:when>
                      <c:otherwise>
                        <div class="yoga-photo d-flex align-items-center justify-content-center bg-light text-secondary">YOGA</div>
                      </c:otherwise>
                    </c:choose>
                    <div class="yoga-card-body">
                      <span class="category-badge"><c:out value="${vo.part}" /></span>
                      <h3 class="yoga-title"><c:out value="${vo.title}" /></h3>
                      <p class="yoga-description mb-0"><c:out value="${vo.content}" /></p>
                    </div>
                  </div>
                </a>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <div class="col-12">
              <div class="text-center text-secondary py-5">등록된 요가 콘텐츠가 없습니다.</div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
      <div class="text-center mt-5">
        <a href="${pageContext.request.contextPath}/yogaList.yo" class="btn btn-outline-success rounded-pill px-4">전체 요가 보기</a>
      </div>
    </div>
  </section>
  <section id="story-list" class="section story-section">
    <div class="container">
      <div class="text-center">
        <h2 class="section-title">요가와 함께 알아두면 좋은 이야기</h2>
        <p class="section-description">몸을 움직이는 것에서 한 걸음 더 나아가 마음을 돌보는 이야기를 소개합니다.</p>
      </div>
      <div class="row g-4">
        <c:choose>
          <c:when test="${not empty storyVos}">
            <c:forEach var="story" items="${storyVos}">
              <div class="col-12 col-md-6 col-lg-4">
                <c:url var="storyContentUrl" value="/yogaStoryContent.yo">
                  <c:param name="idx" value="${story.idx}" />
                </c:url>
                <a href="${storyContentUrl}" class="text-decoration-none text-dark">
                  <article class="story-card">
                    <c:choose>
                      <c:when test="${not empty story.photo}">
                        <img src="${pageContext.request.contextPath}/images/data/yogaStory/<c:out value='${story.photo}'/>" class="story-photo" alt="<c:out value='${story.title}'/>">
                      </c:when>
                      <c:otherwise>
                        <div class="story-photo d-flex align-items-center justify-content-center bg-light text-secondary">YOGA STORY</div>
                      </c:otherwise>
                    </c:choose>
                    <div class="story-card-body">
                      <span class="category-badge"><c:out value="${story.part}" /></span>
                      <h3 class="story-title"><c:out value="${story.title}" /></h3>
                      <p class="story-description mb-0"><c:out value="${story.content}" /></p>
                    </div>
                  </article>
                </a>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <div class="col-12">
              <div class="text-center text-secondary py-5">등록된 요가스토리가 없습니다.</div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
      <div class="text-center mt-5">
        <a href="${pageContext.request.contextPath}/yogaList.yo" class="btn btn-outline-success rounded-pill px-4">요가스토리 전체 보기</a>
      </div>
    </div>
  </section>
  <section id="photo-gallery" class="section photo-gallery-section">
    <div class="container">
      <div class="text-center mb-4">
        <h2 class="section-title">포토갤러리</h2>
        <p class="section-description mb-0">마음쉼 요가의 사진과 미디어를 만나보세요.</p>
      </div>
      <div class="photo-gallery-grid">
        <c:choose>
          <c:when test="${not empty photoVos}">
            <c:forEach var="photo" items="${photoVos}">
              <c:url var="photoContentUrl" value="/photoContent.photo">
                <c:param name="idx" value="${photo.idx}" />
              </c:url>
              <a class="photo-gallery-link" href="${photoContentUrl}">
                <article class="photo-gallery-card">
                  <img class="photo-gallery-image" src="${pageContext.request.contextPath}/images/data/photo/${fn:substringBefore(photo.photoName, '|')}" alt="<c:out value='${photo.title}'/>" loading="lazy">
                  <div class="photo-gallery-body">
                    <h3 class="photo-gallery-title"><c:out value="${photo.title}" /></h3>
                    <div class="photo-gallery-date"><c:out value="${photo.photoDate}" /></div>
                    <p class="photo-gallery-description"><c:out value="${photo.content}" /></p>
                  </div>
                </article>
              </a>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <p class="col-12 text-center text-secondary py-4">등록된 포토갤러리가 없습니다.</p>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </section>
  <section id="about" class="section">
    <div class="container">
      <div class="info-banner">
        <div class="row align-items-center g-4">
          <div class="col-md-2 text-center">
            <div class="info-icon mx-auto">Y</div>
          </div>
          <div class="col-md-7">
            <h2 class="section-title mb-3">요가는 나를 관찰하는 시간입니다.</h2>
            <p class="mb-0 text-secondary">잘하는 것보다 중요한 것은 지금 나의 몸과 마음을 알아차리는 것입니다. 오늘의 상태에 맞는 요가와 명상을 선택해보세요.</p>
          </div>
          <div class="col-md-3 text-md-end">
            <a href="${pageContext.request.contextPath}/yogaMusic.yo" class="btn btn-success rounded-pill px-4">콘텐츠 시작하기</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer class="main-footer">
    <div class="container">
      <div class="row g-4">
        <div class="col-md-6">
          <div class="footer-brand">마음쉼 요가</div>
          <p class="mt-3 mb-0">요가와 명상을 통해 몸과 마음의 균형을 찾아가는 공간입니다.</p>
        </div>
        <div class="col-md-3">
          <h6 class="text-white">바로가기</h6>
          <ul class="list-unstyled mt-3">
            <li class="mb-2"><a class="footer-link" href="${pageContext.request.contextPath}/yogaList.yo">요가 콘텐츠</a></li>
            <li class="mb-2"><a class="footer-link" href="${pageContext.request.contextPath}/yogaStory.yo">요가스토리</a></li>
          </ul>
        </div>
        <div class="col-md-3">
          <h6 class="text-white">관리자</h6>
          <ul class="list-unstyled mt-3">
            <li><a class="footer-link" href="mailto:yth6263@gmail.com">yth6263@gmail.com</a></li>
          </ul>
        </div>
      </div>
      <div class="copyright">© 2026 마음쉼 요가. All rights reserved.</div>
    </div>
  </footer>
  <button type="button" id="scrollTopBtn" title="위로 가기" aria-label="위로 가기">↑</button>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    const scrollTopBtn = document.getElementById("scrollTopBtn");
    window.addEventListener("scroll", function() {
      scrollTopBtn.style.display = window.scrollY > 300 ? "block" : "none";
    });
    scrollTopBtn.addEventListener("click", function() {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  </script>
</body>
</html>
