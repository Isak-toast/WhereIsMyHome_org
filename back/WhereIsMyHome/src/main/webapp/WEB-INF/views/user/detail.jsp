<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>구해줘 홈즈 : 회원 정보</title>
      <link rel="stylesheet" href="${root}/resources/css/user.css" />
    </head>

    <body>
      <header>
        <div class="header-item">
          <label class="header-logo" onclick="location.replace('${root}/index.jsp')">구해줘 홈즈</label>
          <div class="header-menu">회원 정보</div>
        </div>
      </header>
      <main class="container">
        <div class="user-page">
          <div class="form">
            <form method="POST" action="" id="user-form" class="user-form">
              <input type="hidden" id="act" name="act" value="">
              <input id="id" name="id" type="text" placeholder="아이디" value="${loginUser.id}" readonly />
              <input id="pwd" name="pwd" type="password" placeholder="변경할 비밀번호" />
              <input id="passcheck" name="passcheck" type="password" placeholder="변경할 비밀번호 확인" />
              <input id="email" name="email" type="email" placeholder="이메일" value="${loginUser.email}" />
              <input id="name" name="name" type="text" placeholder="이름" value="${loginUser.name}" readonly />
              <input id="tel" name="tel" type="tel" placeholder="전화번호" value="${loginUser.tel}" />
              <button id="btn-modify" type="button">정보 수정</button>
              <button id="btn-delete" type="button">회원 탈퇴</button>
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
        // 회원 정보 수정
        document.querySelector("#btn-modify").addEventListener("click", function () {
          if (!document.querySelector("#pwd").value) {
            alert("비밀번호를 입력해주세요.");
            return;
          } else if (!document.querySelector("#email").value) {
            alert("이메일을 입력해주세요.");
          } else if (!document.querySelector("#tel").value) {
            alert("전화번호를 입력해주세요.");
          } else if (document.querySelector("#pwd").value != document.querySelector("#passcheck").value) {
            alert("비밀번호가 일치하지 않습니다.");
          } else {
            let userInfo = {
              id: document.querySelector("#id").value,
              pwd: document.querySelector("#pwd").value,
              email: document.querySelector("#email").value,
              tel: document.querySelector("#tel").value
            };

            let config = {
              method: "PUT",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(userInfo),
            }

            fetch(`${root}/user`, config)
              .then(response => {
                if (response.status === 200) {
                  location.href = "/";
                } else {
                  location.href = "${root}/user/detail";
                }
              }).catch(err => console.log("err: ", err))
          }
        });

        // 회원 정보 삭제
        document.querySelector("#btn-delete").addEventListener("click", function () {
          let id = document.querySelector("#id").value

          if (confirm("정말 삭제하시겠습니까?")) {
            let config = {
              method: "DELETE",
              headers: { "Content-Type": "application/json" },
              // body: JSON.stringify(userInfo),
            }

            fetch(`${root}/user/\${id}`, config)
              .then(response => {
                if (response.status === 200) {
                  location.href = "/";
                } else {
                  alert("회원 탈퇴 실패.");
                  location.href = "${root}/user/detail";
                }
              }).catch(err => console.log("err: ", err))
          };
        });
      </script>
    </body>

    </html>