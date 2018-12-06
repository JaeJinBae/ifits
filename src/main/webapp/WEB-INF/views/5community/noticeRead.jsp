<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Brand | 아이핏에스</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media only screen and (min-width:320px) and (max-width:767px){
	header{
		width:100%;
	}
	section{
		width:100%;
	}
	footer{
		width:100%;
	}
}
@media only screen and (min-width:768px) and (max-width:1023px){
	header{
		width:100%;
	}
	section{
		width:100%;
	}
	footer{
		width:100%;
	}
}
@media only screen and (min-width:1024px){
	header{
		width:100%;
	}
	section{
		width:100%;
	}
	.section_top{
		width:100%;
		height:500px;
		background: green;
	}
	.mid_nav_wrap{
		width:100%;
		height:61px;
		background: #f1f1f1;
		border-bottom:1px solid lightgray;
	}
	.mid_nav_wrap > ul{
		width:1024px;
		margin:0 auto;
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li{
		float:left;
		background: #fff;
		line-height:60px;
		border-left:1px solid lightgray;
	}
	.mid_nav_wrap > ul > li:first-child{
		width:60px;
		text-align: center;
	}
	.mid_nav_wrap > ul > li:first-child > a > img{ 
		width:30px;
		margin-top:18px;
	}
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li){
		width:210px;
		font-size:20px;
		font-weight:600;
		border-right:1px solid lightgray;
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li) > p{
		float:left;
		margin-left:20px;
		font-size:20px;
		font-weight:600;
	}
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li) > img{
		width:26px;
		float:right;
		margin:22px 21px 0 0; 
	} 
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li):hover > .mid_sub_nav_wrap{ 
		display:block; 
	}
	.mid_sub_nav_wrap{
		display:none; 
		clear:both;
		background: #fff;
		border-bottom:1px solid lightgray;
	}
	.mid_sub_nav_wrap > ul > li{
		padding-left:20px;
		border-top:1px solid lightgray;
	}
	.mid_sub_nav_wrap > ul > li > a{
		font-size:18px;
	}
	/* content */
	.contentWrap{
		width:100%;
	}
	.content_title{
		width:1024px;
		margin:20px auto;
		padding:30px;
		border-bottom:2px solid lightgray;
	}
	.content{
		width:1024px;
		margin:0 auto;
	}
	
	
	footer{ 
		width:100%;
	}
}
</style>
<script>
$(function(){
	//게시판 검색
    $("#searchBtn").click(function(){
    	var s=$("select[name='searchType']").val();
		var searchType = encodeURIComponent(s);
		var k=$("input[name='keyword']").val();
		var keyword = encodeURIComponent(k);
		location.href="notice${pageMaker.makeQuery(1)}&searchType="+searchType+"&keyword="+keyword;
	});
	
	//익스플로러에서 한글 검색 후 read로 넘어갈 때 인코딩 문제 아래와 같이 해결
	$(".title > a").click(function(e){
		e.preventDefault();
		var bno=$(this).parent().parent().find(".bno").text();
		var s=$("select[name='searchType']").val();
		var searchType = encodeURIComponent(s);
		var k=$("input[name='keyword']").val();
		var keyword = encodeURIComponent(k);
		location.href="noticeRead${pageMaker.makeQuery(pageMaker.cri.page)}&searchType="+searchType+"&keyword="+keyword+"&bno="+bno;
	});
	
	$("input[name='keyword']").val("");
});
</script>
</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<section>
		<div class="section_top">
			
		</div>
		<div class="mid_nav_wrap">
			<ul>
				<li class="mid_nav_first_li"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/homeBtnImg.png"></a></li>
				<li>
					<p>Community</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/product">Product</a></li>
							<li><a href="${pageContext.request.contextPath}/technique">Technique</a></li>
							<li><a href="${pageContext.request.contextPath}/information">Information</a></li>
							<li><a href="${pageContext.request.contextPath}/notice">Community</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>Notice</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
							<li><a href="${pageContext.request.contextPath}/review">Review</a></li>
							<li><a href="${pageContext.request.contextPath}/partnership">제휴</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="contentWrap">
			<div class="content_title">
				<h2>공지사항</h2>
			</div>
			<div class="content">
				
			</div><!-- content end -->
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>