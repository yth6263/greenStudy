<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>요가스토리 등록</title>
  <style>
    *{box-sizing:border-box}
    body{margin:0;background:#f5f8f6;color:#172c25;font-family:"Noto Sans KR","Malgun Gothic",sans-serif}
    .wrap{width:min(900px,calc(100% - 40px));margin:60px auto}
    .top{display:flex;justify-content:space-between;align-items:flex-end;margin-bottom:28px}
    .title h1{margin:0 0 8px;font-size:36px;letter-spacing:-2px}
    .title p{margin:0;color:#718079;font-size:16px}
    .actions{display:flex;gap:8px}
    .btn{display:inline-flex;align-items:center;justify-content:center;height:42px;padding:0 18px;border:1px solid #aebbb5;border-radius:8px;background:#fff;color:#30413b;text-decoration:none;font-size:15px;cursor:pointer}
    .btn-primary{border-color:#168653;background:#168653;color:#fff;font-weight:700}
    .card{overflow:hidden;background:#fff;border:1px solid #e1e8e4;border-radius:16px;box-shadow:0 10px 30px rgba(26,54,43,.07)}
    .card-head{padding:20px 28px;background:#168b55;color:#fff;font-size:17px;font-weight:700}
    .form{padding:32px 30px}
    .field{margin-bottom:24px}
    .field label{display:block;margin-bottom:9px;font-size:16px;font-weight:700;color:#20342d}
    .required{color:#e64d4d}
    input[type="text"],select,textarea{width:100%;border:1px solid #d5dfda;border-radius:8px;background:#fff;color:#263831;font:inherit;outline:none}
    input[type="text"],select{height:46px;padding:0 13px}
    textarea{min-height:240px;padding:13px;line-height:1.7;resize:vertical}
    input[type="text"]:focus,select:focus,textarea:focus{border-color:#78b99b;box-shadow:0 0 0 3px rgba(22,139,85,.10)}
    .file-box{display:flex;align-items:center;border:1px solid #d5dfda;border-radius:8px;overflow:hidden;background:#fff}
    .file-box input[type="file"]{width:100%;padding:11px;font:inherit;color:#65736d}
    .help{margin-top:7px;color:#7c8984;font-size:13px}
    .preview{display:none;margin-top:12px;width:180px;height:120px;border:1px solid #e0e6e3;border-radius:8px;object-fit:cover}
    .bottom{display:flex;justify-content:center;gap:10px;margin-top:30px;padding-top:24px;border-top:1px solid #edf1ef}
    @media(max-width:640px){
      .wrap{width:calc(100% - 24px);margin:30px auto}
      .top{align-items:flex-start;flex-direction:column;gap:18px}
      .title h1{font-size:30px}
      .actions{width:100%}
      .actions .btn{flex:1}
      .form{padding:24px 18px}
    }
  </style>
</head>
<body>
  <main class="wrap">
    <div class="top">
      <div class="title">
        <h1>요가스토리 등록</h1>
        <p>요가와 명상에 관한 새로운 이야기를 등록합니다.</p>
      </div>
      <div class="actions">
        <a href="${pageContext.request.contextPath}/yogaStory.yo" class="btn">요가스토리 목록</a>
      </div>
    </div>
    <section class="card">
      <div class="card-head">요가스토리 정보 입력</div>
      <form class="form" action="yogaStoryInputOk.yo" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
        <div class="field">
          <label for="part">요가스토리 <span class="required">*</span></label>
          <select id="part" name="part" required>
            <option value="">요가스토리를 선택하세요.</option>
            <option>하타요가</option>
            <option>빈야사요가</option>
            <option>아쉬탕가요가</option>
            <option>인요가</option>
            <option>핫요가</option>
            <option>플라잉요가</option>
            <option>아크로요가</option>
            <option value="기타">기타</option>
          </select>
        </div>
        <div class="field">
          <label for="title">제목 <span class="required">*</span></label>
          <input type="text" id="title" name="title" maxlength="200" placeholder="요가스토리 제목을 입력하세요." required>
        </div>
        <div class="field">
          <label for="content">내용 <span class="required">*</span></label>
          <textarea id="content" name="content" maxlength="5000" placeholder="요가스토리의 내용을 입력하세요." required></textarea>
        </div>
        <div class="field">
          <label for="photo">요가스토리 사진 <span class="required">*</span></label>
          <div class="file-box">
            <input type="file" id="photo" name="photo" accept="image/jpeg,image/png,image/gif,image/webp" required onchange="previewImage(this)">
          </div>
          <div class="help">JPG, PNG, GIF, WEBP 이미지 / 최대 10MB</div>
          <img id="preview" class="preview" alt="선택한 이미지 미리보기">
        </div>
        <div class="bottom">
          <a class="btn" href="yogaStoryList.yo">취소</a>
          <button class="btn btn-primary" type="submit">요가스토리 등록</button>
        </div>
      </form>
    </section>
  </main>
  <script>
    function previewImage(input){
      const preview=document.getElementById("preview");
      const file=input.files && input.files[0];
      if(!file){
        preview.style.display="none";
        preview.removeAttribute("src");
        return;
      }
      const reader=new FileReader();
      reader.onload=function(e){
        preview.src=e.target.result;
        preview.style.display="block";
      };
      reader.readAsDataURL(file);
    }
    function checkForm(){
      const part=document.getElementById("part").value.trim();
      const title=document.getElementById("title").value.trim();
      const content=document.getElementById("content").value.trim();
      const photo=document.getElementById("photo").files.length;
      if(!part){
        alert("요가종류를 선택해주세요.");
        return false;
      }
      if(!title){
        alert("제목을 입력해주세요.");
        document.getElementById("title").focus();
        return false;
      }
      if(!content){
        alert("내용을 입력해주세요.");
        document.getElementById("content").focus();
        return false;
      }
      if(!photo){
        alert("사진을 선택해주세요.");
        return false;
      }
      return true;
    }
  </script>
</body>
</html>
