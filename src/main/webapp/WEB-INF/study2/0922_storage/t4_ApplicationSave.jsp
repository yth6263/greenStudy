<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) application.getAttribute("aMid");
	String nickName = (String) application.getAttribute("aNickName");
	String name = (String) application.getAttribute("aName");
	
	application.setAttribute("aMid", mid);
	application.setAttribute("aNickName", nickName);
	application.setAttribute("aName", name);
%>
<script>
  alert("어플리케이션이 생성/저장 되었습니다.");
  location.href = "<%=request.getContextPath()%>/T4_Application";
</script>