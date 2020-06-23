<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 상세 정보 페이지</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script
	src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
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
<style type="text/css">
</style>
</head>
<body>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp"%>
		</div>
		<div style="background-color: white">
			<div>
				<h2 style="text-align: center">아파트 정보</h2>
			</div>
			<div style="text-align: center;">
				<a href="<c:url value="/search"/>">전체 매매 목록</a> <a
					href="<c:url value="/isafe"/>">아이지킴이 정보</a>
			</div>
			<div>
				<div class="container">
					<table class="table table-bordered">
						<tr>
							<th>주택명</th>
							<td>${apt.aptName}</td>
						</tr>
						<tr>
							<th>월세금액</th>
							<c:if test="${empty rentMoney}">
								<td>없음</td>
							</c:if>
						</tr>
						<tr>
							<th>건축연도</th>
							<td>${apt.buildYear}</td>
						</tr>
						<tr>
							<th>법정동</th>
							<td>${apt.dong}</td>
						</tr>
						<tr>
							<th>지번</th>
							<td>${apt.jibun}</td>
						</tr>
					</table>
				</div>
				
				<div class="container"  id="table3">
					<h2 style="text-align: center">아파트 위치</h2>
					<div id="map" style="width: 80%; height: 500px; margin: auto;"></div>
				</div>				
				
				<div class="container" id="table2" style="display: none;">
					<div>
						<h2 style="text-align: center">최근 거래 정보</h2>
					</div>
					<table class="table mt-2">
						<thead>
							<tr>
								<th>이름</th>
								<th>층</th>
								<th>면적</th>
								<th>거래가격(만원)</th>
								<th>거래일</th>
							</tr>
						</thead>
						<tbody id="result2">
						</tbody>
					</table>
				</div>
			</div>
			<footer>
				<%@ include file="/resources/menu/footer.html"%>
			</footer>
		</div>

		<script	src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
		<script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0&callback=initMap"></script>


		<script>
			var aptName = `${apt.aptName}`;
			var dongcode = `${apt.dong}`;
			console.log(dongcode);
			showDeal(aptName);
			showMap(dongcode);
			function showDeal(data) {
				console.log(data);
				$.get("${pageContext.request.contextPath}/SelectBoxController",
						{
							command : "aptDeal",
							aptName : data
						}, function(data, status) {
							$("#searchResult").empty();
							$("#result2").text("");
							$("#table2").hide();
							$.each(data, function(index, vo) {
								$("#searchResult").append(
										vo.dong + " " + vo.AptName + " "
												+ vo.jibun + "<br>");
								//							console.log(data);
								let str = "<tr>" + "<td>" + vo.aptName
										+ "</td>" + "<td>" + vo.floor + "</td>"
										+ "<td>" + vo.area + "</td>" + "<td>"
										+ vo.dealAmount + "</td>" + "<td>"
										+ vo.dealYear + "/" + vo.dealMonth
										+ "/" + vo.dealDay + "</td></tr>";
								$("#table2").show();
								$("#result2").append(str);
							});
						}, "json");
			}
			
			
			
			function showMap(data) {
				$.get("${pageContext.request.contextPath}/SelectBoxController"
						,{command:"apt", dong: data}
						,function(data, status){
							$("#searchResult").empty();
							$.each(data, function(index, vo) {
		 						console.log(data);
							});
							geocode(data);
							zoomDong(data);
						}
						, "json"
				);
			}
			
			function geocode(jsonData) {
				
				let idx = 0;
//			 	console.log(jsonData);
				$.each(jsonData, function(index, vo) {
					let tmpLat;
					let tmpLng;
					$.get("https://maps.googleapis.com/maps/api/geocode/json"
							,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
								, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
							}
							, function(data, status) {
								tmpLat = data.results[0].geometry.location.lat;
								tmpLng = data.results[0].geometry.location.lng;
								addMarker(tmpLat, tmpLng, vo.AptName, vo.no);
							}
							, "json"
					);	
				});
			}

			var multi = {lat: 37.5665734, lng: 126.978179};
			var map;
			function initMap() {
				map = new google.maps.Map(document.getElementById('map'), {
					center: multi, zoom: 12
				});
				
			}
			function addMarker(tmpLat, tmpLng, aptName, no) {
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
					label: aptName,
					title: aptName
				});
				marker.addListener('click', function() {
					map.setZoom(17);
					map.setCenter(marker.getPosition());
					showDeal(aptName);
					//location.href = "${pageContext.request.contextPath}/infosearch/" + no;
				});
				marker.setMap(map);
			}
			function zoomDong(jsonData) {
				map.setZoom(17);
				let idx = 0;
				$.each(jsonData, function(index, vo) {
				let tmpLat;
				let tmpLng;
				$.get("https://maps.googleapis.com/maps/api/geocode/json"
						,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
							, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
						}
						, function(data, status) {
							tmpLat = data.results[0].geometry.location.lat;
							tmpLng = data.results[0].geometry.location.lng;
							var multi = {lat: tmpLat, lng: tmpLng};
							map.setCenter(multi);
						}
						, "json"
				);
			});
			}
		</script>
</body>
</html>