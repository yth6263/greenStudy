<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>요가스토리 수정</title>
<style>
  * { box-sizing: border-box; }
  body {
    margin: 0;
    font-family: "Noto Sans KR", "Malgun Gothic", sans-serif;
    background: #f5f8f6;
    color: #18231f;
  }
  .wrap {
    width: min(900px, calc(100% - 40px));
    margin: 45px auto 80px;
  }
  .top {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 25px;
  }
  .top h1 {
    margin: 0;
    font-size: 34px;
    font-weight: 800;
    letter-spacing: -1.5px;
  }
  .top p {
    margin: 8px 0 0;
    color: #718078;
    font-size: 16px;
  }
  .btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 40px;
    padding: 0 18px;
    border: 1px solid #82908a;
    border-radius: 7px;
    background: #fff;
    color: #52605a;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
  }
  .btn-primary {
    border-color: #168653;
    background: #168653;
    color: #fff;
    font-weight: 700;
  }
  .card {
    overflow: hidden;
    border: 1px solid #dce5e0;
    border-radius: 14px;
    background: #fff;
    box-shadow: 0 8px 25px rgba(31, 60, 47, 0.06);
  }
  .card-title {
    padding: 19px 28px;
    background: #168653;
    color: #fff;
    font-size: 17px;
    font-weight: 700;
  }
  form { padding: 30px; }
  .field { margin-bottom: 25px; }
  label {
    display: block;
    margin-bottom: 9px;
    font-size: 15px;
    font-weight: 700;
  }
  .required { color: #e05252; }
  input[type="text"], select, textarea, input[type="file"] {
    width: 100%;
    border: 1px solid #d5ded9;
    border-radius: 7px;
    background: #fff;
    font-family: inherit;
    font-size: 15px;
  }
  input[type="text"], select {
    height: 42px;
    padding: 0 12px;
  }
  textarea {
    min-height: 230px;
    padding: 13px;
    line-height: 1.7;
    resize: vertical;
  }
  input[type="file"] { padding: 9px; }
  input:focus, select:focus, textarea:focus {
    outline: none;
    border-color: #75b99a;
    box-shadow: 0 0 0 3px rgba(22, 134, 83, 0.10);
  }
  .help {
    margin-top: 7px;
    color: #84908a;
    font-size: 13px;
  }
  .current-photo {
    margin-bottom: 12px;
    padding: 14px;
    border: 1px solid #e1e8e4;
    border-radius: 8px;
    background: #fafcfb;
  }
  .current-photo-title {
    margin-bottom: 10px;
    color: #53625b;
    font-size: 13px;
    font-weight: 700;
  }
  .current-photo img {
    display: block;
    width: 180px;
    height: 120px;
    object-fit: cover;
    border-radius: 7px;
    border: 1px solid #dce5e0;
  }
  .current-photo-name {
    margin-top: 8px;
    color: #748078;
    font-size: 12px;
    word-break: break-all;
  }
  .actions {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 30px;
    padding-top: 24px;
    border-top: 1px solid #e8eeeb;
  }
  @media (max-width: 650px) {
    .wrap {
      width: calc(100% - 24px);
      margin-top: 25px;
    }
    .top {
      align-items: flex-start;
      gap: 15px;
    }
    .top h1 { font-size: 28px; }
    form { padding: 20px; }
    .card-title { padding: 16px 20px; }
    .current-photo img {
      width: 100%;
      max-width: 300px;
      height: auto;
    }
  }
</style>
</head>
<body>
<div class="wrap">
  <div class="top">
    <div>
      <h1>요가스토리 수정</h1>
      <p>등록된 요가스토리의 내용을 수정합니다.</p>
    </div>
    <a href="yogaStory.yo" class="btn">요가스토리 목록</a>
  </div>

  <div class="card">
    <div class="card-title">요가스토리 정보 수정</div>

    <form action="yogaStoryUpdateOk.yo" method="post" enctype="multipart/form-data">
      <input type="hidden" name="idx" value="${vo.idx}">
      <input type="hidden" name="oldPhoto" value="${vo.photo}">

      <div class="field">
        <label for="part">요가 종류 <span class="required">*</span></label>
        <select id="part" name="part" required>
          <option value="">요가 종류를 선택하세요.</option>
          <option value="집중명상" ${vo.part eq '집중명상' ? 'selected' : ''}>집중명상</option>
          <option value="통찰명상" ${vo.part eq '통찰명상' ? 'selected' : ''}>통찰명상</option>
          <option value="자애명상" ${vo.part eq '자애명상' ? 'selected' : ''}>자애명상</option>
          <option value="호흡명상" ${vo.part eq '호흡명상' ? 'selected' : ''}>호흡명상</option>
          <option value="기타" ${vo.part eq '기타' ? 'selected' : ''}>기타</option>
        </select>
      </div>

      <div class="field">
        <label for="title">제목 <span class="required">*</span></label>
        <input type="text" id="title" name="title" maxlength="100"
          value="<c:out value='${vo.title}'/>" required>
      </div>

      <div class="field">
        <label for="content">내용</label>
        <textarea id="content" name="content"><c:out value="${vo.content}"/></textarea>
      </div>

      <div class="field">
        <label>현재 사진</label>
        <div class="current-photo">
          <div class="current-photo-title">현재 등록된 사진</div>
          <c:choose>
            <c:when test="${not empty vo.photo}">
              <img src="${pageContext.request.contextPath}/images/data/yogaStory/${vo.photo}"
                alt="현재 요가스토리 사진">
              <div class="current-photo-name">${vo.photo}</div>
            </c:when>
            <c:otherwise>
              <div class="help">등록된 사진이 없습니다.</div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

      <div class="field">
        <label for="photo">새 사진</label>
        <input type="file" id="photo" name="photo"
          accept=".jpg,.jpeg,.png,.gif,.webp">
        <div class="help">
          새 사진을 선택하지 않으면 기존 사진을 그대로 유지합니다. 최대 10MB
        </div>
      </div>

      <div class="actions">
        <a href="yogaStory.yo" class="btn">취소</a>
        <button type="submit" class="btn btn-primary">수정하기</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
