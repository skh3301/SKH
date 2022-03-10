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
	 </style>
    <title>프로젝트 등록</title>
</head>
<body class="pt-5">
<%@ include file="header.jsp" %>
<main class="container mt-3">
<sec:authentication property="principal.username" var="username"/>

<div class="container" id="prj_write" style="margin:0 auto;">
  <div class="container" style="display: inline-block;text-align: center;"><p class="fw-bolder fs-1">새 프로젝트 등록</p></div>
<form action="register" method="post" enctype="multipart/form-data">
    <div id="selectGroup">
      <label for="selectGroup">프로젝트 종류</label>
        <div class="row">
          <div class="col d-grid p-1">
            <input type="radio" class="btn-check" name="bGroup" value="1" id="webprj" autocomplete="off" checked>
            <label class="btn btn-outline-success btn-block" for="webprj">웹 앱</label>
          </div>
          <div class="col d-grid p-1">
            <input type="radio" class="btn-check" name="bGroup" value="2" id="gameprj" autocomplete="off">
            <label class="btn btn-outline-danger btn-block" for="gameprj">게임</label>
          </div>
          <div class="col d-grid p-1">
            <input type="radio" class="btn-check" name="bGroup" value="3" id="musicprj" autocomplete="off">
            <label class="btn btn-outline-primary btn-block" for="musicprj">음반</label>
          </div>
        </div>
    </div>
    <div class="row mt-2">
      <label for="registerTitle" class="col-sm-3 col-form-label">제목</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" id="registerTitle" name="bTitle" />
      </div>
    </div>
    <div class="row mt-2">
      <label for="registerName" class="col-sm-3 col-form-label">작성자</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" id="registerName" value="${username}" readonly/>
        <input type="hidden" name="bName" value="${username}" readonly/>
      </div>
    </div>
    <div class="row mt-2">
      <label for="registerContent" class="col-sm-3 col-form-label">설명</label>
      <div class="col-sm-9">
        <textarea class="form-control" name="bContent" placeholder="프로젝트에 대한 자세한 설명을 남겨주세요." id="registerContent" style="height: 200px"></textarea>
      </div>
    </div>
    <div class="row mt-2">
      <label for="registerImage" class="col-sm-3 col-form-label">이미지</label>
      <div class="col-sm-9">
        <input class="form-control" id="registerImage" name="bPhoto" type="file"/>
      </div>
    </div>
    <div class="row mt-2">
      <label for="registerGithub" class="col-sm-3 col-form-label">깃허브</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" id="registerGithub" name="bGithub" placeholder="http://github.com/..."/>
      </div>
    </div>
    <div class="checkbox mt-3">
      <button class="w-100 btn btn-lg btn-secondary" type="submit">프로젝트 등록하기</button>
    </div>
</form>
</div>
</main>
<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
