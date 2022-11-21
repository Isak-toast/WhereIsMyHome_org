<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:if test="${empty article}">
	<script type="text/javascript">
		alert("글이 삭제되었거나 정상적인 URL 접근이 아닙니다.");
		location.href = "${root}/notice?act=notice";
	</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>구해줘 홈즈</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${root}/resources/css/common.css" />
    <link rel="stylesheet" href="${root}/resources/css/notice.css" />
  </head>
  <body>
    <header>
      <div class="header-mini">
        <div class="container">
          <div class="header-mini-logo">
            <img src="${root}/resources/data/logo.png" alt="ssafy logo" height="30px" />
          </div>
          <div class="header-mini-nav">
          	<c:if test="${!empty userinfo}">
				<div>
					<strong>${userinfo.name}</strong> (${userinfo.id})님 안녕하세요.
					<a href= "${root}/user?act=logout">로그아웃</a>
					<a href= "${root}/user/usercheck.jsp">마이페이지</a>
				</div>
			</c:if>
			<c:if test="${empty userinfo}">
              	<a href="${root}/user?act=mvlogin">로그인</a>
              	<a href="${root}/user?act=mvjoin">회원가입</a>
            </c:if>
          </div>
        </div>
      </div>
    </header>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">글수정</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">       
          <form id="form-modify" method="POST" action="">
	          <input type="hidden" id="act" name="act" value="modify">
	      	  <input type="hidden" id="articleno" name="articleno" value="${article.no}">
            <div class="mb-3">
              <label for="title" class="form-label">제목 : </label>
              <input type="text" class="form-control" id="title" name="title" value="${article.title}" />
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">내용 : </label>
              <textarea class="form-control" id="content" name="content" rows="7">${article.content}</textarea>
            </div>
            <div class="col-auto text-center">
              <button type="button" id="btn-modify" class="btn btn-outline-primary mb-3">
                글수정
              </button>
              <button type="button" id="btn-list" class="btn btn-outline-danger mb-3">
                목록으로이동...
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script>
      document.querySelector("#btn-modify").addEventListener("click", function () {
        if (!document.querySelector("#title").value) {
          alert("제목 입력!!");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-modify");
          form.setAttribute("action", "${root}/notice");
          form.submit();
        }
      });
      
      document.querySelector("#btn-list").addEventListener("click", function () {
      	if(confirm("취소를 하시면 작성중인 글은 삭제됩니다.\n취소하시겠습니까?")) {
    		  let form = document.querySelector("#form-param");
        	  location.href = "${root}/notice?act=notice"

         	  form.setAttribute("action", "${root}/notice");
            form.submit();
     	    }
        });
      
      document.querySelector("#btn-list").addEventListener("click", function () {
    	  if(confirm("취소를 하시면 작성중인 글은 삭제됩니다.\n취소하시겠습니까?")) {
        	  location.href = "${root}/notice?act=notice"
    	  }
      });
    </script>
</body>
</html>