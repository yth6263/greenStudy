<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>문의 &amp; 답변 | 마음쉼 요가</title>
  <style>
    * { box-sizing: border-box; }
    body { margin: 0; background: #f5f8f6; color: #20342b; font-family: "Noto Sans KR", "Malgun Gothic", sans-serif; }
    .wrap { width: min(1050px, calc(100% - 32px)); margin: 42px auto 70px; }
    .top { display: flex; justify-content: space-between; align-items: center; gap: 16px; margin-bottom: 24px; }
    h1 { margin: 0; font-size: 32px; }
    h2 { margin: 0 0 20px; font-size: 22px; }
    .top-links, .form-actions { display: flex; align-items: center; gap: 8px; }
    .user-id { margin-right: 5px; color: #52635a; font-size: 14px; font-weight: 700; }
    .panel { margin-bottom: 22px; padding: 25px; border: 1px solid #e0e8e3; border-radius: 13px; background: #fff; box-shadow: 0 8px 24px rgba(32, 52, 43, .05); }
    .field { margin-bottom: 18px; }
    label { display: block; margin-bottom: 8px; font-weight: 700; }
    select, textarea, input[type=file] { width: 100%; padding: 12px; border: 1px solid #d4dfd8; border-radius: 7px; background: #fff; font: inherit; }
    textarea { min-height: 170px; resize: vertical; line-height: 1.7; }
    .help, .meta { color: #77847d; font-size: 14px; }
    .btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 15px; border: 1px solid #cbd8d0; border-radius: 7px; background: #fff; color: #35483e; text-decoration: none; font: inherit; cursor: pointer; }
    .primary { border-color: #188653; background: #188653; color: #fff; }
    .table-wrap { overflow-x: auto; }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 12px 10px; border-bottom: 1px solid #e8eeea; text-align: left; vertical-align: middle; }
    th { background: #edf4ef; white-space: nowrap; }
    .subject { color: #188653; font-weight: 700; text-decoration: none; }
    .empty { padding: 32px 10px; color: #77847d; text-align: center; }
    .list-link { display: flex; justify-content: flex-end; margin-top: 16px; }
    @media (max-width: 650px) { .top { align-items: flex-start; flex-direction: column; } .top-links { width: 100%; } .top-links .btn { flex: 1; } .panel { padding: 18px; } th, td { padding: 10px 8px; font-size: 14px; } }
  </style>
</head>
<body>
  <main class="wrap">
    <header class="top">
      <h1>문의 &amp; 답변</h1>
      <nav class="top-links"><span class="user-id"><c:out value="${sessionScope.sMid}" /></span><a class="btn" href="${ctp}/index.yo">홈으로</a><a class="btn" href="${ctp}/questionList.qu">문의 전체 보기</a></nav>
    </header>
    <section class="panel">
      <h2>문의하기</h2>
      <form action="${ctp}/questionInputOk.qu" method="post" enctype="multipart/form-data">
        <div class="field">
          <label for="part">문의 분류</label>
          <select id="part" name="part" required>
            <option value="">분류를 선택하세요.</option>
            <option value="요가">요가</option>
            <option value="요가스토리">요가스토리</option>
            <option value="명상">명상</option>
            <option value="포토갤러리">포토갤러리</option>
            <option value="회원">회원</option>
          </select>
        </div>
        <div class="field"><label for="content">문의 내용</label><textarea id="content" name="content" maxlength="10000" required placeholder="문의하실 내용을 입력하세요."></textarea></div>
        <div class="field"><label for="questionPhoto">첨부 사진 (선택)</label><input type="file" id="questionPhoto" name="questionPhoto" accept=".jpg,.jpeg,.png,.gif,.webp"><div class="help">JPG, PNG, GIF, WEBP 형식, 최대 10MB</div></div>
        <div class="form-actions"><button class="btn primary" type="submit">문의 등록</button></div>
      </form>
    </section>
    <section class="panel">
      <h2>최근 문의</h2>
      <div class="table-wrap">
        <table>
          <thead><tr><th>번호</th><th>분류</th><th>문의 내용</th><th>작성일</th><th>답변 상태</th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty questionVos}">
                <c:forEach var="vo" items="${questionVos}" varStatus="st">
                  <tr>
                    <td>${questionTotalCount - ((questionCurrentPage - 1) * 10) - st.index}</td>
                    <td><c:out value="${vo.part}" /></td>
                    <td><a class="subject" href="${ctp}/questionContent.qu?idx=${vo.idx}"><c:out value="${vo.content}" /></a></td>
                    <td class="meta"><c:out value="${vo.questionDate}" /></td>
                    <td><c:choose><c:when test="${vo.answerCount > 0}">답변 완료 (${vo.answerCount})</c:when><c:otherwise>답변 대기</c:otherwise></c:choose></td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise><tr><td colspan="5" class="empty">아직 등록된 문의가 없습니다.</td></tr></c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
      <div class="list-link"><a class="btn" href="${ctp}/questionList.qu">문의 내역 더 보기</a></div>
    </section>
  </main>
</body>
</html>
