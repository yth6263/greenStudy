<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
  String name = request.getParameter("name");
  int age = Integer.parseInt(request.getParameter("age"));
  String gender = request.getParameter("gender");
  String card = request.getParameter("card");
  String job = request.getParameter("job");
  String content = request.getParameter("content");
  content = content.replace("\n", "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test8Res.jsp</title>
  <style>
    th, td {
      text-align: center;
    }
    
    th {
      background-color: #eee !important;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>test8Res.jsp</h2>
  <hr/>
  <table class="table table-bordered">
    <tr>
	  	<th>아이디</th><td><%=mid%></td>
	  </tr>
	  <tr>
	  	<th>비밀번호</th><td><%=pwd%></td>
	  </tr>
	  <tr>
	  	<th>성명</th><td><%=name%></td>
	  </tr>
	  <tr>
	  	<th>나이</th><td><%=age%></td>
	  </tr>
	  <tr>
	  	<th>성별</th><td><%=gender%></td>
	  </tr>
	  <tr>
	  	<th>카드</th><td><%=card%></td>
	  </tr>
	  <tr>
	  	<th>직업</th><td><%=job%></td>
	  </tr>
	  <tr>
	  	<th>자기소개서</th>
	  	<td>
	  	  <table align="center">
	  	    <tr>
	  	      <td style="text-align:left"><%=content%></td>
	  	    </tr>
	  	  </table>
	  	</td>
	  </tr>
  </table>
  <hr/>
  <div><a href="<%=request.getContextPath()%>/t8" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>