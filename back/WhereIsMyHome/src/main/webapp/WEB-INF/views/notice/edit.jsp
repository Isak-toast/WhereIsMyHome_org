<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:if test="${empty article}">
	<script type="text/javascript">
		alert("글이 삭제되었거나 정상적인 URL 접근이 아닙니다.");
		location.href = "${root}/notice/list";
	</script>
</c:if>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">글수정</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">       
          <form id="form-modify">
	      	  <input type="hidden" id="no" name="articleno" value="${article.no}">
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
        	 let articleInfo = {
              no: document.querySelector("#no").value,
              title: document.querySelector("#title").value,
              content: document.querySelector("#content").value,
            };

            let config = {
              method: "PUT",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(articleInfo),
            }

            fetch(`${root}/notice`, config)
              .then(response => {
                if (response.status === 200) {
                  alert("게시글을 수정 완료했습니다.");
                  location.href = "${root}/notice/list";
                } else {
                  alert("게시글을 수정 오류입니다.");
                  location.href = "${root}/notice/list";
                }
              }).catch(err => console.log("err: ", err))
      	  location.href = "${root}/notice/list";
        }
      });
      
      document.querySelector("#btn-list").addEventListener("click", function () {
    	  if(confirm("작성중인 글은 취소됩니다.\n취소하시겠습니까?")) {
        	  location.href = "${root}/notice/list"
    	  }
      });
    </script>
</body>
</html>