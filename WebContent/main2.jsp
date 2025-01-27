<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wagle Wagle</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>
* {
	margin: 0;
	padding: 0
}

html, body {
	overflow-y: hidden
}

ul, ol {
	list-style: none
}

.header {
	position: fixed;
	z-index: 10;
	top: 0;
	width: 100%;
	background-color: #fff;
}

.header img {
	display: block;
	margin: auto;
}

.header ul:after {
	content: "";
	display: block;
	clear: both
}

.header ul li {
	float: left;
	border-left: 1px solid rgba(255, 255, 255, 0);
	box-sizing: border-box;
	width: 25%;
}

.header ul li:first-child {
	border-left: none
}

.header ul li a {
	display: block;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 20px;
	text-decoration: none;
	background-color: #F7CAC9;
	color: #fff
}

.header ul li.on a {
	background-color: #92A8D1;
	color: #000
}

.content div {
	position: relative
}

.content .cnt01 p {
	position: absolute;
	top: 50%;
	margin-top: -40px;
	text-align: center;
	width: 100%;
	font-size: 40px;
	font-weight: bold;
}

#side-menu {
	position: fixed;
	width: 150px;
	top: 350px;
	left: -120px;
	background-color: #F7CAC9;
	transition-duration: 1s;
}

#side-menu:hover {
	transform: translate(120px, 0px);
	transition-duration: 1s;
}

#side-menu:hover #latch {
	display: none;
}

#menu-list {
	padding: 0px;
	margin: 0px;
	list-style-type: none;
}

#menu-list a {
	color: black;
	text-decoration: none;
}

#side-menu li {
	margin: 0px;
	padding: 14px;
	height: 25%;
}

#side-menu li:hover {
	background-color: #fff0f5;
	cursor: pointer;
	border-radius: 15px;
}

.content .cnt01 {
	position: relative;
}

#carouselExampleCaptions{
	position: absolute;
	top: 250px;
}

.content .cnt02 {
	background-color: #ffffff;
	overflow: hidden;
}

.content .cnt02 div {
	float: left;
}

.img {
	position: relative;
}

.somewhere {
	position: relative;
}

#f1 {
	position: absolute;
	top: 250px;
	left: 150px;
	transform: rotate(-5deg);
	border-radius: 15px;
}

#f2 {
	position: absolute;
	top: 500px;
	left: 450px;
	transform: rotate(7deg);
	border-radius: 15px;
}

#f1:hover {
	z-index: 3;
}

#f2:hover {
	z-index: 3;
}

#cnts1 {
	top: 300px;
	left: 1200px;
}

.content .cnt03 {
	background-color: #ffffff;
	overflow: hidden;
}

.content .cnt03 div {
	float: left;
}

#a1 {
	position: absolute;
	top: 170px;
	left: 230px;
	border-radius: 15px;
}

#a2 {
	position: absolute;
	top: 250px;
	left: -120px;
	transform: rotate(-7deg);
	border-radius: 15px;
}

#a3 {
	position: absolute;
	top: 500px;
	left: 380px;
	transform: rotate(7deg);
	border-radius: 15px;
}

#a1:hover {
	z-index: 3;
}

#a2:hover {
	z-index: 3;
}

#a3:hover {
	z-index: 3;
}

#cnts2 {
	top: 300px;
	left: 150px;
}

.content .cnt04 {
	background-color: #ffffff;
	overflow: hidden;
}

.content .cnt04 div {
	float: left;
}

#s1 {
	position: absolute;
	top: 250px;
	left: 150px;
	transform: rotate(-5deg);
	border-radius: 15px;
}

#s2 {
	position: absolute;
	top: 330px;
	left: 500px;
	transform: rotate(7deg);
	border-radius: 15px;
}

#s3 {
	position: absolute;
	top: 600px;
	left: 250px;
	border-radius: 15px;
}

#s1:hover {
	z-index: 3;
}

#s2:hover {
	z-index: 3;
}

#s3:hover {
	z-index: 3;
}

#cnts3 {
	top: 300px;
	left: 1200px;
}
</style>
<script>
	$(function() {
		var scroll = function() {

			var $nav = null, $cnt = null, moveCnt = null, moveIndex = 0, moveCntTop = 0, winH = 0, time = false; // 새로 만든 변수

			$(document).ready(function() {
				init();
				initEvent();
			});

			var init = function() {
				$cnt = $(".content");
				$nav = $(".header a");
			};

			var initEvent = function() {
				$("html ,body").scrollTop(0);
				winResize();
				$(window).resize(function() {
					winResize();
				});
				$nav.on("click", function() {
					moveIndex = $(this).parent("li").index();
					moving(moveIndex);
					return false;
				});
				$cnt.on("mousewheel", function(e) {
					if (time === false) { // time 변수가 펄스일때만 휠 이벤트 실행
						wheel(e);
					}
				});
			};

			var winResize = function() {
				winH = $(window).height();
				$cnt.children("div").height(winH);
				$("html ,body").scrollTop(moveIndex.scrollTop);
			};

			var wheel = function(e) {
				if (e.originalEvent.wheelDelta < 0) {
					if (moveIndex < 3) {
						moveIndex += 1;
						moving(moveIndex);
					}
					;
				} else {
					if (moveIndex > 0) {
						moveIndex -= 1;
						moving(moveIndex);
					}
					;
				}
				;
			};

			var moving = function(index) {
				time = true // 휠 이벤트가 실행 동시에 true로 변경
				moveCnt = $cnt.children("div").eq(index);
				moveCntTop = moveCnt.offset().top;
				$("html ,body").stop().animate({
					scrollTop : moveCntTop
				}, 1000, function() {
					time = false; // 휠 이벤트가 끝나면 false로 변경
				});
				$nav.parent("li").eq(index).addClass("on").siblings()
						.removeClass("on");
			};

		};

		scroll();

		$("#board1")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/select.board?category=1";
						})

		$("#board2")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/select.board?category=2";
						})

		$("#board3")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/select.board?category=3";
						})

		$("#mypage").on("click", function() {
			location.href = "${pageContext.request.contextPath}/";
		})

		$("#changepw").on("click", function() {
			location.href = "${pageContext.request.contextPath}/";
		})

		$("#logout").on("click", function() {
			location.href = "${pageContext.request.contextPath}/logout.mem";
		})

		$("#memberout")
				.on(
						"click",
						function() {
							let result = confirm("정말 탈퇴하시겠습니까?");
							if (result) {
								location.href = "${pageContext.request.contextPath}/memberout.mem";
							}
						})

	})
</script>
</head>
<body>
	<div class="header">
		<img src="logo.png" width="500px"><br>
		<ul>
			<li class="on" class="a"><a href="#">My Page</a></li>
			<li><a href="#">패션</a></li>
			<li><a href="#">동물</a></li>
			<li><a href="#">스포츠</a></li>
		</ul>
	</div>
	<div class="content">

		<div class="cnt01">
		<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="..." class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>First slide label</h5>
							<p>Some representative placeholder content for the first
								slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="..." class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Second slide label</h5>
							<p>Some representative placeholder content for the second
								slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="..." class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Third slide label</h5>
							<p>Some representative placeholder content for the third
								slide.</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div id=side-menu style="border-radius: 15px">
				<ul id=menu-list>
					<li id="mypage">마이페이지</li>
					<li id="changepw">비밀번호 변경</li>
					<li id="logout">로그아웃</li>
					<li id="memberout">회원탈퇴</li>
				</ul>
			</div>
			
		</div>

		<div class="cnt02">
			<div class="imgs">
				<img src="fashion.jpg" width="650px" id="f1"> <img
					src="fashion2.jpg" width="650px" id="f2">
			</div>
			<div class="col-sm-6 somewhere">
				<div class="card-body" id="cnts1">
					<h1 class="card-title">Card title</h1>
					<p></p>
					<h2 class="card-text">Some quick example text.</h2>
					<p></p>
					<button type="button" class="btn btn-info btn-lg" id="board1">GO!</button>
				</div>
			</div>
		</div>

		<div class="cnt03">
			<div class="col-sm-6 somewhere">
				<div class="card-body" id="cnts2">
					<h1 class="card-title">Card title</h1>
					<p></p>
					<h2 class="card-text">Some quick example text.</h2>
					<p></p>
					<button type="button" class="btn btn-warning btn-lg" id="board2">GO!</button>
				</div>
			</div>
			<div class="imgs">
				<img src="ani1.jpg" width="600px" id="a1"> <img src="ani2.jpg"
					width="500px" id="a2"> <img src="bugu.jpg" width="400px"
					id="a3">
			</div>
		</div>

		<div class="cnt04">
			<div class="imgs">
				<img src="spo1.jpg" width="600px" id="s1"> <img src="spo2.jpg"
					width="550px" id="s2"> <img src="spo3.jpg" width="700px"
					id="s3">
			</div>
			<div class="col-sm-6 somewhere">
				<div class="card-body" id="cnts3">
					<h1 class="card-title">Card title</h1>
					<p></p>
					<h2 class="card-text">Some quick example text.</h2>
					<p></p>
					<button type="button" class="btn btn-success btn-lg" id="board3">GO!</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>