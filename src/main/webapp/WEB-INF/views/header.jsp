<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix ="sec" uri = "http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">OPPA!</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a id="menu_home1" class="nav-link" href="home">홈</a>
                    </li>
                    <li class="nav-item">
                        <a id="menu_webprj1" class="nav-link" aria-current="page" href="webprj">웹 어플리케이션</a>
                    </li>
                    <li class="nav-item">
                        <a id="menu_game1" class="nav-link" href="game">게임</a>
                    </li>
                    <li class="nav-item">
                        <a id="menu_music1" class="nav-link" href="music">음반</a>
                    </li>
                    <!-- 인증되지 않은 사용자인 경우 -->
                    <sec:authorize access="isAnonymous()">
                    	<li class="nav-item">
                    		<a id="menu_login1" class="nav-link" href="login_join">로그인/회원가입</a>
                    	</li>
                    </sec:authorize>
                </ul>
                <!-- 로그인한 사용자인 경우 -->
                <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.memPhoto" var="mem_photo"/>
                <div class="dropdown" id="mem_photo">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="repository/mem/${mem_photo}" alt="사용자 이미지" width="32" height="32" class="rounded-circle me-2">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="prj_write">새 프로젝트 등록</a></li>
                        <li><a class="dropdown-item" href="#">내 정보</a></li>
                        <li><a class="dropdown-item" href="#">회원 찾기</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
                        
                    </ul>
                    <form id="logout-form" action='<c:url value='/logout'/>' method="POST">
   						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					</form>
                </div>
                </sec:authorize>
                <form action="search" method="get" class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="프로젝트 찾기" aria-label="Search" name="title" />
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="offcanvas offcanvas-end bg-dark" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">   
        <div class="d-flex flex-column flex-shrink-0 p-2 text-white bg-dark">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">OPPA!</h5>
                <button type="button" class="btn-close text-reset bg-light" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                      <a id="menu_home2" href="home" class="nav-link text-white" aria-current="page">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 18 18">
						  <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
						  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
						</svg>
                        홈
                      </a>
                    </li>
                    <li class="nav-item">
                      <a id="menu_webprj2" href="webprj" class="nav-link text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-layout-text-window-reverse" viewBox="0 0 18 18">
						  <path d="M13 6.5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm0 3a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm-.5 2.5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5z"/>
						  <path d="M14 0a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12zM2 1a1 1 0 0 0-1 1v1h14V2a1 1 0 0 0-1-1H2zM1 4v10a1 1 0 0 0 1 1h2V4H1zm4 0v11h9a1 1 0 0 0 1-1V4H5z"/>
						</svg>
                        웹 어플리케이션
                      </a>
                    </li>
                    <li class="nav-item">
                      <a id="menu_game2" href="game" class="nav-link text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-controller" viewBox="0 0 18 18">
						  <path d="M11.5 6.027a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2.5-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm-6.5-3h1v1h1v1h-1v1h-1v-1h-1v-1h1v-1z"/>
						  <path d="M3.051 3.26a.5.5 0 0 1 .354-.613l1.932-.518a.5.5 0 0 1 .62.39c.655-.079 1.35-.117 2.043-.117.72 0 1.443.041 2.12.126a.5.5 0 0 1 .622-.399l1.932.518a.5.5 0 0 1 .306.729c.14.09.266.19.373.297.408.408.78 1.05 1.095 1.772.32.733.599 1.591.805 2.466.206.875.34 1.78.364 2.606.024.816-.059 1.602-.328 2.21a1.42 1.42 0 0 1-1.445.83c-.636-.067-1.115-.394-1.513-.773-.245-.232-.496-.526-.739-.808-.126-.148-.25-.292-.368-.423-.728-.804-1.597-1.527-3.224-1.527-1.627 0-2.496.723-3.224 1.527-.119.131-.242.275-.368.423-.243.282-.494.575-.739.808-.398.38-.877.706-1.513.773a1.42 1.42 0 0 1-1.445-.83c-.27-.608-.352-1.395-.329-2.21.024-.826.16-1.73.365-2.606.206-.875.486-1.733.805-2.466.315-.722.687-1.364 1.094-1.772a2.34 2.34 0 0 1 .433-.335.504.504 0 0 1-.028-.079zm2.036.412c-.877.185-1.469.443-1.733.708-.276.276-.587.783-.885 1.465a13.748 13.748 0 0 0-.748 2.295 12.351 12.351 0 0 0-.339 2.406c-.022.755.062 1.368.243 1.776a.42.42 0 0 0 .426.24c.327-.034.61-.199.929-.502.212-.202.4-.423.615-.674.133-.156.276-.323.44-.504C4.861 9.969 5.978 9.027 8 9.027s3.139.942 3.965 1.855c.164.181.307.348.44.504.214.251.403.472.615.674.318.303.601.468.929.503a.42.42 0 0 0 .426-.241c.18-.408.265-1.02.243-1.776a12.354 12.354 0 0 0-.339-2.406 13.753 13.753 0 0 0-.748-2.295c-.298-.682-.61-1.19-.885-1.465-.264-.265-.856-.523-1.733-.708-.85-.179-1.877-.27-2.913-.27-1.036 0-2.063.091-2.913.27z"/>
						</svg>
                        게임
                      </a>
                    </li>
                    <li class="nav-item">
                      <a id="menu_music2" href="music" class="nav-link text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 18 18">
						  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
						  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
						  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
						  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
						</svg>
                        음반
                      </a>
                    </li>
                  </ul>
                  <form action="search" method="get" class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="프로젝트 찾기" aria-label="Search" name="title" />
                    <button class="btn btn-outline-success" type="submit">Search</button>
                  </form>
                  <hr>
                  <!-- 인증되지 않은 사용자인 경우 -->
                  <sec:authorize access="isAnonymous()">
                  <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                      <a id="menu_login2" href="login_join" class="nav-link text-white">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 18 18">
						  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
						  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
						</svg>
                        로그인/회원가입
                      </a>
                    </li>
                  </ul>
                  </sec:authorize>
				  <!-- 로그인한 사용자인 경우 -->
				  <sec:authorize access="isAuthenticated()">
				  <sec:authentication property="principal.memPhoto" var="mem_photo"/>
				  <div class="dropdown" id="mem_photo">

				    <a href="#" class="d-flex align-items-center text-white text-decoration-none" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				        <img src="repository/mem/${mem_photo}" alt="사용자 이미지" width="32" height="32" class="rounded-circle me-2">
				    	<strong><sec:authentication property="principal.username"/></strong>님, 로그인 중입니다.
				    </a>
				    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
				        <li><a class="dropdown-item" href="prj_write">새 프로젝트 등록</a></li>
				        <li><a class="dropdown-item" href="#">내 정보</a></li>
				        <li><a class="dropdown-item" href="#">회원 찾기</a></li>
				        <li><hr class="dropdown-divider"></li>
				        <li><a class="dropdown-item" href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
				        
				    </ul>
				    <form id="logout-form" action='<c:url value='/logout'/>' method="POST">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					</form>
				  </div>
				  </sec:authorize>
            </div>
        </div>
    </div>
</header>
</body>
</html>
