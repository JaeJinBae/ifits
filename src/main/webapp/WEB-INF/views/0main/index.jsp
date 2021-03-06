<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이핏에스</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css?ver=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media only screen and (min-width:320px) and (max-width:767px){
	.pc_ver{
		display:none;
	}
	header{
		width:100%;
		position: fixed;
		top:0;
		background: #fff;
	}
	section{
		width:100%;
		padding-top:88px;
	}
	.mainBanner{
		width:100%;
		background: green;
	}
	.mainBanner > img{
		width:100%;
	}
	.product_section{
		width:100%;
		background: url("${pageContext.request.contextPath}/resources/images/test2.jpg") no-repeat;
		background-size: cover;
	} 
	.product_contentWrap{
		width:100%;
		max-width:820px; 
		margin:0 auto;
		padding: 0 10px 40px 10px;
	}
	.product_content_txt{
		width:100%;
	}
	.product_content_txt > h1{
		padding:20px 0;
		font-size:35px;
		color: black;
		font-family: sans-serif;
	}
	.numberUl > ul{
		overflow:hidden;
	}
	.numberUl > ul > li{
		float:left;
		margin: 0 15px;
		font-size:16px;
		font-family: sans-serif;
	}
	.numberUl > ul > li:first-child{
		font-weight:bold; 
		border-bottom:3px solid black;
	}
	.product_content_txt > h2{
		font-size:20px;
		padding:20px 0;
	}
	.product_content_txt > ul{
		padding-left:50px;
	} 
	.product_content_txt > ul > li{
		list-style: disc;
		font-size:15px;
		margin:10px 0;
	}
	.moreBtn{
		width:130px;
		background: #4f4f4f;
		text-align: center;
		border-radius: 10px;
		padding:10px 0;
		margin:0 auto;
		margin-top:25px;
	}
	.moreBtn > a{
		color:#fff;
		font-size:15px;
	}
	.moreBtn > a:hover{
		font-weight:600;
	}
	.product_content_img{
		width:100%;
		margin-top:20px; 
	}
	.product_content_img > img{
		width:100%;
	}
	footer{
		border-top:1px solid lightgray;
	}
}
@media only screen and (min-width:768px) and (max-width:1024px){
	header{
		width:100%;
	}
	section{
		width:100%;
	}
	.mainBanner{
		width:100%;
		background: green;
	}
	.mainBanner > img{
		width:100%;
	}
	.product_section{
		width:100%;
		background: url("${pageContext.request.contextPath}/resources/images/test2.jpg") no-repeat;
		background-size: cover;
	} 
	.product_contentWrap{
		width:100%;
		max-width:820px; 
		margin:0 auto;
		padding: 40px 10px;
		overflow:hidden;
	}
	.product_content_txt{
		width:375px;
		float:left;
	}
	.product_content_txt > h1{
		padding:20px 0;
		font-size:50px;
		color: black;
		font-family: sans-serif;
	}
	.numberUl > ul{
		overflow:hidden;
	}
	.numberUl > ul > li{
		float:left;
		margin: 0 15px;
		font-size:17px;
		font-family: sans-serif;
	}
	.numberUl > ul > li:first-child{
		font-weight:bold; 
		border-bottom:3px solid black;
	}
	.product_content_txt > h2{
		font-size:25px;
		padding:40px 0;
	}
	.product_content_txt > ul{
		padding-left:50px;
	} 
	.product_content_txt > ul > li{
		list-style: disc;
		font-size:17px;
		margin:20px 0;
	}
	.moreBtn{
		width:130px;
		background: #4f4f4f;
		text-align: center;
		border-radius: 10px;
		padding:10px 0;
		margin-top:85px;
		margin-left:30px;
	}
	.moreBtn > a{
		color:#fff;
		font-size:15px;
	}
	.moreBtn > a:hover{
		font-weight:600;
	}
	.product_content_img{
		width:330px;
		float:right;
		margin-top:80px; 
	}
	.product_content_img > img{
		width:100%;
	}
}
@media only screen and (min-width:1025px){
	.m_ver{
		display:none;
	}
	header{
		width:100%;
		box-shadow: 0 0px 5px 0px gray;
	}
	section{
		width:100%;
	}
	.mainBanner{
		width:100%;
	}
	.mainBanner > img{
		width:100%;
	}
	.product_section{
		width:100%;
		background: url("${pageContext.request.contextPath}/resources/images/test2.jpg") no-repeat;
		background-size: cover;
	} 
	.product_contentWrap{
		width:1100px;
		margin:0 auto;
		padding: 40px 10px;
		overflow:hidden;
	}
	.product_content_txt{
		width:470px;
		float:left;
	}
	.product_content_txt > h1{
		padding:20px 0;
		font-size:60px;
		color: black;
		font-family: sans-serif;
	}
	.numberUl > ul{
		overflow:hidden;
	}
	.numberUl > ul > li{
		float:left;
		margin: 0 15px;
		font-size:19px;
		font-family: sans-serif;
	}
	.numberUl > ul > li:first-child{
		font-weight:bold;
		border-bottom:3px solid black;
	}
	.product_content_txt > h2{
		font-size:30px;
		padding:45px 0;
	}
	.product_content_txt > ul{
		padding-left:50px;
	} 
	.product_content_txt > ul > li{
		list-style: disc;
		font-size:19px;
		margin:25px 0;
	}
	.moreBtn{
		width:140px;
		background: #4f4f4f;
		text-align: center;
		border-radius: 10px;
		padding:10px 0;
		margin-top:85px;
		margin-left:30px;
	}
	.moreBtn > a{
		color:#fff;
		font-size:17px;
	}
	.moreBtn > a:hover{
		font-weight:600;
	}
	.product_content_img{
		width:500px;
		float:right;
		margin-top:80px;
		border:1px solid #f4f4f4;
	}
	.product_content_img > img{
		width:100%;
	}
}
</style>
<script> 
	
</script>
</head>
<body id="main">
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<section> 
		<div class="mainBanner">
			<img class="pc_ver" src="${pageContext.request.contextPath}/resources/images/pc_mainBanner.jpg">
			<img class="m_ver" src="${pageContext.request.contextPath}/resources/images/mobile_mainBanner.jpg">
		</div>
		<div class="product_section">
			<div class="product_contentWrap">
				<div class="product_content_txt">
					<h1>Product</h1>
					<div class="numberUl">
						<ul>
							<li>01</li>
							<!-- <li>02</li>
							<li>03</li>
							<li>04</li> -->
						</ul>
					</div>
					<h2>요통 예방 및 치료 기능성 의자</h2>
					<ul>
						<li>인체공학 디자인 및 설계</li>
						<li>요통 예방&치료 효과</li>
						<li>현)물리치료실장 직접 설계</li>
					</ul>
					<p class="moreBtn"><a href="${pageContext.request.contextPath}/product">제품 더 보기</a></p>
				</div><!-- product_content_txt end -->
				<div class="product_content_img">
					<img src="${pageContext.request.contextPath}/resources/images/main_product1.png">
				</div><!-- product_content_img end -->
			</div><!-- product_contentWrap end -->
		</div><!-- product_section end -->
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>