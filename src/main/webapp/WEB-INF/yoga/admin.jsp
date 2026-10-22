<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지 - 마음쉼 요가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  * {
    box-sizing: border-box;
  }
  body {
    margin: 0;
    background: #f5f7f5;
    color: #26332c;
    font-family: Arial, "Malgun Gothic", sans-serif;
  }
  .admin-header {
    background: #fff;
    border-bottom: 1px solid #e3e8e4;
  }
  .header-inner {
    width: 92%;
    max-width: 1200px;
    margin: 0 auto;
    min-height: 74px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .brand {
    color: #198754;
    font-size: 25px;
    font-weight: 700;
    text-decoration: none;
  }
  .header-actions {
    display: flex;
    gap: 8px;
  }
  .header-btn {
    padding: 9px 15px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
  }
  .home-btn {
    color: #198754;
    background: #eaf5ef;
  }
  .logout-btn {
    color: #fff;
    background: #6c757d;
  }
  .admin-wrap {
    width: 92%;
    max-width: 1200px;
    margin: 35px auto 70px;
  }
  .page-title {
    margin-bottom: 8px;
    font-size: 32px;
    font-weight: 700;
  }
  .page-desc {
    margin-bottom: 28px;
    color: #6c757d;
  }
  .summary {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    margin-bottom: 30px;
  }
  .summary-card {
    padding: 22px;
    background: #fff;
    border: 1px solid #e4e9e5;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0,0,0,.04);
  }
  .summary-label {
    color: #6c757d;
    font-size: 14px;
  }
  .summary-number {
    margin-top: 8px;
    font-size: 27px;
    font-weight: 700;
  }
  .menu-title {
    margin: 0 0 15px;
    font-size: 21px;
    font-weight: 700;
  }
  .admin-menu {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 18px;
  }
  .menu-card {
    min-height: 170px;
    padding: 25px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    color: #26332c;
    background: #fff;
    border: 1px solid #e2e8e3;
    border-radius: 14px;
    text-decoration: none;
    box-shadow: 0 4px 15px rgba(0,0,0,.04);
    transition: .2s;
  }
  .menu-card:hover {
    color: #198754;
    transform: translateY(-3px);
    box-shadow: 0 8px 22px rgba(0,0,0,.09);
  }
  .menu-icon {
    font-size: 32px;
  }
  .menu-name {
    margin-top: 15px;
    font-size: 19px;
    font-weight: 700;
  }
  .menu-desc {
    margin-top: 7px;
    color: #6c757d;
    font-size: 14px;
    line-height: 1.5;
  }
  .section {
    margin-top: 36px;
  }
  .notice {
    padding: 22px;
    background: #fff;
    border-left: 4px solid #198754;
    border-radius: 8px;
    border-top: 1px solid #e4e9e5;
    border-right: 1px solid #e4e9e5;
    border-bottom: 1px solid #e4e9e5;
  }
  .footer {
    padding: 25px;
    color: #8a938d;
    text-align: center;
    font-size: 13px;
  }
  @media (max-width: 900px) {
    .summary {
      grid-template-columns: repeat(2, 1fr);
    }
    .admin-menu {
      grid-template-columns: repeat(2, 1fr);
    }
  }
  @media (max-width: 600px) {
    .header-inner {
      min-height: 64px;
    }
    .brand {
      font-size: 20px;
    }
    .admin-wrap {
      margin-top: 25px;
    }
    .summary,
    .admin-menu {
      grid-template-columns: 1fr;
    }
  }
</style>
</head>
<body>
<header class="admin-header">
  <div class="header-inner">
    <a href="${pageContext.request.contextPath}/index.yo" class="brand">마음쉼 요가 관리자</a>
    <div class="header-actions">
      <a href="${pageContext.request.contextPath}/index.yo" class="header-btn home-btn">홈페이지</a>
      <a href="${pageContext.request.contextPath}/index.yo" class="header-btn logout-btn">관리자 종료</a>
    </div>
  </div>
</header>
<main class="admin-wrap">
  <h1 class="page-title">관리자 대시보드</h1>
  <p class="page-desc">요가 콘텐츠와 회원 서비스를 한 곳에서 관리합니다.</p>
  <div class="summary">
    <div class="summary-card">
      <div class="summary-label">요가 콘텐츠</div>
      <div class="summary-number">관리</div>
    </div>
    <div class="summary-card">
      <div class="summary-label">요가 이야기</div>
      <div class="summary-number">관리</div>
    </div>
    <div class="summary-card">
      <div class="summary-label">회원</div>
      <div class="summary-number">관리</div>
    </div>
    <div class="summary-card">
      <div class="summary-label">사이트 상태</div>
      <div class="summary-number">정상</div>
    </div>
  </div>
  <section>
    <h2 class="menu-title">콘텐츠 관리</h2>
    <div class="admin-menu">
      <a href="${pageContext.request.contextPath}/yogaList.yo" class="menu-card">
        <div class="menu-icon">🧘</div>
        <div>
          <div class="menu-name">요가</div>
          <div class="menu-desc">요가 콘텐츠 등록, 조회, 수정, 삭제를 관리합니다.</div>
        </div>
      </a>
      <a href="${pageContext.request.contextPath}/yogaStoryList.yo" class="menu-card">
        <div class="menu-icon">📖</div>
        <div>
          <div class="menu-name">요가스토리</div>
          <div class="menu-desc">요가와 명상에 관한 스토리를 등록, 조회, 수정, 삭제합니다.</div>
        </div>
      </a>
      <a href="${pageContext.request.contextPath}/photoMain.photo" class="menu-card">
        <div class="menu-icon">🖼️</div>
        <div>
          <div class="menu-name">사진·미디어</div>
          <div class="menu-desc">요가 콘텐츠에 사용하는 이미지와 미디어 자료를 관리합니다.</div>
        </div>
      </a>
    </div>
  </section>
  <section class="section">
    <h2 class="menu-title">회원 및 운영 관리</h2>
    <div class="admin-menu">
      <a href="${pageContext.request.contextPath}/memberList.ad" class="menu-card">
        <div class="menu-icon">👥</div>
        <div>
          <div class="menu-name">회원리스트</div>
          <div class="menu-desc">회원 조회, 상태 확인 및 회원 관련 관리를 담당합니다.</div>
        </div>
      </a>
      <a href="${pageContext.request.contextPath}/questionMain.qu" class="menu-card">
        <div class="menu-icon">💬</div>
        <div>
          <div class="menu-name">문의·답변 게시판</div>
          <div class="menu-desc">회원 문의를 확인하고 답변을 등록합니다.</div>
        </div>
      </a>
      <a href="#" class="menu-card">
        <div class="menu-icon">📊</div>
        <div>
          <div class="menu-name">접속·통계</div>
          <div class="menu-desc">콘텐츠 이용 현황과 사이트 운영 지표를 관리합니다.</div>
        </div>
      </a>
    </div>
  </section>
  <section class="section">
    <h2 class="menu-title">사이트 설정</h2>
    <div class="admin-menu">
      <a href="#" class="menu-card">
        <div class="menu-icon">⚙️</div>
        <div>
          <div class="menu-name">기본 설정</div>
          <div class="menu-desc">사이트 제목, 소개 문구 등 기본 정보를 관리합니다.</div>
        </div>
      </a>
      <a href="#" class="menu-card">
        <div class="menu-icon">🔐</div>
        <div>
          <div class="menu-name">관리자 계정</div>
          <div class="menu-desc">관리자 권한과 계정 정보를 관리합니다.</div>
        </div>
      </a>
      <a href="#" class="menu-card">
        <div class="menu-icon">📝</div>
        <div>
          <div class="menu-name">공지사항</div>
          <div class="menu-desc">사이트 공지와 운영 안내를 등록하고 관리합니다.</div>
        </div>
      </a>
    </div>
  </section>
  <section class="section">
    <div class="notice">
      <strong>운영 안내</strong>
      <p class="mb-0 mt-2 text-secondary">요가 콘텐츠, 요가스토리 및 회원리스트 메뉴는 프로젝트의 기존 Controller와 Command에 연결되어 있습니다.</p>
    </div>
  </section>
</main>
<footer class="footer">마음쉼 요가 관리자 페이지</footer>
</body>
</html>
