<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>


		<nav id="index_nav_login">
			<ul class="m-0 p-0">
				<c:choose>
					<c:when test="${empty user}">
						<div id="member">
							<a href="<c:url value="/signupform.do"/>">회원가입</a> &ensp;
							<a href="<c:url value="/login"/>">로그인</a>
						</div>
						<div>
							<h2>${errMsg}</h2>
						</div>
					</c:when>
					<c:otherwise>
						<div id="member">
							${user.id}(${user.name})님 로그인 되었습니다. <a
								href="<c:url value="/logout"/>">로그아웃</a>
						</div>
						<div id="main">
							<select onchange="window.open(value,'_self');">
								<option value="">회원정보관리</option>
								<option value="${root}/listMeber.do">회원정보 검색</option>
								<option value="${root}/updateForm.do">회원정보 수정</option>
								<option value="${root}/delete.do?id=${user.id}">회원 탈퇴</option>
							</select>
						</div>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<header>
			<%@ include file="/resources/menu/happyhouse.html" %>
		</header>
		<!-- nav start -->
		<nav id="nav-1">
		  <a class="link-1" href="<c:url value="/main.do"/>">Home</a>
		  <a class="link-1" href="<c:url value="/search"/>">전체 매매 정보</a>
		  <a class="link-1" href="<c:url value="/isafe"/>">아이 지킴이 정보</a>
		  <a class="link-1" href="<c:url value="/store"/>">상권 정보</a>
		  <a class="link-1" href="<c:url value="/dongDetail"/>">상세 정보</a>
		  <a class="link-1" href="<c:url value="/notice"/>">Notice</a>
		  <a class="link-1" href="<c:url value="/qna"/>">Q&A</a>
		</nav>
		
		<!-- nav end -->
