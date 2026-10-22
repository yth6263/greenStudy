<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="bg-primary text-white text-center">
  <!-- 
  <h1>My First Bootstrap 5 Page</h1>
  <p>Resize this responsive page to see the effect!</p>
   --> 
  
  <%-- <img src="${ctp}/images/31.jpg" width="100%" height="280px" /> --%>
  
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${ctp}/images/data/yoga/112.png" alt="Los Angeles" class="d-block" style="width:100%; height:450px">
    </div>
    <div class="carousel-item">
      <img src="${ctp}/images/998.jpg" alt="Chicago" class="d-block" style="width:100%; height:450px">
    </div>
    <div class="carousel-item">
      <img src="${ctp}/images/999.jpg" alt="New York" class="d-block" style="width:100%; height:450px">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
  
</div>