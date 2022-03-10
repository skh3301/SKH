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
    <!-- Bootstrap CSS , SVG 아이콘 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
	 body{
	  font-family: "Helvetica Nene", Helvetica, Arial, 맑은 고딕;,"malgun gothic", sans-serif;
	 }
 	 .card-img-top {
	 	height: 9rem;
	 	object-fit: cover;
	 }
	 </style>
    <title>웹 어플리케이션</title>
</head>
<body class="pt-5">
<%@ include file="header.jsp" %>
<main class="mt-3">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    	<div class="modal-content">
        	<div class="modal-header">
          		<h5 class="modal-title" id="spTitle">게시물 제목</h5>
          		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        	</div>
        	<div class="modal-body">
          		<div class="container">
              		<img id="spPhoto" class="img-thumbnail"/>
              		<div class="d-flex justify-content-between pt-2">
                		<div>
                			<sec:authorize access="isAnonymous()">
	                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
	                        		<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
	                    		</svg><span id="spHeart"></span>
                    		</sec:authorize>
                    		<sec:authorize access="isAuthenticated()">
	              				<sec:authentication property="principal.username" var="username"/>
	              				<form action="heart_up" method="post" name="heart_up" id="heart_up">
									<input type="hidden" id="spBID2" name="bId" value="" />
									<input type="hidden" name="memName" value="${username}" />
								</form>
								<a href="#" id="upHeart" class="text-decoration-none">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
  										<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg><span id="spHeart"></span>
								</a>
              				</sec:authorize>
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-text" viewBox="0 0 16 16">
                        		<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                        		<path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
                    		</svg><span  id="spReply"></span>
                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                        		<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                        		<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                    		</svg><span id="spHit"></span>
                		</div>
                		<div>
                  			<span class="badge rounded-pill bg-info text-dark">만든사람</span>
                  			<span class="badge bg-dark" id="spName"></span>
                		</div>
              		</div>
              		<div class="pt-2">
                		<span class="badge rounded-pill bg-info text-dark">상세설명</span>
              		</div>
              		<div class="pt-2" id="spContent">
              		</div>
              		<div class="pt-2 d-flex justify-content-between">
              			<div><span class="badge rounded-pill bg-info text-dark">깃허브주소</span></div>
                		<div><a href="" id="spGithub"></a></div>
              		</div>
              		<div class="pt-2">
                		<span class="badge rounded-pill bg-info text-dark">댓글</span>
              		</div>
              		<div class="pt-2">
                		<ul id="replyList" class="list-group list-group-flush"></ul>
              		</div>
              		<div class="pt-2">
                		<span class="badge rounded-pill bg-info text-dark">댓글남기기</span>
              		</div>
              		<div class="pt-2">
              			<sec:authorize access="isAnonymous()">
              				<div class="d-flex justify-content-center"><div>로그인 한 회원만 댓글 작성이 가능합니다.</div></div>
              				<div class="d-flex justify-content-center">
              					<div>
	              					<ul class="nav nav-pills flex-column mb-auto">
					                    <li class="nav-item">
					                      <a href="login_join" class="nav-link text-black">
											<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 18 18">
											  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
											  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
											</svg>
					                        로그인/회원가입
					                      </a>
					                    </li>
				                    </ul>
              					</div>
           					</div>
              			</sec:authorize>
              			<sec:authorize access="isAuthenticated()">
              				<sec:authentication property="principal.username" var="username"/>
              				<form action="reply_write" method="post" name="reply_write">
              				<div class="input-group input-group-sm mb-3" id="username">
								<span class="input-group-text" id="inputGroup-sizing-sm">
				    				<strong>${username}</strong>
								</span>
								<input type="hidden" id="spBID" name="bId" value="" />
								<input type="hidden" name="memName" value="${username}" />
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="rContent">
								<button class="btn btn-outline-secondary" type="submit" id="button-addon2">등록</button>
							</div>
							</form>
              			</sec:authorize>
              		</div>
          		</div>
        	</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        	</div>
      	</div>
   	</div>
</div>
<div class="container">
	<div class="row mb-2">
        <div class="col-12">
        	<form name="orderList" method="get" action="orderList">
        	<input type="hidden" name="group" value="1" />
            <select class="form-select" name="orderBy"  onchange="this.form.submit()">
                <option>정렬 기준 선택</option>
                <option value="bId">최근 게시물 순</option>
                <option value="bHit">조회 높은 순</option>
                <option value="bHeart">추천 많은 순</option>
            </select>
            </form>
		</div>
	</div>
	<div class="row">
		<c:forEach items="${projectList}" var="dto">
        <div class="col-xl-3 col-lg-4 col-md-6 mb-3">
            <div class="card" >
                <img src="repository/project/${dto.bPhoto}" class="card-img-top" alt="${dto.bTitle}">
                <div class="card-body">
                    <h5 class="card-title">[Web]${dto.bTitle}</h5><a href="select_one?bId=${dto.bId}" class="stretched-link select_one" data-bs-toggle="modal" data-bs-target="#exampleModal"></a>
                    <p class="card-text" style="display:block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${dto.bContent}</p>
                    <div class="d-flex justify-content-between">
                        <div>
                            <span class="badge bg-dark">${dto.bName}</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                                <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
                            </svg>${dto.bHeart}
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-text" viewBox="0 0 16 16">
                                <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                                <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
                            </svg>${dto.bReply}
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                            </svg>${dto.bHit}
                        </div>
                    </div>
                </div>
            </div>
        </div>		
		</c:forEach>
	</div>
</div>
<!--
<c:forEach items="${projectList}" var="dto">
	<h5>${dto.bTitle}</h5>
</c:forEach>
<div id="div1"></div>
-->
</main>
<%@ include file="footer.jsp" %>
<script>
/*
	var current1 = document.getElementById("menu_webprj1");
	var current2 = document.getElementById("menu_webprj2");
	current1.classList.add('active');
	current2.classList.add('active');
*/
	$(document).ready(function(){
		var current1 = document.getElementById("menu_webprj1");
		var current2 = document.getElementById("menu_webprj2");
		current1.classList.add('active');
		current2.classList.add('active');

		// ajax 통신으로 선택 게시물 정보 가져오기
		$(".select_one").click(function(event){
			event.preventDefault();
			var eo = event.target;
			var x = eo.getAttribute("href");
			$.ajax({
				url : x,
				type : "get",
				dayaType: "json",
				success : function(result) {
					$("#spTitle").text("[Web]"+result.project.bTitle);
					var imgsrc = "repository/project/" + result.project.bPhoto;
					$("#spPhoto").attr("src", imgsrc);
					$("#spHeart").text(result.count.bHeart);
					$("#spReply").text(result.count.bReply);
					$("#spHit").text(result.count.bHit);
					$("#spName").text(result.project.bName);
					$("#spContent").text(result.project.bContent);
					var githubsrc = result.project.bGithub;
					$("#spGithub").attr("href", githubsrc);
					$("#spGithub").text(githubsrc);
					var spBid = result.project.bId;
					$("#spBID").attr("value", spBid);
					$("#spBID2").attr("value", spBid);
					if(result.count.bReply==0){
						$(".rpCont").detach();
						$("#replyList").append("<li class='rpCont list-group-item'>댓글이 없습니다. 가장 먼저 댓글을 남겨보세요~!</li>");

					} else {
						$(".rpCont").detach();							// +rp.rName+" "+rp.rContent+
						$.each(result["reply"], function(i, rp){
							$("#replyList").append("<li class='rpCont list-group-item align-items-center d-flex flex-row-reverse justify-content-between'><div class='flex-shrink-0' style='width:85px;'>"+ rp.rDate + "</div><div><span class='badge bg-secondary'>" + rp.rName + "</span><div class='mt-2'>" + rp.rContent + "</div></div></li>");
						});
					}

				},
				error : function(){
					alert("select_one 눌렀을 때 에러 발생");
				}
			});
		});
		// ajax 통신으로 댓글 등록했을 때 객체 가져오기(업데이트)
		$("#button-addon2").click(function(event){
			event.preventDefault();
			var queryString = $("form[name=reply_write]").serialize();
			$.ajax({
				cache:false,
				url : "/test/reply_write",
				type: "POST",
				data : queryString,
				dataType : "JSON",
				success : function(result){
					$("#spReply").text(result.count.bReply);
					var lastIndex = result.count.bReply-1;
					if(lastIndex==0){
						$(".rpCont").detach();
					}
					$("#replyList").append("<li class='rpCont list-group-item align-items-center d-flex flex-row-reverse justify-content-between'><div class='flex-shrink-0' style='width:85px;'>"+ result.reply[lastIndex].rDate + "</div><div><span class='badge bg-secondary'>" + result.reply[lastIndex].rName + "</span><div class='mt-2'>" + result.reply[lastIndex].rContent + "</div></div></li>");
				},
				error : function() {
					alert("댓글 등록 눌렀을 때 에러 발생");
				}
			});
		});
		
		// 하트.. 버튼 누르고 중복확인해서 처리해주기
		$("#upHeart").click(function(event){
			event.preventDefault();
			var queryString2 = $("form[name=heart_up]").serialize();
			$.ajax({
				cache : false,
				url : "/test/heart_up",
				type : "POST",
				data : queryString2,
				dataType : "JSON",
				success : function(result){
					console.log(result);
					if(result.checkHeart==true){
						alert("이 게시물에 좋아요를 눌렀습니다!");
						$("#spHeart").text(result.count.bHeart);
						console.log(result);
					} else {
						alert("한 게시물에 한 번만 누를 수 있습니다!");
						console.log(result);
					}
				},
				error : function(){
					alert("하트 눌렀을 때 에러 발생");
				}
			});
		});
	});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
