<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>문의·답변 게시판</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f8f6; color: #20342b; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .wrap { width: min(1100px, calc(100% - 32px)); margin: 42px auto 70px; }
    .top { display: flex; justify-content: space-between; align-items: center; gap: 16px; margin-bottom: 24px; }
    h1 { margin: 0; font-size: 32px; }
    .actions, .pagination { display: flex; align-items: center; justify-content: center; gap: 8px; }
    .btn, .page { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 15px; border: 1px solid #cbd8d0; border-radius: 7px; background: #fff; color: #35483e; text-decoration: none; font: inherit; cursor: pointer; }
    .primary, .active { border-color: #188653; background: #188653; color: #fff; }
    .card { overflow-x: auto; border: 1px solid #e0e8e3; border-radius: 12px; background: #fff; box-shadow: 0 8px 24px rgba(32, 52, 43, .05); }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 14px 12px; border-bottom: 1px solid #e8eeea; text-align: left; vertical-align: middle; }
    th { background: #edf4ef; white-space: nowrap; }
    .subject { color: #188653; font-weight: 700; text-decoration: none; }
    .muted { color: #78857e; font-size: 14px; }
    .empty { padding: 50px 16px; color: #78857e; text-align: center; }
    .pagination { margin-top: 22px; }
    .disabled { color: #aab3ae; pointer-events: none; }
    @media (max-width: 650px) { .top { align-items: flex-start; flex-direction: column; } .actions { width: 100%; } .actions .btn { flex: 1; } th, td { padding: 11px 8px; font-size: 14px; } }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top">
      <h1>문의·답변 게시판</h1>
      <nav class="actions">
        <a class="btn" href="${ctp}/index.yo">홈으로</a>
        <a class="btn primary" href="${ctp}/questionInput.qu">문의하기</a>
      </nav>
    </header>
    <div class="muted">문의 ${questionTotalCount}건</div>
    <section class="card">
      <table>
        <thead><tr><th>번호</th><th>분류</th><th>문의 내용</th><th>작성자</th><th>등록일</th><th>답변</th></tr></thead>
        <tbody>
          <c:choose>
            <c:when test="${not empty questionVos}">
              <c:forEach var="vo" items="${questionVos}" varStatus="st">
                <tr>
                  <td>${questionTotalCount - ((questionCurrentPage - 1) * 10) - st.index}</td>
                  <td><c:out value="${vo.part}" /></td>
                  <td><a class="subject" href="${ctp}/questionContent.qu?idx=${vo.idx}"><c:out value="${vo.content}" /></a></td>
                  <td><c:out value="${vo.mid}" /></td>
                  <td class="muted"><c:out value="${vo.questionDate}" /></td>
                  <td><c:choose><c:when test="${vo.answerCount > 0}">답변 ${vo.answerCount}</c:when><c:otherwise>답변 대기</c:otherwise></c:choose></td>
                </tr>
              </c:forEach>
            </c:when>
            <c:otherwise><tr><td colspan="6" class="empty">등록된 문의가 없습니다.</td></tr></c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </section>
    <nav class="pagination" aria-label="페이지 이동">
      <c:choose><c:when test="${questionStartPage > 1}"><a class="page" href="${ctp}/questionList.qu?page=${questionPrevPage}">이전 블록</a></c:when><c:otherwise><span class="page disabled">이전 블록</span></c:otherwise></c:choose>
      <c:forEach var="p" begin="${questionStartPage}" end="${questionEndPage}">
        <c:choose><c:when test="${p == questionCurrentPage}"><span class="page active">${p}</span></c:when><c:otherwise><a class="page" href="${ctp}/questionList.qu?page=${p}">${p}</a></c:otherwise></c:choose>
      </c:forEach>
      <c:choose><c:when test="${questionEndPage < questionTotalPages}"><a class="page" href="${ctp}/questionList.qu?page=${questionNextPage}">다음 블록</a></c:when><c:otherwise><span class="page disabled">다음 블록</span></c:otherwise></c:choose>
    </nav>
  </main>
</body>
</html>
