<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${root}/resources/css/interestItem.css" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<section class="map-section">
	<div id="map"></div>
	<ul class="data-list">
		<div class="data-menu">
			<button onclick='location.href="${root}/interest/area"'>관심매물</button>
			<button>관심매물</button>
		</div>
		<div class="data-sort">
			<a href="#">등록일순</a> | <a href="#">최신순</a> | <a href="#">가격순</a> | <a
				href="#">면적순</a>
		</div>
		<li class="data-item">
			<div class="img-box">
				<img src="${root}/resources/data/house-2.jpg" alt="apartment" />
			</div>
			<div>
				<p>반포자이</p>
				<p>서초구 반포동 ・ 59.97㎡</p>
				<p>315,000만원</p>
				<p>2018.02.17</p>
			</div>
		</li>
		<li class="data-item">
			<div class="img-box">
				<img src="${root}/resources/data/house-1.jpg" alt="apartment" />
			</div>
			<div>
				<p>반포자이</p>
				<p>서초구 반포동 ・ 59.97㎡</p>
				<p>315,000만원</p>
				<p>2018.02.17</p>
			</div>
		</li>
	</ul>
</section>
<script type="text/javascript"
	src="${root}/resources/js/utils/apiKeys.js"></script>
<script type="text/javascript" src="${root}/resources/js/utils/map.js"></script>
</body>
</html>
