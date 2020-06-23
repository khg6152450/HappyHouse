<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script
	src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
</head>
<body>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white">
		<div style="text-align: center">
					<h2>회원 정보 수정</h2>
				</div>
			<div class="container">
					<form method="post" action="<c:url value="/update.do"/>">
						<input type="hidden" name="id" value="${user.id }">
						<div class="form-group">
							<label>아이디 : ${user.id}</label>
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" name="password"
								class="form-control" value="${user.password}"/>
						</div>
						<div class="form-group">
							<label>이름 </label> <input type="text" name="name"
								class="form-control" value="${user.name}"/>
						</div>
						<div class="form-group">
							<label>이메일 </label> <input type="text" name="email"
								class="form-control" value="${user.email}"/>
						</div>
						<div class="form-group">
							<label>전화번호</label> <input type="text" name="phoneNum"
								class="form-control" value="${user.phoneNum}"/>
						</div>
						<div class="form-group">
							<label>우편번호</label> <input type="text" name="postNum"
								class="form-control" value="${user.postNum}"/>
						</div>
						<div class="form-group">
							<label>주소 </label> <input type="text" name="address_default"
								class="form-control" value="${user.address_default}"/>
						</div>
						<div class="form-group">
							<label>상세주소</label> <input type="text" name="address_detail"
								class="form-control" value="${user.address_detail}"/>
						</div>
						<div class="form-group">
							<label>집 전화</label> <input type="text" name="homeNum"
								class="form-control" value="${user.homeNum}"/>
						</div>
						<div class="form-group">
							<label>희망 금액 설정</label> <input type="text" name="amount"
								class="form-control" value="${user.amount}"/>
						</div>
						<div class="form-group">
							<label>희망 건축연도 설정</label> <input type="text" name="buildYear"
								class="form-control" value="${user.buildYear}"/>
						</div>
						<div class="form-group">
							<label>희망 면적 설정</label> <input type="text" name="area"
								class="form-control" value="${user.area}"/>
						</div>
						<div style="float: right">
							<button class="btn btn-primary">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>