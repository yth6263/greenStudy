<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test01.jsp</title>
  <script>
    // 이곳은 자바스크립트 한줄 주석입니다.
    /* 이곳은 자바스크립트 여러줄 주석입니다. */
  </script>
  <style>
    /* 이곳은 css 주석입니다. */
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>길동이네 집에 오신것을 환영합니다!!!!!!!!!</h2>
  <hr/>
  <!-- 이곳은 html 주석입니다. -->
  <p>이곳은 본문입니다.</p>
  <%
    System.out.println("이곳은 jsp view 화면 입니다.");
  
  	// 1~10까지의 합
    int i = 0, tot = 0;
    while(i<10) {
    	i++;
    	tot += i;
    }
    System.out.println("1~10까지의 합은? " + tot);
    out.println("1~10까지의 합은? " + tot);
  %>
  <div>JSP의 표현식</div>
  <div>1~10까지의 합은 <%=tot %>입니다.</div>
  <%-- <div>이곳은 JSP 주석입니다.<font color='red'><%=tot %></font></div> --%>
  <hr/>
  <div><a href="/greenStudy" class="btn btn-success">홈으로</a></div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>