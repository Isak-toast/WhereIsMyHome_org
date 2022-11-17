<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
   <c:if test="${!empty userinfo}">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 bg-white text-center">
            <mark class="sky">글쓰기</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <form id="form-register" method="POST" action="">
			<input type="hidden" name="act" value="write">
            <div class="mb-3">
              <label for="title" class="form-label">제목 : </label>
              <input
                type="text"
                class="form-control"
                id="title"
                name="title"
                placeholder="제목..."
              />
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">내용 : </label>
              <textarea class="form-control" id="content" name="content" rows="7"></textarea>
            </div>
            <div class="col-auto text-center">
              <button type="button" id="btn-register" class="btn btn-outline-primary mb-3">
                글작성
              </button>
              <button type="button" id="btn-list" class="btn btn-outline-danger mb-3">
                목록으로이동...
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    </c:if>
	<c:if test="${empty userinfo}">
	 <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 bg-white text-center">
            로그인을 먼저 진행하시길 바랍니다.
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <form id="form-register" method="POST" action="">
        	<input type="hidden" name="act" value="write">  
            <div class="col-auto text-center">
              <button type="button" id="btn-list" class="btn btn-outline-danger mb-3">
                목록으로이동...
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    </c:if>
    <script>
      document.querySelector("#btn-register").addEventListener("click", function () {
        if (!document.querySelector("#title").value) {
          alert("제목 입력하세요");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력하세요");
          return;
        } else {
          let form = document.querySelector("#form-register");
          form.setAttribute("action", "${root}/notice");
          form.submit();
        }
      });
      
      document.querySelector("#btn-list").addEventListener("click", function () {
    	  if(confirm("공지사항 목록으로 이동합니다. 취소를 하시면 작성중인 글은 삭제됩니다.\n이동하시겠습니까?")) {
        	  location.href = "${root}/notice?act=notice"
    	  }
      });
    </script>
</body>
</html>
