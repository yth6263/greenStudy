<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>요가 수정 | 마음쉼 요가 관리자</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  * { box-sizing: border-box; }
  body { margin: 0; background: #f5f7f5; color: #26332c; font-family: Arial, "Malgun Gothic", sans-serif; }
  .page { width: 94%; max-width: 900px; margin: 32px auto 70px; }
  .top { display: flex; align-items: flex-end; justify-content: space-between; gap: 20px; margin-bottom: 25px; }
  .title { margin: 0; font-size: 34px; font-weight: 700; }
  .desc { margin: 7px 0 0; color: #748079; }
  .form-card { overflow: hidden; background: #fff; border: 1px solid #e2e8e3; border-radius: 16px; box-shadow: 0 6px 24px rgba(0,0,0,.06); }
  .form-header { padding: 20px 28px; background: #198754; color: #fff; font-size: 18px; font-weight: 700; }
  .form-body { padding: 30px; }
  .field { margin-bottom: 24px; }
  .field label { display: block; margin-bottom: 8px; font-weight: 600; }
  .required { color: #dc3545; }
  .help { margin-top: 7px; color: #748079; font-size: 13px; }
  .current-photo { margin-top: 10px; padding: 12px; border: 1px solid #dee2e6; border-radius: 10px; background: #f8f9fa; }
  .current-photo img { width: 180px; height: 130px; object-fit: cover; border-radius: 8px; border: 1px solid #dee2e6; }
  .button-wrap { display: flex; justify-content: center; gap: 10px; margin-top: 30px; }
  @media (max-width: 700px) {
    .page { width: 96%; }
    .top { align-items: flex-start; flex-direction: column; }
    .form-body { padding: 20px; }
  }
</style>
</head>
<body>
<main class="page">
  <div class="top">
    <div>
      <h1 class="title">요가 수정</h1>
      <p class="desc">등록된 요가 콘텐츠의 정보를 수정합니다.</p>
    </div>
    <a href="${ctp}/yogaList.yo?page=${empty page ? 1 : page}&part=${empty part ? '전체' : part}" class="btn btn-outline-secondary">요가리스트</a>
  </div>
  <div class="form-card">
    <div class="form-header">콘텐츠 정보 수정</div>
    <div class="form-body">
      <form action="${ctp}/yogaUpdateOk.yo" method="post" enctype="multipart/form-data">
        <input type="hidden" name="idx" value="<c:out value='${vo.idx}' />">
        <input type="hidden" name="page" value="<c:out value='${page}' />">
        <input type="hidden" name="listPart" value="<c:out value='${part}' />">
        <input type="hidden" name="oldPhoto" value="<c:out value='${vo.photo}' />">
        <div class="field">
          <label for="part">분류 <span class="required">*</span></label>
          <select id="part" name="part" class="form-select" required>
            <option value="집중명상" <c:if test="${vo.part eq '집중명상'}">selected</c:if>>집중명상</option>
            <option value="통찰명상" <c:if test="${vo.part eq '통찰명상'}">selected</c:if>>통찰명상</option>
            <option value="자비명상" <c:if test="${vo.part eq '자비명상'}">selected</c:if>>자비명상</option>
            <option value="자애명상" <c:if test="${vo.part eq '자애명상'}">selected</c:if>>자애명상</option>
          </select>
        </div>
        <div class="field">
          <label for="title">제목 <span class="required">*</span></label>
          <input type="text" id="title" name="title" class="form-control" value="<c:out value='${vo.title}' />" placeholder="요가 콘텐츠 제목을 입력하세요." maxlength="100" required>
        </div>
        <div class="field">
          <label for="content">내용</label>
          <textarea id="content" name="content" class="form-control" rows="8" placeholder="요가 콘텐츠의 상세 내용을 입력하세요."><c:out value="${vo.content}" /></textarea>
        </div>
        <div class="field">
          <label for="url">주소(URL)</label>
          <input type="url" id="url" name="url" class="form-control" value="<c:out value='${vo.url}' />" placeholder="https://...">
          <div class="help">관련 동영상이나 참고자료 주소를 입력할 수 있습니다.</div>
        </div>
        <div class="field">
          <label for="photo">요가 관련 사진</label>
          <input type="file" id="photo" name="photo" class="form-control" accept=".jpg,.jpeg,.png,.gif,.webp,image/*">
          <div class="help">새 사진을 선택하지 않으면 기존 사진을 그대로 유지합니다. 최대 10MB</div>
          <c:if test="${not empty vo.photo}">
            <div class="current-photo">
              <div class="mb-2 fw-semibold">현재 등록된 사진</div>
              <img src="${ctp}/images/data/yoga/${vo.photo}" alt="<c:out value='${vo.title}' />">
            </div>
          </c:if>
        </div>
        <div class="button-wrap">
          <a href="${ctp}/yogaList.yo?page=${empty page ? 1 : page}&part=${empty part ? '전체' : part}" class="btn btn-outline-secondary">취소</a>
          <button type="submit" class="btn btn-success px-4">요가수정</button>
        </div>
      </form>
    </div>
  </div>
</main>
</body>
</html>
