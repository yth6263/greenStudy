<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>요가 관리 | 마음쉼 요가 관리자</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  * { box-sizing: border-box; }
  body { margin: 0; background: #f5f7f5; color: #26332c; font-family: Arial, "Malgun Gothic", sans-serif; }
  .page { width: 94%; max-width: 1250px; margin: 32px auto 70px; }
  .top { display: flex; align-items: flex-end; justify-content: space-between; gap: 20px; margin-bottom: 25px; }
  .title { margin: 0; font-size: 34px; font-weight: 700; }
  .desc { margin: 7px 0 0; color: #748079; }
  .actions { display: flex; gap: 8px; }
  .hero { padding: 22px 25px; margin-bottom: 20px; border-radius: 14px; background: linear-gradient(135deg,#e8f4ed,#f8fbf9); border: 1px solid #dbe8df; }
  .hero strong { color: #198754; }
  .toolbar { display: flex; align-items: center; justify-content: space-between; gap: 15px; margin-bottom: 14px; }
  .filter { display: flex; gap: 8px; }
  .table-card { overflow: hidden; background: #fff; border: 1px solid #e2e8e3; border-radius: 14px; box-shadow: 0 4px 18px rgba(0,0,0,.04); }
  .table { margin: 0; vertical-align: middle; }
  .table th { padding: 15px 10px; background: #edf1ee; text-align: center; white-space: nowrap; }
  .table td { padding: 12px 10px; text-align: center; }
  .thumb { width: 78px; height: 58px; object-fit: cover; border-radius: 8px; border: 1px solid #dee2e6; }
  .title-cell { min-width: 220px; text-align: left !important; font-weight: 600; }
  .content-cell { max-width: 280px; text-align: left !important; color: #68736d; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
  .actions-cell { min-width: 155px; white-space: nowrap; }
  .empty { padding: 70px 20px; color: #7a857f; text-align: center; }
  .pagination-wrap { display: flex; justify-content: center; margin-top: 25px; }
  .page-info { color: #748079; font-size: 14px; }
  .floating { position: fixed; right: 22px; bottom: 22px; z-index: 1000; }
  .top-btn { display: none; width: 48px; height: 48px; border: 0; border-radius: 50%; color: #fff; background: #198754; font-size: 24px; box-shadow: 0 4px 12px rgba(0,0,0,.18); }
  @media (max-width: 800px) {
    .top { align-items: flex-start; flex-direction: column; }
    .actions { width: 100%; }
    .actions .btn { flex: 1; }
    .toolbar { align-items: flex-start; flex-direction: column; }
    .filter { width: 100%; }
    .filter select { flex: 1; }
  }
</style>
</head>
<body>
<main class="page">
  <div class="top">
    <div>
      <h1 class="title">요가 관리</h1>
      <p class="desc">등록된 요가 콘텐츠를 조회하고 수정하거나 삭제할 수 있습니다.</p>
    </div>
    <div class="actions">
      <a href="${ctp}/index.yo" class="btn btn-outline-secondary">홈으로 가기</a>
      <c:if test="${sessionScope.sLevel == 0}">
        <a href="${ctp}/yogaInput.yo" class="btn btn-success">+ 요가등록</a>
        <a href="${ctp}/admin.yo" class="btn btn-outline-secondary">관리자</a>
      </c:if>
    </div>
  </div>
  <div class="hero">
    <strong>콘텐츠 관리</strong>
    <span class="text-secondary ms-2">페이지당 10건씩 표시되며, 아래 번호는 10페이지 단위로 묶어 이동합니다.</span>
  </div>
  <div class="toolbar">
    <form method="get" action="${ctp}/yogaList.yo" class="filter">
      <input type="hidden" name="page" value="1">
      <select name="part" class="form-select" onchange="this.form.submit()">
        <option value="전체" <c:if test="${part eq '전체'}">selected</c:if>>전체조회</option>
        <option value="집중명상" <c:if test="${part eq '집중명상'}">selected</c:if>>집중명상</option>
        <option value="통찰명상" <c:if test="${part eq '통찰명상'}">selected</c:if>>통찰명상</option>
        <option value="자비명상" <c:if test="${part eq '자비명상'}">selected</c:if>>자비명상</option>
        <option value="자애명상" <c:if test="${part eq '자애명상'}">selected</c:if>>자애명상</option>
      </select>
    </form>
    <div class="page-info">총 <strong>${yogaTotalCount}</strong>건 · ${yogaCurrentPage} / ${yogaTotalPage} 페이지</div>
  </div>
  <div class="table-card">
    <div class="table-responsive">
      <table class="table table-hover">
        <thead>
          <tr>
            <th>번호</th>
            <th>사진</th>
            <th>분류</th>
            <th>제목</th>
            <th>내용</th>
            <c:if test="${sessionScope.sLevel == 0}">
              <th>관리</th>
            </c:if>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty yogaVos}">
              <tr>
                <td colspan="${sessionScope.sLevel == 0 ? 6 : 5}"><div class="empty">등록된 요가 자료가 없습니다.</div></td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="vo" items="${yogaVos}" varStatus="st">
                <tr data-yoga-idx="${vo.idx}">
  								<td>${yogaStartNo - st.index}</td>
                  <td>
                    <c:choose>
                      <c:when test="${not empty vo.photo}">
                        <a href="#" class="detail-open" data-bs-toggle="modal" data-bs-target="#yogaDetailModal" data-idx="${vo.idx}" aria-label="<c:out value='${vo.title}'/> 상세보기">
  <img src="${ctp}/images/data/yoga/${vo.photo}" class="thumb" alt="<c:out value='${vo.title}'/>">
</a>
                      </c:when>
                      <c:otherwise>
                        <span class="text-secondary">없음</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td><span class="badge text-bg-light border">${vo.part}</span></td>
                  <td class="title-cell">
  <a href="#" class="detail-open text-decoration-none text-dark" data-bs-toggle="modal" data-bs-target="#yogaDetailModal" data-idx="${vo.idx}">
    <c:out value="${vo.title}" />
  </a>
</td>
                  <td class="content-cell"><c:out value="${vo.content}" /></td>
                  <c:if test="${sessionScope.sLevel == 0}">
                    <td class="actions-cell">
                      <a href="${ctp}/yogaUpdate.yo?idx=${vo.idx}&page=${yogaCurrentPage}&part=${yogaPart}" class="btn btn-sm btn-outline-primary">요가수정</a>
                      <a href="${ctp}/yogaDelete.yo?idx=${vo.idx}&page=${yogaCurrentPage}&part=${yogaPart}" class="btn btn-sm btn-outline-danger" onclick="return confirm('이 요가 콘텐츠를 삭제하시겠습니까?');">삭제</a>
                    </td>
                  </c:if>
  <td class="d-none yoga-detail-data">
    <span class="detail-part"><c:out value="${vo.part}" /></span>
    <span class="detail-title"><c:out value="${vo.title}" /></span>
    <span class="detail-content"><c:out value="${vo.content}" /></span>
    <span class="detail-url"><c:out value="${vo.url}" /></span>
    <span class="detail-photo"><c:out value="${vo.photo}" /></span>
  </td>
</tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>
  </div>
  <div class="pagination-wrap">
    <nav aria-label="요가 페이지">
      <ul class="pagination">
        <c:if test="${startPage > 1}">
          <li class="page-item"><a class="page-link" href="${ctp}/yogaList.yo?page=${startPage - 1}&part=${yogaPart}">이전블록</a></li>
        </c:if>
        <c:if test="${currentPage > 1}">
          <li class="page-item"><a class="page-link" href="${ctp}/yogaList.yo?page=${currentPage - 1}&part=${yogaPart}">‹</a></li>
        </c:if>
        <c:forEach var="p" begin="${yogaStartPage}" end="${yogaEndPage}">
          <li class="page-item <c:if test='${p == currentPage}'>active</c:if>">
            <a class="page-link" href="${ctp}/yogaList.yo?page=${p}&part=${yogaPart}">${p}</a>
          </li>
        </c:forEach>
        <c:if test="${currentPage < totalPage}">
          <li class="page-item"><a class="page-link" href="${ctp}/yogaList.yo?page=${currentPage + 1}&part=${yogaPart}">›</a></li>
        </c:if>
        <c:if test="${endPage < totalPage}">
          <li class="page-item"><a class="page-link" href="${ctp}/yogaList.yo?page=${endPage + 1}&part=${yogaPart}">다음블록</a></li>
        </c:if>
      </ul>
    </nav>
  </div>
</main>
<div class="modal fade" id="yogaDetailModal" tabindex="-1" aria-labelledby="yogaDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="yogaDetailModalLabel">요가 상세정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body">
        <div class="row g-4">
          <div class="col-md-5 text-center">
            <img id="modalPhoto" src="" alt="" class="img-fluid rounded-3 border" style="width:100%; max-height:320px; object-fit:cover;">
            <div id="modalPhotoEmpty" class="d-none rounded-3 border bg-light text-secondary d-flex align-items-center justify-content-center" style="height:280px;">사진이 없습니다.</div>
          </div>
          <div class="col-md-7">
            <span id="modalPart" class="badge text-bg-success mb-2"></span>
            <h3 id="modalTitle" class="mb-3"></h3>
            <div class="border-top pt-3">
              <p id="modalContent" class="mb-3" style="white-space:pre-wrap; line-height:1.8;"></p>
            </div>
            <div id="modalUrlWrap" class="mt-3">
              <a id="modalUrl" href="" target="_blank" rel="noopener noreferrer" class="btn btn-outline-success">관련자료 보기</a>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="floating">
  <button type="button" id="topButton" class="top-btn" title="위로 가기">↑</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const detailModal = document.getElementById("yogaDetailModal");
  const modalPhoto = document.getElementById("modalPhoto");
  const modalPhotoEmpty = document.getElementById("modalPhotoEmpty");
  const modalPart = document.getElementById("modalPart");
  const modalTitle = document.getElementById("modalTitle");
  const modalContent = document.getElementById("modalContent");
  const modalUrlWrap = document.getElementById("modalUrlWrap");
  const modalUrl = document.getElementById("modalUrl");
  document.querySelectorAll(".detail-open").forEach(function(button) {
    button.addEventListener("click", function(event) {
      event.preventDefault();
      const row = document.querySelector('tr[data-yoga-idx="' + this.dataset.idx + '"]');
      if (!row) return;
      const data = row.querySelector(".yoga-detail-data");
      const part = data.querySelector(".detail-part").textContent.trim();
      const title = data.querySelector(".detail-title").textContent.trim();
      const content = data.querySelector(".detail-content").textContent.trim();
      const url = data.querySelector(".detail-url").textContent.trim();
      const photo = data.querySelector(".detail-photo").textContent.trim();
      modalPart.textContent = part;
      modalTitle.textContent = title;
      modalContent.textContent = content;
      if (photo) {
        modalPhoto.src = "${ctp}/images/data/yoga/" + photo;
        modalPhoto.alt = title;
        modalPhoto.classList.remove("d-none");
        modalPhotoEmpty.classList.add("d-none");
      } else {
        modalPhoto.removeAttribute("src");
        modalPhoto.classList.add("d-none");
        modalPhotoEmpty.classList.remove("d-none");
      }
      if (url) {
        modalUrl.href = url;
        modalUrlWrap.classList.remove("d-none");
      } else {
        modalUrl.removeAttribute("href");
        modalUrlWrap.classList.add("d-none");
      }
    });
  });
  const topButton = document.getElementById("topButton");
  window.addEventListener("scroll", function() {
    topButton.style.display = window.scrollY > 300 ? "block" : "none";
  });
  topButton.addEventListener("click", function() {
    window.scrollTo({ top: 0, behavior: "smooth" });
  });
</script>
</body>
</html>
