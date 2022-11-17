<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="idck" value="checked"></c:set>
	<c:set var="svid" value="${cookie.ssafy_id.value}"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>구해줘 홈즈 : 로그인</title>
    <link rel="stylesheet" href="${root}/resources/css/login.css" />
  </head>
  <body>
    <header>
      <label class="header-logo" onclick="location.replace('${root}/index.jsp')">구해줘 홈즈</label>
    </header>
    <main class="container">
      <div class="login-page">
        <div class="form">
          <form method="POST" action="${root}/user/login" id="login-form" class="login-form">
            <input id="userid" name="id" type="text" placeholder="ID" value="${svid}" required autofocus />
            <input id="userpwd" name="pwd" type="password" placeholder="password" required />
            <div class="remember">
              <input type="checkbox" value="ok" id="saveid" name="saveid" ${idck} />
              <label for="saveid">로그인 상태 유지</label>
            </div>
            <button class="login-btn" id="login-btn" type="button">로그인</button>
          </form>
        </div>
        <div class="search">
          <a href="#">아이디 찾기</a>
          |
          <a href="${root}/user/help">비밀번호 찾기</a>
          |
          <a href="${root}/user/join">회원가입</a>
        </div>
      </div>
      <div class="blank">&nbsp;</div>
    </main>
    <footer>
      <ul class="footer-list">
        <li><a href="#">이용 약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">책임의 한계와 법적고지</a></li>
        <li><a href="#">회원정보 고객센터</a></li>
      </ul>
      <div class="footer-copy">
        <span class="footer-logo">구해줘 홈즈</span>
        <span>&copy; SSAFY corp. All Rights Reserved.</span>
      </div>
    </footer>
	<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <script>
	  // 로그인
	  document.querySelector("#login-btn").addEventListener("click", function () {
	    if (!document.querySelector("#userid").value) {
	      alert("아이디를 입력해 주세요.");
	      return;
	    } else if (!document.querySelector("#userpwd").value) {
	      alert("비밀번호를 입력해 주세요.");
	      return;
	    } else {
	      	document.querySelector("#login-form").submit();
	  	}
	  });
    </script>
  </body>
</html>
