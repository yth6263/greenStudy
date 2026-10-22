# greenStudy 프로젝트 Codex 작업 지침서

## 1. 프로젝트 작업 범위

Codex에서 작업할 때 프로젝트 기준 폴더는 반드시 `greenStudy`로 한다.

프로젝트의 기본 기술 구성은 다음과 같다.

- Backend: Java
- Frontend: JSP, HTML, CSS, 순수 JavaScript
- DBMS: MySQL
- WAS: Tomcat 10.1
- Backend architecture: MVC2
- Request routing: FrontController 방식
- Backend 구성: Controller / VO / DAO / Service(Command)
- JSP 출력: JSTL 중심
- Java 패키지: `member`, `yoga`, `common`
- Frontend JSP/정적 리소스 관리 폴더: `yoga`, `member`, `include` 등 기존 프로젝트 구조를 우선 사용한다.

### 핵심 원칙

기존 프로젝트의 구조와 사용자가 직접 수정한 코드를 최대한 보존한다.
새로운 구조를 임의로 만들거나 기존 구조를 일반적인 예제 구조로 바꾸지 않는다.

작업 전 반드시 `greenStudy` 안에서 관련 파일을 검색하고, 실제 프로젝트의 클래스명/메서드명/Attribute명/URL 패턴을 확인한 후 수정한다.

---

## 2. 디렉터리 규칙

### Backend

Java Backend 코드는 다음 도메인 패키지를 기준으로 관리한다.

```text
greenStudy
└─ src
   └─ main
      └─ java
         ├─ admin
         ├─ board
         ├─ common
         ├─ member
         ├─ study
         ├─ study2
         └─ yoga
```

- `member`: 회원 관련 Controller, Command, VO, DAO 등
- `yoga`: 요가 및 요가스토리 관련 Controller, Command, VO, DAO 등
- `common`: 공통 DB 연결 및 공통 기능

기존 프로젝트에 이미 존재하는 파일을 우선 사용한다.
동일 기능의 클래스를 중복 생성하지 않는다.

### Frontend

JSP 및 프론트 코드는 기존 프로젝트의 구조를 유지한다.

예:

```text
greenStudy
└─ src
   └─ main
      └─ webapp
         ├─ css
         └─ images
           └─ data
            ├─ member
            ├─ pdstest
            ├─ photo
            ├─ yaga
            └─ yogaStory
         ├─ include
         ├─ js
         ├─ study
         └─ WEB-INF
           └─ admin
              └─ member
           ├─ board
           ├─ lib
           ├─ main
           ├─ member
           ├─ study2
           └─ yoga
```

실제 프로젝트에 존재하는 폴더명을 먼저 확인하고 그 구조에 맞춘다.

---

## 3. MVC2 패턴 준수

이 프로젝트는 MVC2 패턴이다.

전체 흐름은 다음을 기본으로 한다.

```text
Browser
  ↓
FrontController
  ↓
도메인 Controller
  ↓
Command(Service)
  ↓
DAO
  ↓
MySQL
  ↓
VO
  ↓
Command(Service)
  ↓
request Attribute
  ↓
JSP + JSTL
```

### Controller의 역할

Controller는 최대한 얇게 유지한다.

Controller에서는 다음 역할만 담당한다.

- 요청 URL 확인
- 적절한 Command 객체 선택
- Command 실행
- 필요한 경우 View 이동

Controller에서 DB 조회를 직접 하지 않는다.
Controller에서 비즈니스 로직을 작성하지 않는다.
Controller에서 목록 데이터의 가공 및 페이징 계산을 하지 않는다.
Controller에서 `request.setAttribute()`를 이용해 화면 데이터를 직접 저장하지 않는다.(이작업은 Command객체안에서 처리한다)

### 매우 중요한 규칙

**화면에 전달할 데이터와 `request.setAttribute()` 작업은 모두 해당 Command(Service) 객체에서 처리한다.**

예:

```java
public class YogaListCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // 파라미터 처리
    // DAO 호출
    // 비즈니스 로직
    // 페이징 계산
    // request.setAttribute()
  }
}
```

Controller에서 다음과 같이 데이터를 조회하고 Attribute를 저장하는 방식은 사용하지 않는다.

```java
command.execute(request, response);
request.setAttribute("yogaVos", ...);
```

이 작업은 Command 내부에서 처리한다.

---

## 4. Command(Service) 객체의 책임

Command는 이 프로젝트에서 Service 객체 역할을 한다.

각 Command는 다음 작업을 담당할 수 있다.

- request parameter 수집
- 입력값 기본값 처리
- 페이지 번호 처리
- DAO 호출
- 전체 건수 조회
- 목록 데이터 조회
- 페이징 계산
- 화면에 필요한 데이터 가공
- `request.setAttribute()`
- 화면에 필요한 상태값 전달

### YogaListCommand

현재 프로젝트의 기준 Attribute명은 다음과 같이 유지한다.

```text
yogaVos
yogaPart
yogaCurrentPage
yogaPageSize
yogaTotalCount
yogaTotalPage
yogaStartPage
yogaEndPage
yogaStartNo
```

페이지 크기:

```text
pageSize = 10
```

페이지 블록 크기:

```text
blockSize = 5
```

페이지 계산은 Command에서 처리한다.

현재 사용 중인 구조의 핵심은 다음과 같다.

```java
int pageSize = 10;
int blockSize = 5;
int totalCount = dao.getYogaCount(part);
int totalPage = (totalCount + pageSize - 1) / pageSize;
int startIndex = (page - 1) * pageSize;
List<YogaVO> vos = dao.getYogaList(part, startIndex, pageSize);
int startPage = ((page - 1) / blockSize) * blockSize + 1;
int endPage = Math.min(startPage + blockSize - 1, totalPage);
int startNo = totalCount - ((page - 1) * pageSize);
```

이 구조를 유지하면서 실제 프로젝트 코드와 충돌하지 않도록 작업한다.

### YogaStoryListCommand

현재 프로젝트의 기준 Attribute명은 다음과 같다.

```text
storyVos
storyTotalCount
storyCurrentPage
storyTotalPages
storyStartPage
storyEndPage
storyPrevPage
storyNextPage
```

페이지 크기:

```text
pageSize = 10
```

페이지 블록 크기:

```text
blockSize = 5
```

요가스토리 목록도 Command에서 전체 건수, 현재 페이지, 시작/종료 페이지, 조회 시작 위치 등을 계산한다.

---

## 5. DAO 책임

DAO는 DB 접근만 담당한다.

- SQL 작성
- PreparedStatement
- ResultSet
- VO 변환
- 등록/수정/삭제/조회
- 전체 건수 조회
- 페이징 데이터 조회

비즈니스 로직과 화면용 Attribute 처리는 DAO에서 하지 않는다.

### YogaStoryDAO

요가스토리 목록은 기본적으로 다음 정렬을 유지한다.

```sql
order by idx desc
```

페이징 조회는 다음 형태를 기본으로 한다.

```sql
limit ?, ?
```

즉 최근 등록된 `idx`가 먼저 나오도록 한다.

---

## 6. JSP 작성 규칙

JSP는 MVC2의 View 역할만 담당한다.

JSP에서 Java Scriptlet을 사용하지 않는다.

금지:

```jsp
<%
  ...
%>
```

금지:

```jsp
<%!
  ...
%>
```

금지:

```jsp
<%= ... %>
```

대신 JSTL과 EL을 사용한다.

예:

```jsp
<c:forEach var="vo" items="${yogaVos}" varStatus="st">
  ...
</c:forEach>
```

### JSTL

현재 프로젝트가 사용하는 JSTL URI를 먼저 확인하고 기존 프로젝트 방식과 일치시킨다.

Jakarta 환경에서는 기존 코드가 다음 URI를 사용하고 있다면 그대로 유지한다.

```jsp
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
```

프로젝트의 기존 설정과 다른 URI를 임의로 바꾸지 않는다.

---

## 7. 코드 들여쓰기 규칙

**모든 코드의 들여쓰기는 정확히 2칸을 사용한다.**

적용 대상:

- Java
- JSP
- HTML
- CSS
- JavaScript
- XML
- 기타 프로젝트 코드

예:

```jsp
<c:choose>
  <c:when test="${empty yogaVos}">
    <p>등록된 요가가 없습니다.</p>
  </c:when>
  <c:otherwise>
    <c:forEach var="vo" items="${yogaVos}">
      ...
    </c:forEach>
  </c:otherwise>
</c:choose>
```

불필요한 빈 줄을 만들지 않는다.

특히 HTML/JSP 블록 구조가 무너진 형태로 작성하지 않는다.

---

## 8. 요가 관리(yogaList.jsp)

요가 관리 목록의 기본 요구사항:

- 1페이지 10건
- 5페이지 단위 블록 페이징
- 번호는 내림차순
- 최신 `idx`가 먼저 표시
- 일반회원에게 관리자 전용 기능을 표시하지 않음

### 번호

전체 34건이라면:

```text
1페이지
34
33
32
31
30
29
28
27
26
25

2페이지
24
23
22
21
20
19
18
17
16
15
```

형태가 되어야 한다.

페이지별 번호는 Command가 전달하는 `yogaStartNo`를 사용한다.

예:

```jsp
<c:forEach var="vo" items="${yogaVos}" varStatus="st">
  <td>${yogaStartNo - st.index}</td>
</c:forEach>
```

`status.index`와 같은 존재하지 않는 변수를 사용하지 않는다.

---

## 9. 요가스토리 관리(yogaStoryList.jsp)

요가스토리 목록도 동일하게:

- 1페이지 10건
- 5페이지 단위 블록 페이징
- 최신 `idx` 우선
- 일반회원에게 관리자 전용 기능을 표시하지 않음

목록에서 사진 또는 제목을 클릭하면 상세보기로 이동한다.

기본 URL 패턴은 실제 프로젝트에 존재하는 URL을 확인해서 사용한다.

현재 프로젝트에서 사용하는 흐름은 다음과 같다.

```text
yogaStoryList
  ↓
사진 또는 제목 클릭
  ↓
yogaStoryContent
  ↓
상세 내용
```

상세보기 화면의 `목록으로` 버튼은 요가스토리 목록으로 돌아가야 한다.

```text
yogaStoryContent.jsp
  ↓
목록으로
  ↓
yogaStoryList
```

---

## 10. 페이징 규칙

두 목록 모두 기본값:

```text
페이지당 10건
블록당 5페이지
```

예를 들어 전체 페이지가 15페이지라면:

### 1블록

```text
이전블록 비활성
‹ 비활성
1 2 3 4 5
›
다음블록
```

### 2블록

```text
이전블록
‹
5 6 7 8 10
›
다음블록
```

### 3블록

```text
이전블록
‹
11 12 13 14 15
› 비활성
다음블록 비활성
```

블록 이동은 현재 페이지 ±1 페이지가 아니라 **5페이지 단위 블록**으로 이동한다.

---

## 11. 일반회원과 관리자 화면

사용자가 지정한 요구사항에 따라 일반회원이 목록 화면에 들어갔을 때 관리자 기능을 보여주지 않는다.

### 일반회원의 요가 관리 화면

숨겨야 하는 것:

```text
요가등록
관리자
요가수정
삭제
```

즉 목록만 볼 수 있도록 한다.

### 일반회원의 요가스토리 관리 화면

숨겨야 하는 것:

```text
관리자메뉴
요가스토리등록
수정
삭제
```

대신 요가스토리 목록에서는 사용자가 요청한 `홈으로` 버튼을 표시한다.

### 주의

회원 권한을 판단하는 실제 Session Attribute명이나 로그인 구조는 Codex가 프로젝트에서 먼저 검색한다.

임의로:

```text
sessionScope.userRole
sessionScope.isAdmin
```

등의 변수를 새로 만들어 사용하지 않는다.

기존 프로젝트의 회원/로그인/권한 처리 구조를 그대로 사용한다.

---

## 12. index.jsp

메인 화면의 요가 콘텐츠 표시 순서:

```text
1. 요가 목록(yogaList)
2. 요가스토리 목록(yogaStory)
```

요가스토리가 요가 목록보다 먼저 나오면 안 된다.

### 요가스토리 카드

index.jsp에서는 전체 `content`를 전부 출력하지 않는다.

카드에는 내용의 일부만 보여준다.

기본적으로 약 5줄 정도까지만 노출하고 나머지 내용은 상세보기에서 보여준다.

```text
카드
 ├─ 사진
 ├─ 요가종류
 ├─ 제목
 └─ 내용 일부
       ↓
카드 클릭
       ↓
yogaStoryContent.jsp
       ↓
전체 내용
```

CSS의 line-clamp 등을 사용할 수 있지만 기존 프로젝트의 스타일을 우선 확인한다.

---

## 13. 요가스토리 이미지

요가스토리의 이미지는 프로젝트의 실제 이미지 폴더를 확인한다.

현재 프로젝트 구조상 다음 경로를 사용하고 있다.

```text
src/main/webapp/images/data/yogaStory
```

DB의 `photo` 파일명을 이용해서 이미지 URL을 만든다.

예:

```jsp
<img
  src="${pageContext.request.contextPath}/images/data/yogaStory/${vo.photo}"
  alt="${vo.title}"
>
```

단, 실제 프로젝트의 기존 경로가 다르면 먼저 프로젝트를 검색하여 실제 경로를 확인한다.

이미지 파일명을 임의로 변경하지 않는다.

---

## 14. index.jsp의 메인 이미지

메인 첫 화면의 Hero 영역 이미지는 사용자가 지정한:

```text
yoga-main.jpg
```

를 사용한다.

기존에 다른 이미지나 임시 박스가 있더라도 실제 프로젝트에서 `yoga-main.jpg`의 위치를 검색한 뒤 해당 파일을 사용한다.

경로를 추측하지 않는다.

---

## 15. 요가스토리 상세보기

`yogaStoryContent.jsp`는 현재 이미 잘 만들어진 화면을 기준으로 한다.

임의로 디자인을 다시 만들지 않는다.

상세보기에서는 전체 내용을 표시한다.

목록 화면에서는 내용을 제한해서 표시한다.

### 목록 → 상세

사진 또는 제목 클릭:

```text
yogaStoryContent.yo?idx=${vo.idx}
```

형태의 기존 URL 규칙을 우선 확인하고 사용한다.

### 상세 → 목록

상세보기 상단의 `목록으로` 버튼:

```text
yogaStoryList
```

로 이동한다.

---

## 16. 관리자 대시보드

관리자 대시보드에서:

```text
요가스토리
```

카드를 클릭하면 반드시 요가스토리 목록으로 이동해야 한다.

목록 화면이 깨지거나 HTML이 일반 텍스트로 출력되는 문제가 발생하면 다음을 우선 확인한다.

1. JSP 문법
2. JSP 파일 확장자
3. Controller/FrontController URL 매핑
4. View 경로
5. JSTL 설정
6. 인코딩
7. `<%@ page ... %>` 선언
8. JSP 내부 HTML 구조

`index_admin.jsp` 같은 파일이 프로젝트에 실제로 존재하지 않는다면 임의로 생성하거나 전제로 사용하지 않는다.

---

## 17. URL 및 Controller 작업

현재 프로젝트의 URL은 `.yo` 패턴을 사용한다.

예:

```text
/index.yo
/admin.yo
/yogaList.yo
/yogaStory.yo
/yogaStoryInput.yo
/yogaStoryContent.yo
```

새 URL을 만들기 전에 FrontController와 Controller의 실제 매핑을 검색한다.

URL이 이미 존재하면 중복 매핑을 만들지 않는다.

특히 Controller 충돌 문제가 발생할 수 있으므로 다음을 반드시 확인한다.

- 동일 URL의 중복 mapping
- 동일 command의 중복 실행
- 같은 View로 연결되는 잘못된 분기
- FrontController와 도메인 Controller의 매핑 불일치

---

## 18. 사용자가 직접 수정한 파일 보호

이 규칙은 매우 중요하다.

**사용자가 직접 수정해서 올린 파일은 함부로 재작성하지 않는다.**

작업 요청에 필요한 부분만 최소 범위로 수정한다.

특히 다음 원칙을 지킨다.

```text
기존 코드 확인
  ↓
문제가 있는 부분만 식별
  ↓
최소 수정
  ↓
기존 기능 유지
```

전체 파일을 임의로 새로 작성하여 사용자의 기존 수정사항을 덮어쓰지 않는다.

사용자가 "이 파일만 수정"이라고 지정하면 다른 파일은 수정하지 않는다.

여러 파일이 반드시 필요하다면 먼저 실제 의존관계를 확인하고 필요한 파일만 수정한다.

---

## 19. 파일 작업 전 검색 원칙

Codex에서 작업할 때는 먼저 다음을 검색한다.

```text
greenStudy
```

그리고 필요한 도메인만 검색한다.

### 요가 관련

```text
yoga
YogaController
YogaListCommand
YogaStoryListCommand
YogaDAO
YogaStoryDAO
yogaList.jsp
yogaStoryList.jsp
yogaStoryContent.jsp
index.jsp
```

### 회원 관련

```text
member
MemberController
login
session
role
admin
```

검색 결과를 확인한 뒤 실제 프로젝트의 이름과 구조를 그대로 사용한다.

---

## 20. 데이터 Attribute 이름을 임의로 바꾸지 않는다

예를 들어 Command가:

```java
request.setAttribute("yogaVos", vos);
```

를 사용한다면 JSP에서는:

```jsp
${yogaVos}
```

를 사용한다.

임의로:

```text
${list}
${items}
${yogaList}
```

등으로 변경하지 않는다.

요가스토리도:

```text
storyVos
storyTotalCount
storyCurrentPage
storyTotalPages
storyStartPage
storyEndPage
```

등 기존 Command의 Attribute 이름을 그대로 사용한다.

---

## 21. 수정 후 반드시 확인할 항목

작업이 끝나면 단순히 코드를 작성하는 것으로 끝내지 않는다.

### Java

- import 오류
- 클래스명 오류
- 메서드명 오류
- 패키지명 오류
- DAO 메서드 존재 여부
- Controller/Command 연결 여부

### JSP

- JSTL taglib
- EL 변수명
- `<c:forEach>`
- `<c:choose>`
- `<c:if>`
- HTML 태그 닫힘
- JSP 문법
- 2칸 들여쓰기
- 불필요한 Scriptlet 존재 여부

### DB

- SQL 문법
- `limit ?, ?`
- `order by idx desc`
- 전체 건수와 목록 조회의 조건 일치 여부

### 페이징

반드시 다음을 테스트한다.

```text
데이터 0건
데이터 1건
데이터 10건
데이터 11건
데이터 20건
데이터 21건
데이터 100건 이상
```

특히 다음을 확인한다.

```text
1페이지
10페이지
11페이지
20페이지
21페이지
마지막 페이지
```

---

## 22. 가장 중요한 개발 원칙

이 프로젝트에서 앞으로 모든 작업은 다음 원칙을 최우선으로 한다.

### 문제점 확인

먼저 실제 프로젝트 파일을 검색해서 현재 구조와 문제를 확인한다.

### 개선방안

기존 MVC2 / FrontController / Command / DAO / VO 구조를 유지하면서 최소 범위로 수정한다.

### 실행

실제 파일을 수정하고 다음을 확인한다.

```text
Controller
→ Command(Service)
→ DAO
→ VO
→ request Attribute
→ JSP/JSTL
```

화면 데이터 처리는 Command(Service)에 둔다.

Controller는 최대한 얇게 유지한다.

JSP는 JSTL/EL로 화면 출력만 담당한다.

사용자가 직접 수정한 부분은 보호한다.

모든 코드의 들여쓰기는 2칸으로 한다.

페이지당 10건, 블록당 10페이지의 페이징 규칙을 유지한다.

일반회원에게 관리자 기능을 노출하지 않는다.

요가 목록과 요가스토리 목록의 기존 URL과 Attribute명을 임의로 변경하지 않는다.

이미지 경로는 반드시 실제 프로젝트를 검색하여 확인한다.

**추측해서 파일이나 경로를 만들지 않는다.**

---

## 23. Codex에게 작업을 지시할 때의 기본 행동

사용자가 작업을 요청하면 다음 순서로 처리한다.

```text
1. greenStudy 프로젝트 구조 검색
2. 관련 파일 검색
3. 사용자가 직접 수정한 코드 확인
4. Controller → Command → DAO → VO → JSP 연결 확인
5. 문제점 확인
6. 수정 대상 파일을 최소화
7. 기존 코드 유지
8. 필요한 부분만 수정
9. 2칸 들여쓰기 확인
10. JSP JSTL 구조 확인
11. URL/Attribute 이름 확인
12. 페이징/권한/이미지 경로 확인
13. 컴파일 및 문법 오류 가능성 점검
14. 변경 내용을 파일별로 보고
```

### 절대 하지 말 것

```text
- Controller에 비즈니스 로직 추가
- Controller에서 request.setAttribute()로 화면 데이터 처리
- JSP에 Java Scriptlet 작성
- DAO에 화면 처리 로직 작성
- 사용자가 수정한 코드의 무단 재작성
- 존재하지 않는 파일을 전제로 작업
- 존재하지 않는 URL을 임의 생성
- 이미지 경로 추측
- Attribute 이름 임의 변경
- 기존 MVC2 구조를 다른 구조로 변경
- 4칸 들여쓰기 사용
- 불필요한 전체 파일 재작성
```

이 문서를 `greenStudy` 프로젝트를 Codex로 작업할 때의 기본 프로젝트 지침으로 사용한다.
