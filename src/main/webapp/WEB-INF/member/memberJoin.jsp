<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>memberJoin.jsp</title>
  <script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  
  <script>
    'use strict';
    
    let idCheckSw = 0;
    let nickCheckSw = 0;
    
    function fCheck() {
    	// 유효성 검사(아이디, 닉네임, 성명, 이메일, 홈페이지, 전화번호, 비밀번호 등등.....)
    	
    	// 정규식을 통한 유효성 검사처리...
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/; 			// 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
    	//let regPwd = /{2,15}$/;										// 비밀번호는 2~15
      let regNickName = /^[가-힣0-9_]{2,20}$/;		// 닉네임은 2~20자의 한글, 숫자, 밑줄만 가능
      let regName = /^[가-힣a-zA-Z]{2,20}$/;			// 이름은 2~20자의 한글/영문 가능
      const regEmail = /^[a-zA-Z0-9._%+\-]+$/; 	// 이메일은 email형식에 맞도록 처리...
      const regUrl = /^https?:\/\/([a-z0-9-]+\.)+[a-z]{2,}(\/[^\s]*)?$/i; // 홈페이지입력시는 url형식에 맞도록 처리...
      const regTel = /^\d{3,4}$/; 						// 전화번호입력시는 전화번호형식에 맞도록처리
    	
    	
    	let mid = document.myform.mid.value.trim();
    	let pwd = document.myform.pwd.value.trim();
    	let nickName = document.myform.nickName.value;
    	let name = document.myform.name.value;
    	
    	let email1 = document.myform.email1.value.trim();
    	let email2 = document.myform.email2.value;
    	let email = email1 + "@" + email2;
    	
    	let tel1 = document.myform.tel1.value;
    	let tel2 = document.myform.tel2.value.trim();
    	let tel3 = document.myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	let postcode = document.myform.sample6_postcode.value;
    	let roadAddress = document.myform.sample6_address.value;
    	let detailAddress = document.myform.sample6_detailAddress.value;
    	let extraAddress = document.myform.sample6_extraAddress.value;
    	let address = postcode + " /" + roadAddress + " /" + detailAddress + " /" + extraAddress + " ";
    	
    	let homePage = document.myform.homePage.value.trim();
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~40자리의 영문 '소/대문자'와 숫자와 언더바(_)만 가능합니다.");
    		document.myform.mid.focus();
    		return false;
    	}
    	else if(pwd.length < 4 || pwd.length > 20) {
        alert("비밀번호는 4~20 자리로 작성해주세요.");
        document.myform.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        document.myform.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        document.myform.name.focus();
        return false;
      }
      else if(!regEmail.test(email1)) {
        alert("이메일을 확인하세요.");
        document.getElementById("email1").focus();
        return false;
      }
    	
    	// 필수입력 아닌 사항들의 체크
    	/* 
      if(homePage != "" && !regUrl.test(homePage)) {
        alert("홈페이지를 확인하세요.");
        document.getElementById("homePage").focus();
        return false;
      }
    	 */
			
    	if(tel2 != "" && !regTel.test(tel2)) {
    		alert("전화번호(국번호)를 확인하세요.");
        document.getElementById("tel2").focus();
        return false;
			}
    	else if(tel3 != "" && !regTel.test(tel3)) {
    		alert("전화번호를 확인하세요.");
        document.getElementById("tel3").focus();
        return false;
			}
			else {
				tel2 = " ";
				tel3 = " ";
				tel = tel1 + "-" + tel2 + "-" + tel3;
			}
    	
			// 전송전에 파일에 관련된 사항들을 체크해준다.
			let fName = document.getElementById("file").value;
			if(fName.trim() != "") {
				let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				let maxSize = 1024 * 1024 * 10;
				let fileSize = document.getElementById("file").files[0].size;
				
				if(ext != 'jpg' && ext != 'gif' && ext != 'png') {
					alert("그림파일만 업로드 가능합니다.");
					return false;
				}
				else if(fileSize > maxSize) {
					alert("업로드할 파일의 최대용량은 10MByte입니다.");
					return false;
				}
			}
			//else return false;
			
			// 아이디/닉네임 중복버튼 눌렀는지 체크
    	if(idCheckSw == 0) {
    		alert("아이디 중복체크버튼을 눌러주세요");
    		document.getElementById("midBtn").focus();
    	}
    	else if(nickCheckSw == 0) {
    		alert("닉네임 중복체크버튼을 눌러주세요");
    		document.getElementById("nickNameBtn").focus();
    	}
    	else {
    		myform.email.value = email;
    		myform.tel.value = tel;
    		myform.address.value = address;
    		
    		myform.submit();
    	}
    }
    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "memberIdCheck.mem",
    		type : "get",
    		data : {mid : mid},
    		success: (res) => {
    			if(res != "0") {
    				alert("아이디가 중복되었습니다.\n다른아이디로 검색하세요.");
    				document.myform.mid.focus();
    			}
    			else {
    				alert("사용 가능한 아이디 입니다.");
    				idCheckSw = 1;
    				document.myform.pwd.focus();
    			}
    		},
    		error :  () => alert("전송오류!")
    	});
    }
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nickName = myform.nickName.value;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		myform.nickName.focus();
    	}
    	else {
    		$.ajax({
    			url  : "memberNickCheck.mem",
    			type : "post",
    			data : {nickName : nickName},
    			success: (res) => {
    				if(res != '0') {
    					alert("이미 사용중인 닉네임 입니다. 다시 입력하세요.");
    					myform.nickName.focus();
    				}
    				else {
    					alert("사용 가능한 닉네임 입니다.");
    					nickCheckSw = 1;
    				}
    			},
    			error : () =>	alert("전송 오류!")
    		});
    	}
    }
    
    // 아이디/닉네임 확인처리시, 아이디/닉네임 체크확인
    $(function(){
    	$("#mid").on("blur", () => idCheckSw = 0);
    	$("#nickName").on("blur", () => nickCheckSw = 0);
    });
    
    // 선택된 사진 미리보기
    function imgCheck(e) {
    	if(e.files && e.files[0]) {
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("photoDemo").src = e.target.result;
    		}
    		reader.readAsDataURL(e.files[0]);
    	}
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="memberJoinOk.mem" class="was-validated" enctype="multipart/form-data">
    <h2>회 원 가 입</h2>
    <br/>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="mid">아이디</label></div>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
      <input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary btn-sm" onclick="idCheck()"/>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="pwd">비밀번호 :</label></div>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="nickName">닉네임</label></div>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
      <input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="name">성명 :</label></div>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="email1">Email address:</label></div>
      <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
      <div class="input-group-text">@</div>
      <select name="email2" class="form-select">
        <option value="naver.com" selected>naver.com</option>
        <option value="hanmail.net">hanmail.net</option>
        <option value="hotmail.com">hotmail.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option>
        <option value="yahoo.com">yahoo.com</option>
      </select>
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
      <div class="form-check"><input type="radio" name="gender" value="남자" class="me-1" checked />남자</div>
      <div class="form-check"><input type="radio" name="gender" value="여자" class="ms-3 ms-4 me-1" />여자</div>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="birthday">생일</label></div>
      <input type="date" name="birthday" value="<%=LocalDate.now()%>" class="form-control"/>
    </div>
    <div class="input-group">
      <div class="input-group mb-3">
        <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
        <select name="tel1" class="custom-select">
          <option value="010" selected>010</option>
          <option value="02">서울</option>
          <option value="031">경기</option>
          <option value="032">인천</option>
          <option value="041">충남</option>
          <option value="042">대전</option>
          <option value="043">충북</option>
          <option value="051">부산</option>
          <option value="052">울산</option>
          <option value="061">전북</option>
          <option value="062">광주</option>
        </select>-
        <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
        <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
      </div>
    </div>
    <div class="input-group mb-3">
      <label for="address">주소</label>
      <div class="input-group mb-1">
        <input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success">
			</div>
			<div class="input-group mb-1">
				<input type="text" id="sample6_address" placeholder="주소" class="form-control"><br>
			</div>
			<div class="input-group mb-1">
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
      </div>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="homepage">Homepage address:</label></div>
      <input type="text" class="form-control" name="homePage" value="http://" placeholder="홈페이지를 입력하세요." id="homePage"/>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="job">직업</label></div>
      <select class="form-select" id="job" name="job">
        <option>학생</option>
        <option>회사원</option>
        <option>공무원</option>
        <option>군인</option>
        <option>의사</option>
        <option>법조인</option>
        <option>세무인</option>
        <option>자영업</option>
        <option selected>기타</option>
      </select>
    </div>
    <div class="input-group mb-3">
       <span class="input-group-text">취미</span>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" class="input-check-input ms-3" value="등산" name="hobby"/>등산 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" value="낚시" name="hobby"/>낚시 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" class="input-check-input" value="수영" name="hobby"/>수영 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" class="input-check-input" value="독서" name="hobby"/>독서 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" class="input-check-input" value="영화감상" name="hobby"/>영화감상 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" class="input-check-input" value="바둑" name="hobby"/>바둑 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="input-check-label">
          <input type="checkbox" class="input-check-input" value="축구" name="hobby"/>축구 &nbsp;
        </label>
      </div>
      <div class="input-check-inline">
        <label class="form-check-label">
          <input type="checkbox" value="기타" name="hobby" checked/>기타
        </label>
      </div>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-text"><label for="content">자기소개</label></div>
      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
      <div class="form-check"><input type="radio" name="userInfor" value="공개" class="me-1" checked />공개</div>
      <div class="form-check"><input type="radio" name="userInfor" value="비공개" class="ms-3 ms-4 me-1" />비공개</div>
    </div>
    <div  class="input-group mb-3">
      <div class="input-group-text">회원 사진(파일용량:2MByte이내)</div>
      <input type="file" name="fName" id="file" onchange="imgCheck(this)" class="form-control border"/>
      <div><img id="photoDemo" width="100px"/></div>
    </div>
    <button type="button" class="btn btn-success" onclick="fCheck()">회원가입</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-warning" onclick="location.href='memberLogin.mem';">돌아가기</button>
    
    <input type="hidden" name="email"/>
    <input type="hidden" name="address"/>
    <input type="hidden" name="tel"/>
  </form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>