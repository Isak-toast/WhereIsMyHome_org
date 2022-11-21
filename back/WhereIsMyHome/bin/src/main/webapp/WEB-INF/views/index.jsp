<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>
<link rel="stylesheet" href="${root}/resources/css/main.css">

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <main>
        <nav class="nav-type container">
            <div class="row">
                <div class="col-md-3">
                    <div class="div-type">
                        <div class="img-box">
                            <img src="${root}/resources/img/apartment-1.jpg" alt="img">
                        </div>
                        <div>
                            <div>
                                <h2>아파트/다세대</h2>
                                <span>전 · 월세</span>
                            </div>
                            <button id="btn-apt-month">
                                정보조회
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="div-type col-md-3">
                        <div class="img-box">
                            <img src="${root}/resources/img/house-1.jpg" alt="img">
                        </div>
                        <div>
                            <div>
                                <h2>주택</h2>
                                <span>전 · 월세</span>
                            </div>
                            <button id="btn-house-month">
                                정보조회
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="div-type col-md-3">
                        <div class="img-box">
                            <img src="${root}/resources/img/apartment-2.jpg" alt="img">
                        </div>
                        <div>
                            <div>
                                <h2>아파트/다세대</h2>
                                <span>매매</span>
                            </div>
                            <button id="btn-apt-deal">
                                정보조회
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="div-type col-md-3">
                        <div class="img-box">
                            <img src="${root}/resources/img/house-2.jpg" alt="img">
                        </div>
                        <div>
                            <div>
                                <h2>주택</h2>
                                <span>매매</span>
                            </div>
                            <button id="btn-house-deal">
                                정보조회
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

    <section class="container padding-none">
        <form class="address-form">
            <h2>지역을 선택해 주세요</h2>
            <div>
                <select class="form-control" name="sido" id="sido">
                    <option value="all">도/광역시</option>
                </select>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
            </div>
            
            <div>
                <select class="form-control" name="gugun" id="gugun">
                    <option value="all">시/구/군</option>
                </select>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
            </div>
        </form>

        <div class="data-container">
            <div class="apartment" id="data-list-apartment">
                <h2>아파트 거래정보</h2>
                <a id="a-more-apt" href="#">전체보기</a>
            </div>
            <div class="house" id="data-list-house">
                <h2>주택 거래정보</h2>
                <a id="a-more-house" href="#">전체보기</a>
            </div>
        </div>
    </section>
</main>

<footer>
    <div class="container">
        <h2>Made by</h2>
        <p>대전 8기 김이삭, 이진섭</p>
        <a href="https://lab.ssafy.com/ygo65312/front_whereismyhome">
            github 
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-git" viewBox="0 0 16 16">
                <path d="M15.698 7.287 8.712.302a1.03 1.03 0 0 0-1.457 0l-1.45 1.45 1.84 1.84a1.223 1.223 0 0 1 1.55 1.56l1.773 1.774a1.224 1.224 0 0 1 1.267 2.025 1.226 1.226 0 0 1-2.002-1.334L8.58 5.963v4.353a1.226 1.226 0 1 1-1.008-.036V5.887a1.226 1.226 0 0 1-.666-1.608L5.093 2.465l-4.79 4.79a1.03 1.03 0 0 0 0 1.457l6.986 6.986a1.03 1.03 0 0 0 1.457 0l6.953-6.953a1.031 1.031 0 0 0 0-1.457"/>
            </svg>
        </a>
    </div>
</footer>
<script type="text/javascript" src="${root}/resources/js/utils/apiKeys.js"></script>
<script type="text/javascript" src="${root}/resources/js/utils/const.js"></script>
<script type="text/javascript" src="${root}/resources/js/utils/search.js"></script>
<script type="text/javascript" src="${root}/resources/js/utils/getAptDeal.js"></script>
<script type="text/javascript" src="${root}/resources/js/utils/getHouseDeal.js"></script>
<script type="text/javascript" src="${root}/resources/js/index.js"></script>
</body>
</html>