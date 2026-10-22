<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사진·미디어 관리</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f7f5; color: #26332c; font-family: Arial, "Malgun Gothic", sans-serif; }
    .wrap { width: 92%; max-width: 1200px; margin: 32px auto 70px; }
    .top { display: flex; align-items: center; justify-content: space-between; gap: 16px; margin-bottom: 28px; }
    h1 { margin: 0; font-size: 32px; }
    .top-actions, .card-actions { display: flex; align-items: center; gap: 8px; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 16px; border: 1px solid #cad5ce; border-radius: 7px; background: #fff; color: #31443a; font: inherit; text-decoration: none; cursor: pointer; }
    .btn-primary { border-color: #198754; background: #198754; color: #fff; }
    .btn-danger { border-color: #c94c4c; background: #c94c4c; color: #fff; }
    .panel { margin-bottom: 28px; padding: 24px; border: 1px solid #e1e8e3; border-radius: 14px; background: #fff; box-shadow: 0 4px 15px rgba(0, 0, 0, .04); }
    .panel h2 { margin: 0 0 18px; font-size: 21px; }
    .field { margin-bottom: 16px; }
    label { display: block; margin-bottom: 7px; font-weight: 700; }
    input[type="text"], textarea, input[type="file"] { width: 100%; padding: 11px 12px; border: 1px solid #d5dfd9; border-radius: 7px; font: inherit; }
    textarea { min-height: 120px; resize: vertical; line-height: 1.6; }
    .help { margin-top: 6px; color: #718078; font-size: 13px; }
    .gallery { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 18px; }
    .item { overflow: hidden; border: 1px solid #e1e8e3; border-radius: 13px; background: #fff; box-shadow: 0 4px 15px rgba(0, 0, 0, .04); }
    .photos { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 4px; background: #eef2ef; }
    .photos img { display: block; width: 100%; height: 180px; object-fit: cover; }
    .photos img:only-child { grid-column: 1 / -1; height: 230px; }
    .item-body { padding: 18px; }
    .item-title { margin: 0 0 7px; font-size: 19px; }
    .date { margin-bottom: 12px; color: #718078; font-size: 13px; }
    .content { min-height: 48px; margin: 0; color: #4c5d53; line-height: 1.6; white-space: pre-wrap; overflow-wrap: anywhere; }
    details { margin-top: 16px; padding-top: 14px; border-top: 1px solid #edf1ee; }
    summary { color: #198754; font-weight: 700; cursor: pointer; }
    .edit-form { padding-top: 14px; }
    .edit-form textarea { min-height: 100px; }
    .empty { grid-column: 1 / -1; padding: 45px 20px; border: 1px dashed #cbd6cf; border-radius: 12px; color: #718078; text-align: center; background: #fff; }
    @media (max-width: 900px) { .gallery { grid-template-columns: repeat(2, minmax(0, 1fr)); } }
    @media (max-width: 600px) {
      .wrap { width: calc(100% - 24px); margin-top: 22px; }
      .top { align-items: flex-start; flex-direction: column; }
      .top-actions { width: 100%; }
      .top-actions .btn { flex: 1; }
      .gallery { grid-template-columns: 1fr; }
      .panel { padding: 18px; }
    }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top">
      <h1>사진·미디어 관리</h1>
      <nav class="top-actions">
        <a class="btn" href="${ctp}/index.yo">홈으로</a>
        <a class="btn btn-primary" href="${ctp}/admin.yo">관리자 대시보드</a>
      </nav>
    </header>
    <section class="panel">
      <h2>사진·미디어 등록</h2>
      <form action="${ctp}/photoInput.photo" method="post" enctype="multipart/form-data">
        <div class="field">
          <label for="title">제목</label>
          <input type="text" id="title" name="title" maxlength="200" required>
        </div>
        <div class="field">
          <label for="content">설명</label>
          <textarea id="content" name="content" required></textarea>
        </div>
        <div class="field">
          <label for="photoFiles">사진 리스트</label>
          <input type="file" id="photoFiles" name="photoFiles" accept="image/jpeg,image/png,image/gif,image/webp" multiple required>
          <div class="help">사진을 한 장 이상 선택할 수 있습니다. JPG, PNG, GIF, WEBP / 한 장당 최대 10MB</div>
        </div>
        <button class="btn btn-primary" type="submit">사진·미디어 등록</button>
      </form>
    </section>
    <section>
      <h2>등록된 갤러리</h2>
      <div class="gallery">
        <c:choose>
          <c:when test="${empty photoVos}">
            <div class="empty">등록된 사진·미디어가 없습니다.</div>
          </c:when>
          <c:otherwise>
            <c:forEach var="vo" items="${photoVos}">
              <article class="item">
                <div class="photos">
                  <c:forEach var="photoName" items="${fn:split(vo.photoName, '|')}">
                    <img src="${ctp}/images/data/photo/${photoName}" alt="<c:out value='${vo.title}'/>" loading="lazy">
                  </c:forEach>
                </div>
                <div class="item-body">
                  <h3 class="item-title"><c:out value="${vo.title}" /></h3>
                  <div class="date">등록일: <c:out value="${vo.photoDate}" /></div>
                  <p class="content"><c:out value="${vo.content}" /></p>
                  <details>
                    <summary>수정</summary>
                    <form class="edit-form" action="${ctp}/photoUpdate.photo" method="post" enctype="multipart/form-data">
                      <input type="hidden" name="idx" value="${vo.idx}">
                      <div class="field">
                        <label for="title${vo.idx}">제목</label>
                        <input type="text" id="title${vo.idx}" name="title" maxlength="200" value="<c:out value='${vo.title}'/>" required>
                      </div>
                      <div class="field">
                        <label for="content${vo.idx}">설명</label>
                        <textarea id="content${vo.idx}" name="content" required><c:out value="${vo.content}" /></textarea>
                      </div>
                      <div class="field">
                        <label for="files${vo.idx}">사진 교체</label>
                        <input type="file" id="files${vo.idx}" name="photoFiles" accept="image/jpeg,image/png,image/gif,image/webp" multiple>
                        <div class="help">새 사진을 선택하면 기존 사진 목록을 새 사진으로 교체합니다. 선택하지 않으면 기존 사진을 유지합니다.</div>
                      </div>
                      <div class="card-actions">
                        <button class="btn btn-primary" type="submit">수정 저장</button>
                      </div>
                    </form>
                    <form action="${ctp}/photoDelete.photo" method="post" onsubmit="return confirm('이 갤러리를 삭제하시겠습니까?')">
                      <input type="hidden" name="idx" value="${vo.idx}">
                      <button class="btn btn-danger" type="submit">삭제</button>
                    </form>
                  </details>
                </div>
              </article>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>
    </section>
  </main>
</body>
</html>
