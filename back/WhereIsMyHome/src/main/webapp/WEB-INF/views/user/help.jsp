<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>
	
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>구해줘 홈즈 : 비밀번호 찾기</title>
    <link rel="stylesheet" href="${root}/resources/css/find.css" />
  </head>
  <body>
    <header>
      <label class="header-logo" onclick="location.replace('${root}/index.jsp')">구해줘 홈즈</label>
    </header>
    <main class="container">
      <div class="login-page">
        <div class="form">
          <form name="login-form" method="post" class="login-form" action="${root}/user/findPwd">
            <div class="id">
                <input id="id" name="id" type="text" placeholder ="아이디" required autofocus />
              </div>
            <!-- <div>
              <input id="email" name="email" type="text" placeholder ="이메일" required />
              <input id="access" type="submit" value="인증번호 받기" />
              <input id="emailCheck" type="text" placeholder="인증번호 6자리 숫자 입력" />
            </div> -->

            <!-- <button class="next-btn" onclick="next()" type="button">다음</button> -->
            <input type="submit" value="다음" />
          </form>
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
  </body>
</html>
