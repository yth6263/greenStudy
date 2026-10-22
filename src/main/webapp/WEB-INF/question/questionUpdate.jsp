<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>문의 수정</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f8f6; color: #20342b; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .wrap { width: min(850px, calc(100% - 32px)); margin: 48px auto; }
    h1 { margin: 0 0 22px; font-size: 32px; }
    .card { padding: 28px; border: 1px solid #e0e8e3; border-radius: 13px; background: #fff; }
    .field { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: 700; }
    select, textarea, input[type=file] { width: 100%; padding: 12px; border: 1px solid #d4dfd8; border-radius: 7px; background: #fff; font: inherit; }
    textarea { min-height: 240px; resize: vertical; line-height: 1.7; }
    img { display: block; max-width: 260px; max-height: 220px; margin: 8px 0; object-fit: contain; }
    .actions { display: flex; justify-content: flex-end; gap: 8px; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 42px; padding: 0 17px; border: 1px solid #cbd8d0; border-radius: 7px; background: #fff; color: #35483e; text-decoration: none; font: inherit; cursor: pointer; }
    .primary { border-color: #188653; background: #188653; color: #fff; }
  </style>
</head>
<body>
  <main class="wrap">
    <h1>문의 수정</h1>
    <form class="card" action="${ctp}/questionUpdateOk.qu" method="post" enctype="multipart/form-data">
      <input type="hidden" name="idx" value="${questionVo.idx}">
      <div class="field">
        <label for="part">문의 분류</label>
        <select id="part" name="part" required>
          <option value="요가" ${questionVo.part eq '요가' ? 'selected' : ''}>요가</option><option value="요가스토리" ${questionVo.part eq '요가스토리' ? 'selected' : ''}>요가스토리</option><option value="명상" ${questionVo.part eq '명상' ? 'selected' : ''}>명상</option><option value="포토갤러리" ${questionVo.part eq '포토갤러리' ? 'selected' : ''}>포토갤러리</option><option value="회원" ${questionVo.part eq '회원' ? 'selected' : ''}>회원</option>
        </select>
      </div>
      <div class="field"><label for="content">문의 내용</label><textarea id="content" name="content" maxlength="10000" required><c:out value="${questionVo.content}" /></textarea></div>
      <div class="field">
        <label for="questionPhoto">첨부 사진 (선택)</label>
        <c:if test="${not empty questionVo.questionPhoto}"><img src="${ctp}/images/data/question/${questionVo.questionPhoto}" alt="첨부된 문의 사진"></c:if>
        <input type="file" id="questionPhoto" name="questionPhoto" accept=".jpg,.jpeg,.png,.gif,.webp">
        <small>새 사진을 선택하지 않으면 기존 사진을 유지합니다.</small>
      </div>
      <div class="actions"><a class="btn" href="${ctp}/questionContent.qu?idx=${questionVo.idx}">취소</a><button class="btn primary" type="submit">수정 저장</button></div>
    </form>
  </main>
</body>
</html>
