<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/notice.do"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>Happy House 공지사항목록(Search By KMP/merge algorithm)</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/menu/menu.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
		<script type="text/javascript">
		function movewrite() {
			location.href="${root}/notice.do?act=mvwrite";
		}
		function searchNotice() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/notice.do";
			document.getElementById("searchform").submit();
		}
		</script>
	</head>
	<body>	
	<div class="container">
			<%@ include file="/resources/menu/header.jsp" %>
		</div>
	<div class="container" align="center">
	  <div class="col-lg-8" align="center">
	  <h2>공지사항 목록(Search By KMP/merge algorithm)</h2>
	  <p>Happy House 공지사항입니다.</p>  
	  <table class="table table-borderless">
	  	<tr>
			<td align="right">
	  			<button type="button" class="btn btn-link" onclick="javascript:movewrite();">글쓰기</button>
				<a href="${root}/notice.do?act=logout">로그아웃</a>  			
	  		</td>	  	
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="listNoticeByAlgo">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="adminid" selected="selected">아이디</option>
			    <option value="noticeno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchNotice();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${notices.size() != 0}">
	  	<c:forEach var="notice" items="${notices}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	        <td>작성자 : ${notice.userid}</td>
	        <td align="right">작성일 : ${notice.regtime}</td>
	      </tr>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>${notice.noticeno}. ${notice.subject}</strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">${notice.content}</td>
	      </tr>
	      <c:if test="${userinfo.userid == notice.userid}">
	      <tr>
	        <td colspan="2">
			<a href="${root}/notice.do?act=mvmodify&noticeno=${notice.noticeno}">수정</a>
			<a href="${root}/notice.do?act=delete&noticeno=${notice.noticeno}">삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  	</c:forEach>
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
	</body>
</html>
</c:if>
