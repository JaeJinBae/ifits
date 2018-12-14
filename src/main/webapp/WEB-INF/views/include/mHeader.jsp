<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.menuBg{display:none;position:fixed;top:0px;left:0px;background-color:rgba(0, 0, 0, 0.8);width:100%;height:100%;z-index:1;}
	.headerWrap2{
		width:100%;
		text-align: center;
		margin-top:8px;
		padding-bottom:10px;
		position: relative;
		border-bottom:1px solid lightgray;
	}
	.logo{
		margin:0 auto;
	}
	.logo > img{
		width:165px; 
	}
	.menuIcon{
		/* width:30px; */
		position:absolute;
		top:10px;
		right:16px;
	}
	.menuIcon > img{
		width:48px;
	}
	.sidenav {
	    height: 100%; /* 100% Full-height */
	    width: 250px; /* 0 width - change this with JavaScript */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Stay on top */
	    top: 0; /* Stay at the top */
	    right: -250px;
	    background: #f2f2f2;
	    overflow-x: hidden; /* Disable horizontal scroll */
	    padding-top: 40px; /* Place content 60px from the top */
	    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
	}
	.homeBtn{
		position: absolute;
	    top: 17px;
	    left:0;
	    font-size: 18px;
	    margin-left: 20px;
	    color:#363636;
	}
	.homeBtn > img{
		display:inline-block;
		width:25px;
		margin-top:-2px;
	}
	.homeBtn > span{
		margin-left:10px;
		font-weight:600;
	}
	.memberBtn{
		position: absolute;
		top:20px;
		left:30%;
		font-size:15px;
	}
	.memberBtn > a{
		margin:0 3px;
	}
	.sidenav .closebtn {
	    position: absolute;
	    top:5px;
	    right: 16px;
	    font-size: 40px;
	    margin-left: 50px;
	    color:#363636;
	}
	.sidenav > hr{
		margin-top:15px;
		margin-bottom:0;
		border:0;
		border-top:2px solid #363636;
	}
	.sidenav .mainMenu > li{
		border-bottom:1px solid #444;
		text-align: left;
	}
	.sidenav .mainMenu > li > p {
	    padding: 13px 8px 13px 20px;
	    text-decoration: none;
	    font-size: 16px;
	    color: #444;
	    display: block;
	    transition: 0.3s;
	    font-weight:600;
	}
	.sidenav .mainMenu > li > p > img{
		width:11px;
		float:right;
		margin-right:14px;
		margin-top:-2px;
	}
	.sidenav .mainMenu > li:last-child > p > img{
		width:20px;
		float:right;
		margin-right:10px;
		margin-top:6px;
	}
	.subMenu{
		display:none;
		padding:15px 0 15px 40px;
		background: #363636;
	}
	.subNavUl > li{
		margin:10px 0;
	}
	.subNavUl > li:first-child{
		margin-top:0;
	}
	.subNavUl > li > a{
		font-size:15px;
		color:#fff;
	}
	.mCallInfo{
		width:100%;
		border:1px solid lightgray;
		padding:15px;
		margin-top:20px;
		background: #fff;
	}
	.mCallInfoTitle{
		margin-bottom:10px;
		font-size:20px;
	}
	.mCallInfoTitle:not(#mCallInfoTitle){
		margin-top:15px;
	}
	.mCallInfo > h3{
		font-weight:600;	
		color: #0072bc;
		font-size:25px;
	}
	.mCallInfo > .secondChild{
		margin-bottom:8px;
	}
	.mCallInfo > h5{
		font-size:14px;
		font-weight:500;
	}
	.mCallInfo > .mCallInfoTitle:not(#mCallInfoTitle) ~ h5{
		font-weight:500;
		font-size:22px;
	}
	.mSmalltxt{
		font-size:14px;
	}
	.blank{
		display:inline-block;
		margin-left:3px; 
	}
</style>
<script>
	// sideNavBar
	function openNav() {
	    document.getElementById("mySidenav").style.width = "250px";
	    document.getElementById("mySidenav").style.right = "0px";
	    $(".menuBg").css({"display":"block"});
	}
	function closeNav() {
	    document.getElementById("mySidenav").style.right = "-250px";
	    document.getElementById("main").style.marginRight = "0";
	    $(".menuBg").css({"display":"none"});
	}
	
	$(function(){
		var arr=[0, 0, 0, 0, 0, 0];
		//메뉴 클릭 시 화살표 방향 변경
		$(".mainMenu > li:last-child > p").click(function(){
			var index=$(".mainMenu > li > p").index(this);
			if(arr[index]==0){
				$(this).find("img").attr("src","${pageContext.request.contextPath}/resources/images/ico_arr_nav_up_x2.png");
				arr[index]=1;
			}else{
				$(this).find("img").attr("src","${pageContext.request.contextPath}/resources/images/ico_arr_nav_down_x2.png");
				arr[index]=0;
			}
			 
			$(this).parent().find(".subMenu").slideToggle("fast");
			
		});
	});	
</script>
<div class="headerWrap2"><!-- mobileMenu.png -->
	<a class="logo" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo_test3.png"></a>
	<p class="menuIcon" onclick="openNav()"><img src="${pageContext.request.contextPath}/resources/images/mobileMenu.png"></p>
	<div class="menuBg"></div>
	<div id="mySidenav" class="sidenav">
		<a class="homeBtn" href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/resources/images/homeBtnImg.png">
			<!-- <span>홈으로</span> -->
		</a>
		<div class="memberBtn">
			<a href="${pageContext.request.contextPath}/login">로그인</a>
			<a href="${pageContext.request.contextPath}/userSignIn">회원가입</a>
		</div>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<hr>
		<ul class="mainMenu">
			<li>
				<p><a href="${pageContext.request.contextPath}/ourbrand">Our Brand</a> <img src="${pageContext.request.contextPath}/resources/images/ico_arr_nav_right.png"></p>
			</li>
			<li>
				<p><a href="${pageContext.request.contextPath}/product">Product</a><img src="${pageContext.request.contextPath}/resources/images/ico_arr_nav_right.png"></p>
			</li>
			<li>
				<p><a href="${pageContext.request.contextPath}/technique">Technique</a><img src="${pageContext.request.contextPath}/resources/images/ico_arr_nav_right.png"></p>
			</li>
			<li>
				<p><a href="${pageContext.request.contextPath}/information">Information</a><img src="${pageContext.request.contextPath}/resources/images/ico_arr_nav_right.png"></p>
			</li>
			<li>
				<p><a href="${pageContext.request.contextPath}/notice">Community</a><img src="${pageContext.request.contextPath}/resources/images/ico_arr_nav_down_x2.png"></p>
				<div class="subMenu">
					<ul class="subNavUl">
						<li><a href="${pageContext.request.contextPath}/notice">- 공지사항</a></li>
						<li><a href="${pageContext.request.contextPath}/faq">- FAQ</a></li>
						<li><a href="${pageContext.request.contextPath}/qna">- Q&A</a></li>
						<li><a href="${pageContext.request.contextPath}/review">- Review</a></li>
						<li><a href="${pageContext.request.contextPath}/partnership">- 제휴</a></li>
					</ul>
				</div>
			</li>
		</ul>
		<div class="mCallInfo">
			<h4 class="mCallInfoTitle" id="mCallInfoTitle">상담센터</h4>
			<h3>1877 - 0757</h3>
			<h3 class="secondChild">053-745-1332</h3>
			<h5>Fax. 053-751-1696</h5>
			<h5>E-mail. tc119@naver.com</h5>
			<h4 class="mCallInfoTitle">방문상담</h4>
			<h5>AM 09:00<span class="blank"> ~ PM 06:00</span></h5>
			<h4 class="mCallInfoTitle">전화상담<span class="mSmalltxt">&nbsp;(주말가능)</span></h4>
			<h5>AM 09:00<span class="blank"> ~ PM 10:00</span></h5>
		</div><!-- callInfo end -->
	</div>
</div>