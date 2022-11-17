<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${root}/resources/css/notice.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <main>
      <div class="content">
        <div class="notice-title">
          <strong>회원 관리</strong>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
          <div class="row align-self-center mb-2">
            <div class="col-md-7 offset-3">
              <form class="d-flex" id="form-search" action="">
                <select
                  class="form-select form-select-sm ms-5 me-1 w-50"
                  name="key"
                  aria-label="검색조건"
                >
                  <option value="" selected>검색조건</option>
                  <option value="subject">아이디</option>
                  <option value="userid">이름</option>
                </select>
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" name="word" placeholder="검색어..." />
                  <button id="btn-search" class="btn btn-dark" type="button">검색</button>
                </div>
              </form>
            </div>
          </div>
        <div class="notice-list" style="margin-top: 10px">
        <table class="table table-hover notice-post">
            <thead>
              <tr class="text-center">
                <th scope="col col-lg-1 col-md-1 col-sm-1">아이디</th>
                <th scope="col col-lg-4 col-md-4 col-sm-4">이름</th>
                <th scope="col col-lg-2 col-md-2 col-sm-2">이메일</th>
                <th scope="col col-lg-1 col-md-1 col-sm-1">전화번호</th>
                <th scope="col col-lg-2 col-md-2 col-sm-2">권한</th>
              </tr>
            </thead>
            <tbody>
			<c:forEach items="${users}" var="user">
              <tr class="text-center">
				<td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.tel}</td>
                <td>${user.role}</td>
              </tr>
			</c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
    
    <script>
    	
    
    </script>
  </body>
</html>
