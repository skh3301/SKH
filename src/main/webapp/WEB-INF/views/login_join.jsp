<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix ="sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSRF 관련 -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <title>login_join</title>
</head>
<body class="pt-5">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="header.jsp" %>
<main class="mt-3">
    <!-- 이 부분에 메인 작성 -->
     <!-- 클라이언트 단에서 유효성 검사할 수 있도록 추가 코드 작성할 것-->
<div class="container" id="joinLogin" style="width:380px; margin:0 auto;">

	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
	    <li class="nav-item" role="presentation">
	    	<button class="nav-link active" style="width:175px;" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">로그인</button>
	    </li>
	    <li class="nav-item" role="presentation">
	    	<button class="nav-link" style="width:175px;" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">회원가입</button>
	    </li>
	</ul> 
    <div class="tab-content" id="pills-tabContent">
    	
        <!-- 로그인 form 완성 -->
        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
        	<div id="div1" class="text-success mb-1"></div>
            <form method="post" action="login">
            <!-- csrf를 방지하기 위한 헤더 부분 추가 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="memId" />
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="memPw" />
                    <label for="floatingPassword">Password</label>
                </div>
                <input type="checkbox" class="form-check-input" id="rememberMe" name="remember-me" checked />로그인 정보 기억하기
                <div class="checkbox mb-3">
                    <button class="w-100 btn btn-lg btn-secondary" type="submit">로그인</button>
                </div>
            </form>            
        </div>
        <!-- 회원가입 form (유효성 검사 해야함) -->
        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
            <form id="join" action="join" method="post" enctype="multipart/form-data">
                <h3>
                    USER ID
                    <small class="text-muted">(메일 주소 형식)</small>
                </h3>
                <div class="mb-3 input-group">
                    <input type="email" class="form-control" id="checkMemId" placeholder="name@example.com" name="memId" />
                    <button class="btn btn-outline-secondary" type="button" id="checkId" onclick="fn_idChk();">중복확인</button>
                    
                </div>
                <h3>
                    PASSWORD
                    <small class="text-muted">(비밀번호 입력)</small>
                </h3>
                <div class="mb-3">
                    <input type="password" class="form-control" id="floatingPassword2" placeholder="Password" name="memPw" />
                </div>
                <h3>
                    USER NAME
                    <small class="text-muted">(사용자 이름)</small>
                </h3>

                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="checkMemName" placeholder="User Name" name="memName" />
                    <button class="btn btn-outline-secondary" type="button" id="checkName" onclick="fn_nameChk();">중복확인</button>
                </div>
                
                <h3>
                    IMAGE
                    <small class="text-muted">(미입력시 기본 이미지)</small>
                </h3>
                <div>
                    <input class="form-control form-control mb-3" id="formFileLg" type="file" name="memPhoto" />
                </div>
                <div class="checkbox mb-3">
                    <button class="w-100 btn btn-lg btn-secondary" onclick="fn_register()">회원가입</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
// 체크 여부
var chkIdYesOrNo = false;
var chkNameYesOrNo = false;

// email 형식 체크 함수
function CheckEmail(str){                                                 
    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    if(!reg_email.test(str)) {                            
         return false;         
    }                            
    else {                       
         return true;         
    }                            
}
// id 중복확인 눌렀을 때 처리
function fn_idChk(){
	var obEmail = document.getElementById("checkMemId");
	if(!obEmail.value){
		alert("아이디를 입력하세요.");
		obEmail.focus();
		return;
	} else if(!CheckEmail(obEmail.value)){
		alert("아이디는 이메일 형식입니다.");
		obEmail.focus();
		return;
	} else {
		$.ajax({
			url : "/test/idChk",
			type : "post",
			dataType : "json",
			data : {"memId" : $("#checkMemId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				} else if(data == 0){
					alert("사용 가능한 아이디입니다.");
					chkIdYesOrNo = true;
					$("#checkMemId").attr("value", obEmail.value);
					$("#checkMemId").attr("readonly", true);
					$("#checkId").attr("disabled", true);
				}
			}
		});
	}
}
function fn_nameChk(){
	var nameValue = document.getElementById("checkMemName");
	if(!nameValue.value){
		alert("이름을 입력하세요.");
		nameValue.focus();
		return;
	} else {
		$.ajax({
			url : "/test/nameChk",
			type : "post",
			dataType : "json",
			data : {"memName" : $("#checkMemName").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 이름입니다.");
				} else if(data == 0){
					alert("사용 가능한 이름입니다.");
					chkNameYesOrNo = true;
					$("#checkMemName").attr("value", nameValue.value);
					$("#checkMemName").attr("readonly", true);
					$("#checkName").attr("disabled", true);
				}
			}
		});
	}
}
function fn_register(){
	
	if(chkIdYesOrNo==false || chkNameYesOrNo==false){
		event.preventDefault();
		alert("id / 이름 중복확인해주세요.");
		return false;
	} else {
		$.ajax({
			url : "/test/join",
			type : "post",
			dataType : "json",
			success : function(data){
				if(data == 1){
					alert("축하합니다! 회원가입 성공!");
				} else if(data == 0) {
					alert("회원가입에 실패했습니다. 다시 확인해주세요.");
				}
			}
		});
	}
}

</script>

</main>
<%@ include file="footer.jsp" %>
<script>

$(document).ready(function(){
	var current1 = document.getElementById("menu_login1");
	var current2 = document.getElementById("menu_login2");
	current1.classList.add('active');
	current2.classList.add('active');
	
	<c:choose>
		<c:when test="${not empty log}">  //model의 log속성이 null이 아니면
			$("#div1").text("Welcome!")	;	     
		</c:when>		
		<c:when test="${not empty logout}">  //model의 msg값이 null이 아님 (로그아웃)
			$("#div1").text("Logout 성공");
		</c:when>
		<c:when test="${not empty error}">  //model의 msg값이 null이 아님 (로그아웃)
			$("#div1").text("로그인 실패");
		</c:when>
		<c:otherwise>
			$("#div1").text("welcome");
		</c:otherwise>		
	</c:choose>
	
	});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
