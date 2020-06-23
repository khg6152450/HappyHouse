<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HappyHouse</title>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/happyhouse.css" />
<Script src="${pageContext.request.contextPath}/resources/menu/happyhouse.js"></Script>
<style>
	#chart{
		width: 100%;
	}
	#chart>div{
		display: inline-block;
		margin: auto 30px auto 30px;
	}
</style>
</head>
<body>
	<div style="display: block;">
		<div>
			<%@ include file="/resources/menu/header.jsp" %>
		</div>

		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
					<div align="center">
						시도 : <select id="sido"> <option value="0">선택</option> </select> 
						구군 : <select id="gugun"> <option value="0">선택</option> </select>
						읍면동 : <select id="dong"> <option value="0">선택</option> 
						</select>
						<hr>
					</div>
					<div class="container"  id="table1" style="display: none;">
					<h2>주민등록인구 통계</h2>
					<div id="chart">
						<div>
							<canvas id="tot"></canvas>
						</div>
						<div>
							<canvas id="kr"></canvas>
						</div>
						<div>
							<canvas id="fr"></canvas>
						</div>
					</div>
						<table class="table mt-2">
						<thead>
							<tr>
								<th colspan="3" style="text-align: center;">합계</th>
								<th colspan="3" style="text-align: center;">한국인</th>
								<th colspan="3" style="text-align: center;">외국인</th>
								<th rowspan="2" style="text-align: center;">고령자</th>
							</tr>
							<tr>
								<th>계</th>
								<th>남자</th>
								<th>여자</th>
								<th>계</th>
								<th>남자</th>
								<th>여자</th>
								<th>계</th>
								<th>남자</th>
								<th>여자</th>																
							</tr>
						</thead>
						<tbody id="searchResult">
						</tbody>
					</table>
					</div>
					<div class="container"  id="table3" style="display: none;">
					<h2>상세 정보</h2>
					<div id="map" style="width: 80%; height: 500px; margin: auto;"></div>
					</div>	
				</div>
			</div>
		</section>
		<footer>
			<%@ include file="/resources/menu/footer.html" %>
		</footer>
	</div>
	
	
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0&callback=initMap"></script>
<script>
let colorArr = ['table-primary','table-success','table-danger'];
var totData = [];
var krData = [];
var frData = [];

$(document).ready(function(){
	$.get("${pageContext.request.contextPath}/SelectBoxController"
		,{command:"sido"}
		,function(data, status){
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
			});
		}
		, "json"
	);
});
$(document).ready(function(){
	$("#sido").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"gugun", sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
					});
				}
				, "json"
		);
	});
	$("#gugun").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"dong", gugun:$("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});
				}
				, "json"
		);
	});
	$("#dong").change(function() {
		totData = [];
		krData = [];
		frData = [];
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"population", dong:$("#dong").val()}
				,function(data, status){
					$("#searchResult").empty();
						$("#searchResult").text("");
						$("#table1").hide();
					$.each(data, function(index, vo) {
							let str = "<tr class="+colorArr[index%3]+">"
							+ "<td>" + vo.all_all + "</td>"
							+ "<td>" + vo.all_man + "</td>"
							+ "<td>" + vo.all_woman + "</td>"
							+ "<td>" + vo.kr_all + "</td>"
							+ "<td>" + vo.kr_man + "</td>"
							+ "<td>" + vo.kr_woman + "</td>"
							+ "<td>" + vo.fr_all + "</td>"
							+ "<td>" + vo.fr_man + "</td>"
							+ "<td>" + vo.fr_woman + "</td>"
							+ "<td>" + vo.senior + "</td></tr>";
							totData.push(vo.all_man.replace(',', ''));
							totData.push(vo.all_woman.replace(',', ''));
							krData.push(vo.kr_man.replace(',', ''));
							krData.push(vo.kr_woman.replace(',', ''));
							frData.push(vo.fr_man);
							frData.push(vo.fr_woman);
// 							Data.push(vo.senior.replace(',', ''));
							$("#searchResult").append(str);
							$("#table1").show();
							createChart();
					});
				}
				, "json"
		);
	});
	$("#dong").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"tour", dong:$("#dong").val()}
				,function(data, status){
					$("#searchResult3").empty();
						$("#searchResult3").text("");
						$("#table3").hide();
					$.each(data, function(index, vo) {
						$("#table3").show();
						initMap();
						geocodeTour(data);		
					});
						zoomDong(data);
				}
				, "json"
		);
	});
	$("#dong").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"natural", gugun:$("#gugun").val()}
				,function(data, status){
					$("#searchResult3").empty();
						$("#searchResult3").text("");
						$("#table3").hide();
					$.each(data, function(index, vo) {
						$("#table3").show();
						geocodeNatural(data);
					});
						zoomDong(data);
				}
				, "json"
		);
	});
	$("#dong").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
			,{command:"subway", gugun:$("#gugun").val()}
			,function(data, status){
				$("#searchResult3").empty();
					$("#searchResult3").text("");
					$("#table3").hide();
				$.each(data, function(index, vo) {
					$("#table3").show();
					geocodeSubway(data);
				});
					zoomDong(data);
			}
			, "json"
		);
	});
	
	
	
	
	
});

var totChart;
var krChart;
var frChart;
function createChart(){
	var tot = {
			datasets: [{
				data: totData,
				backgroundColor: [ 
					"#36A2EB", 
					"#FF6384"
				]
			}],
			labels: ['남자', '여자']
	};
	var kr = {
			datasets: [{
				data: krData,
				backgroundColor: [ 
					"#36A2EB", 
					"#FF6384"
				]
			}],
			labels: ['남자', '여자']
	};
	var fr = {
			datasets: [{
				data: frData,
				backgroundColor: [ 
					"#36A2EB", 
					"#FF6384"
				]
			}],
			labels: ['남자', '여자']
	};
	
	destroyChart(totChart);
	destroyChart(krChart);
	destroyChart(frChart);
	
	var ctx = document.getElementById("tot").getContext("2d");
	totChart = new Chart(ctx,{
		type: 'pie',
		data: tot,
		options: {
			responsive: false, 
			legend: {
				position: 'top',
			},
			title: {
				display: true,
				text: '총 합계',
				fontSize: 20
			}
		}
	});
	var ctx = document.getElementById("kr").getContext("2d");
	krChart = new Chart(ctx,{
		type: 'pie',
		data: kr,
		options: {
			responsive: true, 
			legend: {
				position: 'top',
			},
			title: {
				display: true,
				text: '한국인',
				fontSize: 20
			}
		}
	});
	var ctx = document.getElementById("fr").getContext("2d");
	frChart = new Chart(ctx,{
		type: 'pie',
		data: fr,
		options: {
			responsive: true, 
			legend: {
				position: 'top',
			},
			title: {
				display: true,
				text: '외국인',
				fontSize: 20
			}
		}
	});
}

function destroyChart(chart){
	if(chart != null){
		chart.destroy();
	}
}


var multi = {lat: 37.5665734, lng: 126.978179};
var map;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center: multi, zoom: 12
	});
	
}

function geocodeNatural(jsonData) {
	let idx = 0;
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
					, address:vo.name
				}
				, function(data, status) {
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					
					addMarkerNatural(tmpLat, tmpLng, vo.name, vo.link);						
					
				}
				, "json"
		);	
	});
}
function addMarkerNatural(tmpLat, tmpLng, name, link) {
	
	var image = "/happyhouse/resources/img/park1.png";			
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
		label: name,
		title: name,
		icon: image
	});
	marker.addListener('click', function() {
		map.setZoom(17);
		map.setCenter(marker.getPosition());
		if(link != ""){
			window.open(link, '_blank'); 
		}
	});
	marker.setMap(map);
}

function geocodeSubway(jsonData) {
	let idx = 0;
// 	console.log(jsonData);
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
					, address:vo.address
				}
				, function(data, status) {
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					
					addMarkerSubway(tmpLat, tmpLng, vo.name, vo.address, vo.ho);						
					
				}
				, "json"
		);	
	});
}
function addMarkerSubway(tmpLat, tmpLng, name, address, ho) {
	
	var image = "/happyhouse/resources/img/subway1.png";			
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
		label: "",
		title: name + "\n" + address + "\n" + ho,
		icon: image
	});
	marker.addListener('click', function() {
		map.setZoom(17);
		map.setCenter(marker.getPosition());
		if(link != ""){
			window.open(link, '_blank'); 
		}
	});
	marker.setMap(map);
}
/////tour
function geocodeTour(jsonData) {
	var idx = 0;
// 	console.log(jsonData);
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		if(idx <= 5){
			$.get("https://maps.googleapis.com/maps/api/geocode/json"
					,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
						, address:vo.name
					}
					, function(data, status) {
						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						
						addMarkerTour(tmpLat, tmpLng, vo.name, vo.type);						
						
					}
					, "json"
			);	
			idx++;			
		}
	});
}
function addMarkerTour(tmpLat, tmpLng, name, type) {
				
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
		label: name,
		title: name + "\n" + type,
	});
	marker.addListener('click', function() {
		map.setZoom(17);
		map.setCenter(marker.getPosition());
		if(link != ""){
			window.open(link, '_blank'); 
		}
	});
	marker.setMap(map);
}
















function zoomDong(jsonData) {
	map.setZoom(14);
	let idx = 0;
	$.each(jsonData, function(index, vo) {
	let tmpLat;
	let tmpLng;
	$.get("https://maps.googleapis.com/maps/api/geocode/json"
			,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
				, address:vo.name
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
