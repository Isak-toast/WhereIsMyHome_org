<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<nav class="nav-topic">
  <div class="container">
    <ul>
      <li><a href="${root}/">홈</a></li>
      <li><a href="${root}/deal/aptList">실거래가</a></li>
      <li><a href="${root}/notice/list">공지사항</a></li>
      <li><a href="${root}/board/list">자유게시판</a></li>
      <li><a href="${root}/interest/area">나의관심</a></li>
      <c:if test="${loginUser.role eq 'admin'}">
      		<li><a href="${root}/user/list">회원 관리</a></li>
	  </c:if>
    </ul>
  </div>
</nav>