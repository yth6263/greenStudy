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
  <title>test6.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>test6.jsp</h2>
  <hr/>
  <div>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/Test6Ok">
    	<div class="input-group mb-2">
	    	<div class="input-group-text">su1</div>
    	  <input type="number" name="su1" min="0" value="10" autofocus required class="form-control" />
    	</div>
    	<div class="input-group mb-3">
	    	<div class="input-group-text">su2</div>
    	  <input type="number" name="su2" min="0" value="20" required class="form-control" />
    	  <input type="submit" value="전송하기" class="btn btn-success"/>
    	</div>
    </form>
  </div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>