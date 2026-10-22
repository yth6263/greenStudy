<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>요가 등록 | 마음쉼 요가 관리자</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  * { box-sizing: border-box; }
  body { margin: 0; background: #f4f7f5; color: #26332c; font-family: Arial, "Malgun Gothic", sans-serif; }
  .page { width: 92%; max-width: 900px; margin: 40px auto 70px; }
  .header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 22px; }
  .title { margin: 0; font-size: 32px; font-weight: 700; }
  .sub { margin: 7px 0 0; color: #718078; }
  .card { overflow: hidden; border: 0; border-radius: 16px; background: #fff; box-shadow: 0 8px 28px rgba(30,55,42,.08); }
  .card-header { padding: 22px 28px; background: #198754; color: #fff; }
  .card-body { padding: 30px; }
  .form-label { font-weight: 700; }
  .required { color: #dc3545; }
  .preview { display: none; width: 180px; height: 120px; margin-top: 12px; border-radius: 10px; object-fit: cover; border: 1px solid #dee2e6; }
  .help { margin-top: 6px; color: #7b8780; font-size: 13px; }
  .actions { display: flex; justify-content: center; gap: 9px; margin-top: 28px; }
  .btn-success { background: #198754; border-color: #198754; }
  @media (max-width: 600px) {
    .page { width: 94%; margin-top: 25px; }
    .card-body { padding: 20px; }
    .header { align-items: flex-start; flex-direction: column; gap: 15px; }
    .actions { flex-direction: column; }
    .actions .btn { width: 100%; }
  }
</style>
</head>
<body>
<main class="page">
  <div class="header">
    <div>
      <h1 class="title">요가 등록</h1>
      <p class="sub">새로운 요가 콘텐츠를 등록합니다.</p>
    </div>
    <a href="${ctp}/yogaList.yo" class="btn btn-outline-secondary">요가리스트</a>
  </div>
  <div class="card">
    <div class="card-header">
      <strong>콘텐츠 정보 입력</strong>
    </div>
    <div class="card-body">
      <form name="yogaForm" method="post" action="${ctp}/yogaInputOk.yo" enctype="multipart/form-data" onsubmit="return checkForm();">
        <div class="mb-4">
          <label for="part" class="form-label">분류 <span class="required">*</span></label>
          <select name="part" id="part" class="form-select" required>
            <option value="집중명상" selected>집중명상</option>
            <option value="통찰명상">통찰명상</option>
            <option value="자비명상">자비명상</option>
            <option value="자애명상">자애명상</option>
          </select>
        </div>
        <div class="mb-4">
          <label for="title" class="form-label">제목 <span class="required">*</span></label>
          <input type="text" name="title" id="title" class="form-control" maxlength="100" placeholder="요가 콘텐츠 제목을 입력하세요." required autofocus>
        </div>
        <div class="mb-4">
          <label for="content" class="form-label">내용</label>
          <textarea name="content" id="content" rows="8" maxlength="2000" class="form-control" placeholder="요가 콘텐츠의 상세 내용을 입력하세요."></textarea>
        </div>
        <div class="mb-4">
          <label for="url" class="form-label">주소(URL)</label>
          <input type="url" name="url" id="url" maxlength="100" class="form-control" placeholder="https://...">
          <div class="help">관련 동영상이나 참고자료 주소를 입력할 수 있습니다.</div>
        </div>
        <div class="mb-4">
          <label for="photo" class="form-label">요가 관련 사진</label>
          <input type="file" name="photo" id="photo" class="form-control" accept="image/*">
          <div class="help">JPG, PNG, GIF, WEBP 이미지 / 최대 10MB</div>
          <img id="preview" class="preview" alt="사진 미리보기">
        </div>
        <div class="actions">
          <button type="submit" class="btn btn-success px-4">요가등록</button>
          <a href="${ctp}/yogaList.yo" class="btn btn-outline-secondary px-4">취소</a>
        </div>
      </form>
    </div>
  </div>
</main>
<script>
  const photo = document.getElementById("photo");
  const preview = document.getElementById("preview");
  photo.addEventListener("change", function() {
    const file = this.files[0];
    if (!file) {
      preview.style.display = "none";
      preview.removeAttribute("src");
      return;
    }
    if (!file.type.startsWith("image/")) {
      alert("이미지 파일만 등록할 수 있습니다.");
      this.value = "";
      preview.style.display = "none";
      return;
    }
    if (file.size > 10 * 1024 * 1024) {
      alert("사진은 10MB 이하만 등록할 수 있습니다.");
      this.value = "";
      preview.style.display = "none";
      return;
    }
    preview.src = URL.createObjectURL(file);
    preview.style.display = "block";
  });
  function checkForm() {
    const title = document.getElementById("title").value.trim();
    if (!title) {
      alert("제목을 입력하세요.");
      document.getElementById("title").focus();
      return false;
    }
    return true;
  }
</script>
</body>
</html>
