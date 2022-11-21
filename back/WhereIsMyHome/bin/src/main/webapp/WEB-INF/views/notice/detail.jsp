<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    <c:if test="${empty article}">
      <script type="text/javascript">
        alert("글이 삭제되었거나 정상적인 URL 접근이 아닙니다.");
        location.href = "${root}/notice?act=notice";
      </script>
    </c:if>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/nav.jsp" %>
        <div class="row justify-content-center">
          <div class="col-lg-8 col-md-10 col-sm-12">
          </div>
          <div class="col-lg-8 col-md-10 col-sm-12">
            <div class="row my-2">
              <h4 class="text-secondary">${article.no}. ${article.title}</h4>
            </div>
            <div class="row">
              <div class="col-md-8">
                <div class="clearfix align-content-center">
                  <img class="avatar me-2 float-md-start bg-light p-2"
                    src="https://raw.githubusercontent.com/twbs/icons/main/icons/person-fill.svg" />
                  <p>
                    <span class="fw-bold">${article.author}</span> <br />
                    <span class="text-secondary fw-light"> ${article.registerTime} 조회 : ${article.views}</span>
                  </p>
                </div>
              </div>
              <div class="col-md-4 align-self-center text-end">댓글이 존재하지 않습니다.</div>
              <div class="divider mb-3"></div>
              <div class="text-secondary">
                ${article.content}
              </div>
              <div class="divider mt-3 mb-3"></div>
              <div class="d-flex justify-content-end">
                <button type="button" id="btn-list" class="btn btn-outline-primary mb-3">
                  글목록
                </button>
                <c:if test="${loginUser.role eq 'admin'}">
                  <button type="button" id="btn-mv-modify" class="btn btn-outline-success mb-3 ms-1">
                    글수정
                  </button>
                  <button type="button" id="btn-delete" class="btn btn-outline-danger mb-3 ms-1">
                    글삭제
                  </button>
                </c:if>
              </div>
            </div>
          </div>
        </div>
        <form id="form-param" method="get" action="">
          <input type="hidden" id="act" name="act" value="">
          <input type="hidden" id="pgno" name="pgno" value="${param.pgno}">
          <input type="hidden" id="key" name="key" value="${param.key}">
          <input type="hidden" id="word" name="word" value="${param.word}">
        </form>
        <form id="form-no-param" method="get" action="${root}/notice">
          <input type="hidden" id="nact" name="act" value="">
          <input type="hidden" id="pgno" name="pgno" value="${param.pgno}">
          <input type="hidden" id="key" name="key" value="${param.key}">
          <input type="hidden" id="word" name="word" value="${param.word}">
          <input type="hidden" id="articleno" name="articleno" value="${article.no}">
        </form>
        <script>
          document.querySelector("#btn-list").addEventListener("click", function () {
            location.href = "${root}/notice/list";
          });

          document.querySelector("#btn-mv-modify").addEventListener("click", function () {
        	  location.href = "${root}/notice/edit?no=${article.no}";
          });

          document.querySelector("#btn-delete").addEventListener("click", function () {
            if (confirm("정말 삭제하시겠습니까?")) {

              let func = function deleteArticle() {
                let config = {
                  method: "DELETE",
                  headers: { "Content-Type": "application/json" },
                }

                fetch(`${root}/notice/${article.no}`, config)
                  .then(response => {
                    if (response.status === 200) {
                      alert("게시글을 삭제 완료했습니다.");
                      location.href = "${root}/notice/list";
                    } else {
                      alert("게시글을 삭제할 수 없습니다.");
                      location.href = "${root}/notice/list";
                    }
                  }).catch(err => console.log("err: ", err))
              }
              func();
            }

          });
        </script>
        </body>

        </html>