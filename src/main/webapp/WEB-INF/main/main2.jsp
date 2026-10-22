<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>명상 홈페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
  </style>
</head>
<body>

<%@ include file="/include/header.jsp" %>

<%-- <%@ include file="/include/nav.jsp" %> --%>
<jsp:include page="/include/nav.jsp" />

<div class="container mt-5">
  <div class="row">
    <div class="col-sm-2">
      <h3>명상체험하기</h3> 
     <!--  <h5>Photo of me:</h5>  --> 
      <div class="fakeimg"><img src="<%=request.getContextPath()%>/images/114.jpg" width="240px" hight="100px"/></div> <br/><p/>
      <div class="fakeimg "><img src="<%=request.getContextPath()%>/images/116.jpg" width="240px" hight="100px"/></div>
 
 <!--    
       <p>Some text about me in culpa qui officia deserunt mollit anim..</p>   
      <h3 class="mt-8">Some Links</h3>
     
      <br/>
      <p><h3>선재동자 이야기</h3></p>
      <br/>
      <div class="fakeimg"><img src="<%=request.getContextPath()%>/images/113.png" width="100%" hight="10px"/></div>
     
      
       <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a> 
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a> -->
         <!--   
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">  
    </div>  
     
    
    <div class="col-sm-8">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Dec 7, 2020</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
      
   

      <h2 class="mt-5">TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2020</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
   
    -->
   </div>
  </div>
</div>

<%@ include file="/include/footer.jsp" %>

</body>
</html>
