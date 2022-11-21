<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${root}/resources/css/notice.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <main>
      <div class="content">
        <div class="notice-title">
          <strong>공지 사항</strong>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
          <div class="row align-self-center mb-2">
            <div class="col-md-2 text-start">
            	<c:if test="${loginUser.role eq 'admin'}">
              		<button type="button" id="btn-mv-register" class="btn btn-outline-primary btn-sm">글쓰기</button>
   				</c:if>
            </div>
            <div class="col-md-7 offset-3">
              <form class="d-flex" id="form-search" action="">
                <select
                  class="form-select form-select-sm ms-5 me-1 w-50"
                  name="key"
                  aria-label="검색조건"
                >
                  <option value="" selected>검색조건</option>
                  <option value="subject">제목</option>
                  <option value="userid">작성자</option>
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
                <th scope="col col-lg-1 col-md-1 col-sm-1">글번호</th>
                <th scope="col col-lg-4 col-md-4 col-sm-4">제목</th>
                <th scope="col col-lg-2 col-md-2 col-sm-2">글쓴이</th>
                <th scope="col col-lg-1 col-md-1 col-sm-1">조회수</th>
                <th scope="col col-lg-2 col-md-2 col-sm-2">작성일</th>
              </tr>
            </thead>
            <tbody>
			<c:forEach items="${articles}" var="article">
              <tr class="text-center">
                <th scope="row">${article.no}</th>
                <td class="text-start">
 <%--                  <a
                    href="${root}/notice?no=${article.no}"
                    class="article-title link-dark"
                    style="text-decoration: none"
                  >
                    	${article.title}
                  </a> --%>
                  <a href="${root}/notice/detail?no=${article.no}">${article.title}</a>
                </td>
                <td>${article.author}</td>
                <td>${article.views}</td>
                <td>${article.registerTime}</td>
              </tr>
			</c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </body>
</html>
