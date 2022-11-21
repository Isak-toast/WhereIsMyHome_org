<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구해줘 홈즈</title>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/common.css">
</head>
<body>
    <header>
        <div class="header-mini">
            <div class="container">
                <div class="header-mini-logo">
                    <img src="${root}/resources/img/logo.png" alt="ssafy logo" height="30px">
                </div>
                <div class="header-mini-nav">
                    <c:if test="${!empty loginUser}">
     					<div>
							<strong>${loginUser.name}</strong> (${loginUser.id})님 안녕하세요. 
							<a href= "${root}/user/logout">로그아웃</a>
							<a href= "${root}/user/detail">마이페이지</a>
						</div>
    				</c:if>
    				<c:if test="${empty loginUser}">
                    	<a href="${root}/user/login">로그인</a>
                    	<a href="${root}/user/join">회원가입</a>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="header-main">
            <div class="container">
                <h1>구해줘 홈즈</h1>
            </div>       
        </div>
    </header>