<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language) : ${sAtom}</h2>
  <p>저장소(서버 저장소:ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당</p>
  <hr/>
  <pre>
    용도 : 사용자가 '변수/값/수식/객체'등을 전송받은후에 저장, 또는 기타 처리하는 용도로 사용함.
    표기법 : $ {변수/값/객체}
    서버저장소 : Application / Session / PageContext / Request
  </pre>
  <div class="text-end"><a href="<%=request.getContextPath()%>/study2/jstl/JstlMenu" class="btn btn-warning">돌아가기</a></div>
  <hr/>
  <h4>스크립틀릿을 이용한 출력</h4>
<%
  String atom = "Seoul";
  String name = "홍길동";
  int su1 = 100, su2 = 200;
%>
  <div>
    atom = <%=atom %><br/>
    name = <%=name %><br/>
    su1 = <%=su1 %><br/>
    su1 + su2 = <%=(su1+su2) %><br/>
  </div>
  <br/>
  <h4>EL을 이용한 출력</h4>
<%
  request.setAttribute("atom", atom);
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("su1", su1);
  pageContext.setAttribute("su2", su2);
%>
  <div>
    atom = ${atom}<br/>
    name = ${name}<br/>
    su1 = ${su1}<br/>
    su1 + su2 = ${(su1+su2)}<br/>
  </div>
  <br/>
  <h2>서버에서 전송된 값을 출력(스크립틀릿)</h2>
<%
  String juso = request.getParameter("juso");
  int nai = Integer.parseInt(request.getParameter("nai"));
%>
  <div>주소 : <%=juso %></div>
  <div>나이 : <%=nai %></div>
  <br/>
  <h2>서버에서 전송된 값을 출력(EL)</h2>
  <div>주소 : ${address}</div>
  <div>나이 : ${age}</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>