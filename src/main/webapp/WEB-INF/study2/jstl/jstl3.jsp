<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>jstl3.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>체험명상글</h2>
  <hr/>
  <div class="text-end"><a href="<%=request.getContextPath()%>/study2/jstl/jstlMenu" class="btn btn-warning">돌아가기</a></div>
  <hr/>
  <!--  <div>str : ${str}</div>  -->
  <div> ${str}</div>
  <b>체험명상글</b><br/>
  <div class="bg-primary text-white text-center">
   <img src="${ctp}/images/112.png" width="100%" height="400px" />
</div>
  
  
  
    <br/>
   <h5>명상으로 깨달음을 향해서 정진하는법</h5>
   
   <br/>
<h5>
'깨달음'을 위한 명상은 단순히 생각을 멈추는 것이 아니라, 나라는 존재의 본질과 세상의 실상을 깊이 통찰하는 과정입니다. 거창해 보일 수 있지만, 사실 '지금 이 순간'으로 온전히 돌아오는 것에서 시작됩니다.

깨달음 명상을 시작하는 구체적인 단계와 핵심 원리를 정리해 드릴게요.

​
<br/>
1. 수행의 핵심: 관찰자 되기
<br/>
​

깨달음 명상의 첫걸음은 내 생각과 감정을 '나'라고 착각하지 않는 것입니다.

 * 객관화하기: 머릿속에 떠오르는 생각들을 마치 강물에 떠내려가는 나뭇잎처럼 바라보세요.

 * 라벨링(Labeling): 불안이 올라오면 "내가 불안하다"가 아니라, "불안이라는 감정이 일어나고 있구나"라고 이름표를 붙여보세요. 관찰하는 '나'와 관찰되는 '감정' 사이에 공간이 생깁니다.

​
<br/>
2. 구체적인 명상 방법 (위빠사나/마음챙김)
<br/>
​

전통적으로 깨달음을 추구하는 가장 대표적인 방법은 **위빠사나(Vipassana, 통찰 명상)**입니다.

 * 호흡에 집중: 코끝을 지나는 공기의 감촉이나 배의 들숨·날숨에 집중합니다.

 * 감각 알아차림: 몸의 가려움, 통증, 시원함 등을 판단 없이 그대로 느낍니다. "왜 아프지?"가 아니라 "통증이 있네"라고 인지하는 것입니다.

 * 무상(無常) 이해: 모든 감각과 생각은 생겨났다가 반드시 사라진다는 사실을 직접 경험합니다. 이 '변함'을 깊이 이해하는 것이 깨달음의 핵심입니다.

​
<br/>
3. 깨달음을 위한 질문 (화두 명상)

​<br/>

전통적인 선(禪) 불교에서는 논리를 초월한 질문을 던져 에고를 타파합니다.

 * "이것을 보고 듣는 '나'는 누구인가?"

 * "부모에게 태어나기 전 나의 본래 모습은 무엇인가?"

 * 답을 머리로 찾으려 하지 말고, 그 질문이 주는 '꽉 막힌 느낌'이나 '의문' 그 자체에 머무르는 연습을 합니다.

​<br/>

💡 명상할 때 주의할 점

​<br/>

 "깨달아야 한다"는 집착마저 버리세요. 

무언가 특별한 현상(빛이 보이거나 공중부양을 하는 듯한 느낌)에 집착하면 오히려 길을 잃기 쉽습니다. 깨달음은 특별한 체험이 아니라, 왜곡 없는 평온한 일상으로 돌아오는 것입니다.

명상은 하루 10분이라도 꾸준히 하는 것이 중요합니다. 
<br/>
  
    
    <br/>
<!--     오늘날짜 : ${today}<br/>
    오늘날짜 : <fmt:formatDate value="${today}"/><br/>
    오늘날짜 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/>
    오늘날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/><br/>
    오늘날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>  --> 
    오늘날짜시간 : <fmt:formatDate value="${today}" pattern="yy-M-d H:m:s"/><br/>
    <br/>
   </h5>
  
  
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>