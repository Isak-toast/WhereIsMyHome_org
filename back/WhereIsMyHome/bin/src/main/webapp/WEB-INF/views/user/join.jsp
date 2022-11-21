<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>구해줘 홈즈 : 회원가입</title>
      <link rel="stylesheet" href="${root}/resources/css/join.css" />
    </head>

    <body>
      <header>
        <div class="header-logo">
          <label class="header-logo" onclick="location.replace('${root}/index.jsp')">구해줘 홈즈</label>
        </div>
      </header>
      <main class="container">
        <div class="register-page">
          <div class="form">
            <form id="register-form" class="register-form" method="POST" action="">
              <input type="hidden" name="act" value="join">
              <input id="id" name="id" type="text" placeholder="아이디" />
              <input id="pwd" name="pwd" type="password" placeholder="비밀번호" />
              <input id="passcheck" name="passcheck" type="password" placeholder="비밀번호 확인" />
              <input id="email" name="email" type="email" placeholder="이메일" />
              <input id="name" name="name" type="text" placeholder="이름" />
              <input id="tel" name="tel" type="tel" placeholder="전화번호" />
              <button type="button" id="btn-join"> 회원가입 </button>
            </form>
          </div>
        </div>
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
      <script>
        document.querySelector("#btn-join").addEventListener("click", function () {
          // 검증
          if (!document.querySelector("#name").value) {
            alert("이름을 입력해주세요.");
            return;
          } else if (!document.querySelector("#id").value) {
            alert("아이디를 입력해주세요.");
            return;
          } else if (!document.querySelector("#pwd").value) {
            alert("비밀번호를 입력해주세요.");
            return;
          } else if (document.querySelector("#pwd").value != document.querySelector("#passcheck").value) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
          } else { // 검증 성공
            let userInfo = {
              id: document.querySelector("#id").value,
              pwd: document.querySelector("#pwd").value,
              name: document.querySelector("#name").value,
              email: document.querySelector("#email").value,
              tel: document.querySelector("#tel").value
            };

            let config = {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(userInfo),
            }

            fetch(`${root}/user`, config)
              .then(response => {
                if(response.status === 200){
                  location.href = "/";
                }else{
                  alert("이미 가입된 아이디입니다.");
                  location.href = "${root}/user/join";
                }
              }).catch(err => console.log("err: ", err))
          }
        });
      </script>
    </body>

    </html>