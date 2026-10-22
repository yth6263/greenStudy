<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test1.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>test1.jsp</h2>
  <hr/>
  <!-- test1.jsp입니다. -->
  <%-- <%=new Date() %> --%>
  <p><a href="test2.jsp" class="btn btn-success">1.test2.jsp</a></p>
  <p><a href="test2.jsp?su1=10&su2=20" class="btn btn-primary">2.test2.jsp</a></p>
  <p><a href="test2_3.jsp?su1=30&su2=40" class="btn btn-secondary">3.test2_3.jsp</a></p>
</div>
<p><br/></p>
</body>
</html>