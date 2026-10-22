<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>문의 내용</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f8f6; color: #20342b; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .wrap { width: min(900px, calc(100% - 32px)); margin: 42px auto 70px; }
    .top, .answer-head, .actions { display: flex; justify-content: space-between; align-items: center; gap: 10px; }
    h1 { margin: 0; font-size: 31px; }
    h2 { margin: 0 0 18px; font-size: 23px; }
    .card { margin-top: 22px; padding: 26px; border: 1px solid #e0e8e3; border-radius: 13px; background: #fff; box-shadow: 0 8px 24px rgba(32, 52, 43, .05); }
    .meta { display: flex; gap: 16px; margin: 12px 0 20px; color: #75827b; font-size: 14px; }
    .content { min-height: 100px; line-height: 1.8; white-space: pre-wrap; overflow-wrap: anywhere; }
    .question-photo { display: block; max-width: 100%; max-height: 480px; margin: 20px 0 0; border-radius: 9px; object-fit: contain; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 38px; padding: 0 14px; border: 1px solid #cbd8d0; border-radius: 7px; background: #fff; color: #35483e; text-decoration: none; font: inherit; cursor: pointer; }
    .primary { border-color: #188653; background: #188653; color: #fff; }
    .danger { border-color: #c94c4c; background: #c94c4c; color: #fff; }
    .answer { margin-top: 15px; padding: 18px; border: 1px solid #e6ece8; border-radius: 9px; background: #fbfdfb; }
    .answer textarea, .answer-form textarea { width: 100%; min-height: 100px; padding: 11px; border: 1px solid #d4dfd8; border-radius: 7px; font: inherit; line-height: 1.65; resize: vertical; }
    .answer-date { color: #78857e; font-size: 13px; }
    .answer-form { margin-top: 18px; padding-top: 18px; border-top: 1px solid #e8eeea; }
    .answer-form button { margin-top: 8px; }
    .none { color: #78857e; }
    @media (max-width: 650px) { .top { align-items: flex-start; flex-direction: column; } .card { padding: 19px; } .meta { flex-direction: column; gap: 5px; } .answer-head { align-items: flex-start; flex-direction: column; } }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top"><h1>문의 내용</h1><a class="btn" href="${ctp}/questionList.qu">목록으로</a></header>
    <article class="card">
      <div class="answer-head"><h2><c:out value="${questionVo.part}" /> 문의</h2>
        <div class="actions">
          <c:if test="${sessionScope.sMid eq questionVo.mid or sessionScope.sLevel == 0}">
            <a class="btn" href="${ctp}/questionUpdate.qu?idx=${questionVo.idx}">수정</a>
            <form action="${ctp}/questionDelete.qu" method="post" onsubmit="return confirm('이 문의를 삭제할까요?')"><input type="hidden" name="idx" value="${questionVo.idx}"><button class="btn danger" type="submit">삭제</button></form>
          </c:if>
        </div>
      </div>
      <div class="meta"><span>작성자: <c:out value="${questionVo.mid}" /></span><span>등록일: <c:out value="${questionVo.questionDate}" /></span></div>
      <div class="content"><c:out value="${questionVo.content}" /></div>
      <c:if test="${not empty questionVo.questionPhoto}"><img class="question-photo" src="${ctp}/images/data/question/${questionVo.questionPhoto}" alt="문의 첨부 사진"></c:if>
    </article>
    <section class="card">
      <h2>답변</h2>
      <c:choose>
        <c:when test="${not empty questionVo.answerVos}">
          <c:forEach var="answerVo" items="${questionVo.answerVos}">
            <article class="answer">
              <div class="answer-head"><div><strong><c:choose><c:when test="${answerVo.answerLevel == 0}">관리자 답변</c:when><c:otherwise>추가 문의</c:otherwise></c:choose> · <c:out value="${answerVo.answerMid}" /></strong> <span class="answer-date"><c:out value="${answerVo.answerDate}" /></span></div>
                <c:if test="${sessionScope.sMid eq answerVo.answerMid or sessionScope.sLevel == 0}"><form action="${ctp}/answerDelete.qu" method="post" onsubmit="return confirm('답변을 삭제할까요?')"><input type="hidden" name="idx" value="${answerVo.answerIdx}"><button class="btn danger" type="submit">답변 삭제</button></form></c:if>
              </div>
              <c:if test="${sessionScope.sMid eq answerVo.answerMid}">
                <form action="${ctp}/answerUpdate.qu" method="post"><input type="hidden" name="idx" value="${answerVo.answerIdx}"><textarea name="answerContent" maxlength="10000" required><c:out value="${answerVo.answerContent}" /></textarea><button class="btn" type="submit">답변 수정</button></form>
              </c:if>
              <c:if test="${sessionScope.sMid ne answerVo.answerMid}"><div class="content"><c:out value="${answerVo.answerContent}" /></div></c:if>
            </article>
          </c:forEach>
        </c:when>
        <c:otherwise><p class="none">아직 등록된 답변이 없습니다.</p></c:otherwise>
      </c:choose>
      <c:if test="${sessionScope.sLevel == 0}">
        <form class="answer-form" action="${ctp}/answerInput.qu" method="post">
          <input type="hidden" name="qIdx" value="${questionVo.idx}">
          <label for="answerContent">답변 작성</label>
          <textarea id="answerContent" name="answerContent" maxlength="10000" required placeholder="문의에 대한 답변을 입력하세요."></textarea>
          <button class="btn primary" type="submit">답변 등록</button>
        </form>
      </c:if>
      <c:if test="${questionCanFollowUp}">
        <form class="answer-form" action="${ctp}/answerInput.qu" method="post">
          <input type="hidden" name="qIdx" value="${questionVo.idx}">
          <label for="followUpContent">관리자 답변에 추가 문의</label>
          <textarea id="followUpContent" name="answerContent" maxlength="10000" required placeholder="관리자 답변에 대한 추가 질문을 입력하세요."></textarea>
          <button class="btn primary" type="submit">추가 문의 등록</button>
        </form>
      </c:if>
    </section>
  </main>
</body>
</html>
