<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>문의 등록</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f8f6; color: #20342b; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .wrap { width: min(850px, calc(100% - 32px)); margin: 48px auto; }
    .top { display: flex; justify-content: space-between; align-items: center; margin-bottom: 22px; }
    h1 { margin: 0; font-size: 32px; }
    .card { padding: 28px; border: 1px solid #e0e8e3; border-radius: 13px; background: #fff; }
    .field { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: 700; }
    select, textarea, input[type=file] { width: 100%; padding: 12px; border: 1px solid #d4dfd8; border-radius: 7px; background: #fff; font: inherit; }
    textarea { min-height: 240px; resize: vertical; line-height: 1.7; }
    .actions { display: flex; justify-content: flex-end; gap: 8px; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 42px; padding: 0 17px; border: 1px solid #cbd8d0; border-radius: 7px; background: #fff; color: #35483e; text-decoration: none; font: inherit; cursor: pointer; }
    .primary { border-color: #188653; background: #188653; color: #fff; }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top"><h1>문의 등록</h1><a class="btn" href="${ctp}/questionList.qu">목록으로</a></header>
    <form class="card" action="${ctp}/questionInputOk.qu" method="post" enctype="multipart/form-data">
      <div class="field">
        <label for="part">문의 분류</label>
        <select id="part" name="part" required>
          <option value="">분류를 선택하세요.</option>
          <option value="요가">요가</option><option value="요가스토리">요가스토리</option><option value="명상">명상</option><option value="포토갤러리">포토갤러리</option><option value="회원">회원</option>
        </select>
      </div>
      <div class="field"><label for="content">문의 내용</label><textarea id="content" name="content" maxlength="10000" required placeholder="문의하실 내용을 입력하세요."></textarea></div>
      <div class="field"><label for="questionPhoto">첨부 사진 (선택)</label><input type="file" id="questionPhoto" name="questionPhoto" accept=".jpg,.jpeg,.png,.gif,.webp"><small>JPG, PNG, GIF, WEBP 형식, 최대 10MB</small></div>
      <div class="actions"><a class="btn" href="${ctp}/questionList.qu">취소</a><button class="btn primary" type="submit">문의 등록</button></div>
    </form>
  </main>
</body>
</html>
