<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>요가스토리 등록 | 마음쉼 요가</title>
<style>
*{box-sizing:border-box}
body{margin:0;background:#f5f7f5;color:#26332c;font-family:Arial,"Malgun Gothic",sans-serif}
.page{width:90%;max-width:900px;margin:45px auto 80px}
.top{display:flex;justify-content:space-between;align-items:end;margin-bottom:25px}
h1{margin:0;font-size:34px}
.desc{margin:8px 0 0;color:#748079}
.form-card{background:#fff;border:1px solid #e0e6e1;border-radius:16px;overflow:hidden;box-shadow:0 5px 20px rgba(0,0,0,.05)}
.form-head{padding:20px 28px;background:#198754;color:#fff;font-size:18px;font-weight:700}
.form-body{padding:30px}
.field{margin-bottom:22px}
label{display:block;margin-bottom:8px;font-weight:700}
input,select,textarea{width:100%;padding:12px 14px;border:1px solid #d6ddd8;border-radius:8px;font-size:16px}
textarea{min-height:240px;resize:vertical}
.actions{display:flex;justify-content:center;gap:10px;margin-top:30px}
.btn{display:inline-block;padding:11px 22px;border-radius:8px;text-decoration:none;border:1px solid #adb7b1;background:#fff;color:#33443b;cursor:pointer;font-weight:700}
.btn-green{background:#198754;color:#fff;border-color:#198754}
.help{margin-top:7px;color:#7c8781;font-size:13px}
@media(max-width:600px){.page{width:94%}.form-body{padding:20px}.top{align-items:start;gap:15px;flex-direction:column}}
</style>
</head>
<body>
<div class="page">
	<div class="top"><div><h1>요가스토리 등록</h1><p class="desc">요가와 명상에 관한 새로운 이야기를 등록합니다.</p></div><a href="${ctp}/yogaStory.yo" class="btn">요가스토리 목록</a></div>
	<div class="form-card">
		<div class="form-head">요가스토리 정보 입력</div>
		<div class="form-body">
			<form action="${ctp}/yogaStoryInputOk.yo" method="post" enctype="multipart/form-data">
				<div class="field"><label for="part">요가종류 <span style="color:#e33">*</span></label><select id="part" name="part" required><option value="">요가종류를 선택하세요.</option><option value="하타요가">하타요가</option><option value="아크로요가">아크로요가</option><option value="플라잉요가">플라잉요가</option><option value="핫요가">핫요가</option><option value="인요가">인요가</option><option value="집중명상">집중명상</option><option value="자애명상">자애명상</option><option value="기타">기타</option></select></div>
				<div class="field"><label for="title">제목 <span style="color:#e33">*</span></label><input id="title" name="title" type="text" maxlength="100" placeholder="요가스토리 제목을 입력하세요." required></div>
				<div class="field"><label for="content">내용</label><textarea id="content" name="content" placeholder="요가스토리 내용을 입력하세요."></textarea></div>
				<div class="field"><label for="photo">사진 <span style="color:#e33">*</span></label><input id="photo" name="photo" type="file" accept="image/jpeg,image/png,image/gif,image/webp" required><div class="help">JPG, PNG, GIF, WEBP 이미지 / 최대 10MB</div></div>
				<div class="actions"><a href="${ctp}/yogaStory.yo" class="btn">취소</a><button type="submit" class="btn btn-green">요가스토리 등록</button></div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
