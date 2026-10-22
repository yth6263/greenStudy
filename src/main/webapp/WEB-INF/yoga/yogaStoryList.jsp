<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>요가스토리 관리</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f8f6; color: #18251f; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .container { width: calc(100% - 40px); max-width: 1280px; margin: 0 auto; padding: 38px 0 50px; }
    .header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 28px; }
    .title h1 { margin: 0 0 8px; font-size: 38px; letter-spacing: -1.5px; }
    .title p { margin: 0; color: #68766f; font-size: 17px; }
    .actions { display: flex; gap: 8px; align-items: center; }
    .btn { display: inline-flex; align-items: center; justify-content: center; height: 42px; padding: 0 18px; border: 1px solid #9aa8a1; border-radius: 7px; background: #fff; color: #43534b; text-decoration: none; font-size: 15px; cursor: pointer; }
    .btn-primary { background: #168653; border-color: #168653; color: #fff; font-weight: 700; }
    .btn-danger { border-color: #ef6b6b; color: #e33f3f; background: #fff; }
    .info { padding: 18px 22px; margin-bottom: 24px; border: 1px solid #d6e7dc; border-radius: 15px; background: #eef8f2; color: #52645b; font-size: 16px; }
    .info strong { color: #168653; margin-right: 12px; }
    .summary { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; color: #6b7771; font-size: 14px; }
    .table-wrap { overflow: hidden; border: 1px solid #dfe6e2; border-radius: 15px; background: #fff; box-shadow: 0 8px 24px rgba(24, 37, 31, .05); }
    table { width: 100%; border-collapse: collapse; table-layout: fixed; }
    th { height: 54px; background: #edf2ef; border-bottom: 1px solid #d7e0db; font-weight: 700; color: #26352e; }
    td { height: 88px; padding: 10px 14px; border-bottom: 1px solid #e0e6e3; text-align: center; vertical-align: middle; }
    tr:last-child td { border-bottom: 0; }
    .col-no { width: 7%; }
    .col-photo { width: 13%; }
    .col-part { width: 15%; }
    .col-title { width: 23%; }
    .col-content { width: 28%; }
    .col-manage { width: 14%; }
    .thumb { display: block; width: 78px; height: 58px; margin: 0 auto; border-radius: 8px; object-fit: cover; border: 1px solid #dfe6e2; }
    .thumb-link { display: inline-block; }
    .badge { display: inline-block; padding: 5px 10px; border: 1px solid #d8e0dc; border-radius: 7px; background: #f8faf9; font-size: 13px; color: #33433b; }
    .link-title { display: block; color: #18251f; text-decoration: none; font-weight: 700; text-align: left; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .link-title:hover { color: #168653; text-decoration: underline; }
    .content-text { display: block; text-align: left; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: #56635d; }
    .manage { display: flex; justify-content: center; gap: 6px; }
    .manage .btn { height: 36px; padding: 0 11px; font-size: 13px; }
    .empty { padding: 70px 20px !important; color: #74817b; font-size: 16px; }
    .pagination { display: flex; justify-content: center; gap: 6px; margin-top: 26px; }
    .page { min-width: 38px; height: 38px; padding: 0 10px; display: flex; align-items: center; justify-content: center; border: 1px solid #d7dfdb; border-radius: 7px; background: #fff; color: #46564e; text-decoration: none; }
    .page.active { background: #1677ff; border-color: #1677ff; color: #fff; font-weight: 700; }
    .page.disabled { color: #b2bbb6; background: #f7f8f8; }
    @media (max-width: 800px) {
      .container { width: calc(100% - 24px); padding-top: 24px; }
      .header { align-items: flex-start; gap: 18px; flex-direction: column; }
      .title h1 { font-size: 30px; }
      .table-wrap { overflow-x: auto; }
      table { min-width: 980px; }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="title">
        <h1>요가스토리 관리</h1>
        <p>등록된 요가스토리를 조회하고 수정하거나 삭제할 수 있습니다.</p>
      </div>
      <div class="actions">
        <c:if test="${sessionScope.sLevel == 0}">
          <a class="btn" href="${pageContext.request.contextPath}/admin.yo">관리자 메뉴</a>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/yogaStoryInput.yo">+ 요가스토리 등록</a>
        </c:if>
      </div>
      <div class="actions">
		    <a class="btn" href="${pageContext.request.contextPath}/index.yo">홈으로</a>
		  </div>
    </div>
    <div class="info"><strong>스토리 관리</strong>페이지당 10건씩 표시되며, 아래 번호는 10페이지 단위의 블록으로 이동합니다.</div>
    <div class="summary">
      <span>총 <strong>${storyTotalCount}</strong>건 · ${storyCurrentPage} / ${storyTotalPages}페이지</span>
    </div>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th class="col-no">번호</th>
            <th class="col-photo">사진</th>
            <th class="col-part">요가종류</th>
            <th class="col-title">제목</th>
            <th class="col-content">내용</th>
            <c:if test="${sessionScope.sLevel == 0}">
              <th class="col-manage">관리</th>
            </c:if>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty storyVos}">
              <tr>
                <td class="empty" colspan="${sessionScope.sLevel == 0 ? 6 : 5}">등록된 요가스토리가 없습니다.</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="vo" items="${storyVos}">
                <tr>
                  <td><c:out value="${vo.idx}" /></td>
                  <td>
                    <a class="thumb-link" href="${pageContext.request.contextPath}/yogaStoryContent.yo?idx=${vo.idx}" title="<c:out value='${vo.title}' />">
                      <img class="thumb" src="${pageContext.request.contextPath}/images/data/yogaStory/<c:out value='${vo.photo}' />" alt="<c:out value='${vo.title}' />">
                    </a>
                  </td>
                  <td><span class="badge"><c:out value="${vo.part}" /></span></td>
                  <td>
                    <a class="link-title" href="${pageContext.request.contextPath}/yogaStoryContent.yo?idx=${vo.idx}" title="<c:out value='${vo.title}' />">
                      <c:out value="${vo.title}" />
                    </a>
                  </td>
                  <td><span class="content-text" title="<c:out value='${vo.content}' />"><c:out value="${vo.content}" /></span></td>
                  <c:if test="${sessionScope.sLevel == 0}">
                    <td>
                      <div class="manage">
                        <a class="btn" href="${pageContext.request.contextPath}/yogaStoryUpdate.yo?idx=${vo.idx}">수정</a>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/yogaStoryDelete.yo?idx=${vo.idx}" onclick="return confirm('선택한 요가스토리를 삭제하시겠습니까?');">삭제</a>
                      </div>
                    </td>
                  </c:if>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>
    <c:if test="${totalPages > 0}">
      <div class="pagination">
        <c:choose>
          <c:when test="${currentPage > 1}">
            <a class="page" href="${pageContext.request.contextPath}/yogaStory.yo?page=1">처음</a>
          </c:when>
          <c:otherwise>
            <span class="page disabled">처음</span>
          </c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${currentPage > 1}">
            <a class="page" href="${pageContext.request.contextPath}/yogaStory.yo?page=${currentPage - 1}">‹</a>
          </c:when>
          <c:otherwise>
            <span class="page disabled">‹</span>
          </c:otherwise>
        </c:choose>
        <c:forEach var="p" begin="${storyStartPage}" end="${storyEndPage}">
          <c:choose>
            <c:when test="${p == currentPage}">
              <span class="page active">${p}</span>
            </c:when>
            <c:otherwise>
              <a class="page" href="${pageContext.request.contextPath}/yogaStory.yo?page=${p}">${p}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        <c:choose>
          <c:when test="${currentPage < totalPages}">
            <a class="page" href="${pageContext.request.contextPath}/yogaStory.yo?page=${currentPage + 1}">›</a>
          </c:when>
          <c:otherwise>
            <span class="page disabled">›</span>
          </c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${currentPage < totalPages}">
            <a class="page" href="${pageContext.request.contextPath}/yogaStory.yo?page=${storyTotalPages}">마지막</a>
          </c:when>
          <c:otherwise>
            <span class="page disabled">마지막</span>
          </c:otherwise>
        </c:choose>
      </div>
    </c:if>
  </div>
</body>
</html>
