<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>jstl4.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h3>체험명상글</h3>
  <hr/>
  <div class="text-end"><a href="<%=request.getContextPath()%>/study2/jstl/jstlMenu" class="btn btn-warning">돌아가기</a></div>
  <hr/>
 <!--   <div>str : ${str}</div>   -->
  <div> ${str}</div>
  <b>체험명상글</b><br/>
    <br>
   <h5>30분간 명상하는법</h5>
   <br/>
<div class="bg-primary text-white text-center">
   <img src="${ctp}/images/113.png" width="100%" height="400px" />
</div>

<br/>
<h5>
이번에는 **30분** 동안 깊이 있게 진행할 수 있는 **마음챙김 + 호흡 중심 + 보디스캔**을 섞은 명상 가이드를 드릴게요.  

15분보다 길어졌으니 중간에 지루하거나 힘들면 언제든 “괜찮아” 하면서 부드럽게 이어가면 됩니다.

​<br/>

편안한 곳에 앉거나 누워서 준비됐으면 시작해 볼게요.  

(타이머를 30분으로 미리 맞춰두면 좋아요)
​<br/>

**0~3분 : 착석 & 중심 잡기**  

편안한 자세를 잡습니다. (등은 곧게, 어깨는 내려놓기)  

양손은 무릎 위나 허벅지 위에 자연스럽게.  

눈은 살짝 감거나 반쯤 뜨고 아래를 향하게.

​​<br/>

세 번 깊게 숨을 쉬어봅니다.  

들숨 → 코로 천천히 깊게 들이마시며 배 → 가슴까지 채우기  

날숨 → 입이나 코로 천천히 길게 내쉬며 모든 긴장 내려놓기

​<br/>
**3~10분 : 호흡에 기본 집중 (아나파나사티 기본)**  

이제 자연스러운 숨에 주의를 줍니다.  
​<br/>
숨이 들어올 때 “들숨”  

숨이 나갈 때 “날숨”  

마음속으로 가볍게 알아차리기만 하면 돼요.

​​<br/>

숨의 느낌을 관찰하세요  

- 코끝이 시원한가 / 따뜻한가  

- 배가 오르내리는가  

- 가슴이 움직이는가  

- 숨의 길이 / 깊이 / 속도는 어떤가

​​<br/>

생각이 떠오르면  
​<br/>
“아… 생각” 하고 라벨링 한 뒤  

다시 숨으로 부드럽게 돌아옵니다.  

(판단 NO, 그냥 알아차림 연습)

​<br/>
**10~20분 : 보디스캔 (전신 스캔)**  

이제 주의를 몸으로 넓혀봅니다.  

숨을 쉬면서 아래부터 천천히 스캔해요.

​​<br/>

1. 발바닥 → 발가락 → 발등 → 발목  

   → 어떤 감각이 느껴지나요? (따뜻함, 저림, 무감각, 압력 등)  

   그대로 느껴보고 다음으로

​​<br/>

2. 종아리 → 무릎 → 허벅지 앞뒤  
​<br/>

3. 엉덩이 → 골반 → 허리 → 등 전체  
​<br/>

4. 배 → 가슴 → 옆구리 
​<br/> 

5. 어깨 → 팔 → 팔꿈치 → 손목 → 손가락 끝  
​<br/>

6. 목 → 턱 → 입술 → 뺨 → 코 → 눈 → 이마 → 머리 꼭대기

​

각 부위마다 10~20초 정도 머물며  

“여기 어떤 느낌이 들까?” 하고 관찰합니다.  

긴장이 느껴지면 숨을 내쉬면서 “놓아준다…” 하고 살짝 풀어줍니다.

<br/>
​
**20~27분 : 마음챙김 넓은 관찰 (오픈 모니터링)**  

이제 특정 대상(숨·몸)에 고정하지 않고  

지금 이 순간에 일어나는 모든 것을 넓게 지켜봅니다.

​​<br/>

- 숨이 느껴지면 알아차림  

- 소리가 들리면 “소리”  

- 생각·감정이 떠오르면 “생각 중…”, “감정 중…”  

- 몸의 감각이 변하면 그대로 따라가기

​​<br/>

판단하거나 붙잡지 않고  

구름이 흘러가듯, 강물이 흐르듯  

그냥 지켜보는 연습입니다.

​​<br/>

**27~29분 : 자비 명상으로 짧게 마무리**  

마지막으로 마음을 따뜻하게 마무리해 봅니다.

​
​<br/>
먼저 자신에게  

“내가 편안하기를… 내가 행복하기를… 내가 건강하기를…”

​
<br/>
그 다음 가까운 사람 (가족·친구) 한 명 떠올리며  

“너도 편안하기를… 너도 행복하기를…”

​​<br/>

마지막으로 모든 존재에게  

“모두가 편안하고 행복하고 자유롭기를…”

<br/>
**29~30분 : 천천히 마무리**  

다시 숨을 크게 한 번 들이마시고……  

길게~ 천천히 내쉽니다.

​​<br/>

손가락·발가락 살살 움직여보고  

몸을 살짝 흔들거나 스트레칭 해도 좋아요.

​​<br/>

준비되면 아주 천천히 눈을 뜹니다.

​<br/>
어땠나요?  

30분은 꽤 긴 시간이지만, 중간에 “이제 지루해” 하는 마음도 명상의 일부예요.  

그 마음마저도 그냥 지켜보는 게 핵심이거든요.

​
​<br/>
오늘도 정말 잘 해냈어요.  

꾸준히 하면 정말 몸과 마음이 달라지는 걸 느낄 거예요

수고 많았습니다.
</h5>
<br/>
  
    <!--  
    <br/>
    오늘날짜 : ${today}<br/>
    오늘날짜 : <fmt:formatDate value="${today}"/><br/>
    오늘날짜 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/>
    오늘날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/><br/>
    오늘날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
    오늘날짜시간 : <fmt:formatDate value="${today}" pattern="yy-M-d H:m:s"/><br/>
    <br/>
    -->
  
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>