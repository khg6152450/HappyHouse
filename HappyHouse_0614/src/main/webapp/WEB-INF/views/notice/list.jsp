<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Happy House 공지사항목록</title>
<meta charset="utf-8">
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
<script type="text/javascript">
	function movewrite() {
		location.href = "${root}/notice.do?act=mvwrite";
	}
	function searchNotice() {
		if (document.getElementById("word").value == "") {
			alert("모든 목록 조회!!");
		}
		document.getElementById("searchform").action = "${root}/notice.do";
		document.getElementById("searchform").submit();
	}
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("pageform").action = "${root}/notice.do";
		document.getElementById("pageform").submit();
	}
</script>
</head>
<body>
<div style="display: block;">
	<div>
		<%@ include file="/resources/menu/header.jsp"%>
	</div>
	<div style="background-color: white">
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="list"> <input
			type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
		<div class="col-lg-8" align="center">
			<h2>공지사항 목록</h2>
			<p>Happy House 공지사항입니다.</p>
			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="act" id="act" value="list"> <input
					type="hidden" name="pg" id="pg" value="1">
			</form>
			<c:if test="${notices.size() != 0}">
				<c:forEach var="notice" items="${notices}">
					<table class="table table-active">
						<tbody>
							<tr class="table-info">
								<td>작성자 : ${notice.adminid}</td>
								<td align="right">작성일 : ${notice.regtime}</td>
							</tr>
							<tr>
								<td colspan="2" class="table-danger">
								<strong>${notice.noticeno}.${notice.subject}</strong></td>
							</tr>
							<tr>
								<td colspan="2">${notice.content}</td>
							</tr>
							<c:if test="${user.id == notice.adminid}">
								<tr>
									<td colspan="2"><a
										href="${root}/updateNotice?noticeno=${notice.noticeno}">수정</a>
										<a
										href="${root}/deleteNotice?noticeno=${notice.noticeno}">삭제</a>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</c:forEach>
				<table>
					<tr>
						<td>
							${navigation.navigator}
						</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${notices.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
		</div>
	</div>
	<footer>
			<%@ include file="/resources/menu/footer.jsp" %>
		</footer>
	</div>
</body>
</html>
