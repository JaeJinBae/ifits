<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review | 아이핏에스</title>
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
	.section_top{
		width:100%;
	}
	.section_top > img{
		width:100%;
	}
	.mid_nav_wrap{
		width:100%;
		height:46px;
		background: #f1f1f1;
		border-bottom:1px solid lightgray;
	}
	.mid_nav_wrap > ul{
		width:100%;
		margin:0 auto;
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li{
		float:left;
		background: #fff;
		line-height:45px;
		border-left:1px solid lightgray;
	}
	.mid_nav_wrap > ul > li:first-child{
		width:60px;
		text-align: center;
	}
	.mid_nav_wrap > ul > li:first-child > a > img{ 
		width:25px;
		margin-top:12px;
	}
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li){
		/* width:155px; */
		font-size:16px;
		font-weight:600;
		border-right:1px solid lightgray; 
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li) > p{
		float:left;
		margin-left:20px;
		font-size:15px;
		font-weight:600;
	} 
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li) > img{
		width:26px;
		float:right;
		margin:14px 9px 0 0;
		margin-left:15px; 
	} 
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li):hover > .mid_sub_nav_wrap{ 
		display:block; 
	}
	.mid_sub_nav_wrap{
		display:none; 
		clear:both;
		background: #fefefe;
		border-bottom:1px solid lightgray;
		position: relative;
		z-index: 9;
	}
	.mid_sub_nav_wrap > ul > li{
		padding-left:20px;
		border-top:1px solid lightgray;
	}
	.mid_sub_nav_wrap > ul > li > a{
		font-size:15px;
	}
	/* content */
	.contentWrap{
		width:100%;
		padding:0 15px;
	}
	.content_title{
		width:100%;
		margin:10px auto;
		padding:15px;
		padding-left:5px;
		border-bottom:2px solid #3e3e3e;
	}
	.content_title > h2{
		font-size:20px;
	}
	.content{
		width:100%;
		margin:0 auto;
	}
	.tableWrap{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table{
		width:95%;
		margin:0 auto;
	}
	.checkWrap{
		width:100%;
		margin:0 auto;
		background: #f8f8f8;
		padding:30px 15px;
		margin-bottom:180px;
		font-size:15px;
	}
	.checkWrap > p{
		font-size:15px;
	}
	hr{
		margin:15px 0;
	}
	.btnOK{
		margin-left:10px;
		width:38px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.checkWrap button:not(.btnOK){
		width:65px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	
	footer{ 
		width:100%;
	}
}
@media only screen and (min-width:768px) and (max-width:1024px){
	header{
		width:100%;
	}
	section{
		width:100%;
	}
	.section_top{
		width:100%;
	}
	.section_top > img{
		width:100%;
	}
	.mid_nav_wrap{
		width:100%;
		height:61px;
		background: #f1f1f1;
		border-bottom:1px solid lightgray;
	}
	.mid_nav_wrap > ul{
		width:100%;
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
		background: #fefefe;
		border-bottom:1px solid lightgray;
		position: relative;
		z-index: 9;
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
		padding:0 15px;
	}
	.content_title{
		width:100%;
		margin:20px auto;
		padding:30px;
		padding-left:5px;
		border-bottom:2px solid #3e3e3e;
	}
	.content{
		width:100%;
		margin:0 auto;
	}
	.tableWrap{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table{
		width:95%;
		margin:0 auto;
	}
	.checkWrap{
		/* width:500px; */
		width:45%;
		margin:0 auto;
		background: #f8f8f8;
		padding:30px 25px;
		margin-bottom:180px;
		font-size:15px;
	}
	.checkWrap > p{
		font-size:15px;
	}
	hr{
		margin:15px 0;
	}
	.btnOK{
		margin-left:10px;
		width:38px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.checkWrap button:not(.btnOK){
		width:65px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	
	footer{ 
		width:100%;
	}
}
@media only screen and (min-width:1025px){
	header{
		width:100%;
	}
	section{
		width:100%;
	}
	.section_top{
		width:100%;
	}
	.section_top > img{
		width:100%;
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
		background: #fefefe;
		border-bottom:1px solid lightgray;
		position: relative;
		z-index: 9;
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
		padding-left:5px;
		border-bottom:2px solid #3e3e3e;
	}
	.content{
		width:1024px;
		margin:0 auto;
	}
	.tableWrap{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table{
		width:95%;
		margin:0 auto;
	}
	.checkWrap{
		/* width:500px; */
		width:45%;
		margin:0 auto;
		background: #f8f8f8;
		padding:30px 25px;
		margin-bottom:180px;
		font-size:15px;
	}
	.checkWrap > p{
		font-size:15px;
	}
	hr{
		margin:15px 0;
	}
	.btnOK{
		margin-left:10px;
		width:38px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.checkWrap button:not(.btnOK){
		width:65px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	
	footer{ 
		width:100%;
	}
}
</style>
<script>
$(function(){
	$(function(){
		/* 비밀번호 확인 */
        $(".btnOK").click(function(){
        	var pw=$("input[type='password']").val();
        	var bno=$("input[type='hidden']").val();
        	var sendData={bno:bno,pw:pw};
			$.ajax({
				url:"reviewPWcheck2",
				type:"post",
				headers:{"Content-Type":"application/json"},
				dataType:"text",
				data:JSON.stringify(sendData),//json객체를 json string 으로 변경해줌
				success:function(result){
					console.log(result);
					if(result=='ok'){
						location.href="${pageContext.request.contextPath}/reviewRead${pageMaker.makeSearch(pageMaker.cri.page)}&bno="+bno;
					}else{
						alert("비밀번호가 틀립니다.");
					}
				}
			})
        });
	});
});
</script>
</head>
<body id="main">
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<section>
		<div class="section_top">
			<img src="${pageContext.request.contextPath}/resources/images/sub_community_test2.jpg">
		</div>
		<div class="mid_nav_wrap">
			<ul>
				<li class="mid_nav_first_li"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/homeBtnImg.png"></a></li>
				<li>
					<p>Community</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/ourbrand">Our Brand</a></li>
							<li><a href="${pageContext.request.contextPath}/product">Product</a></li>
							<li><a href="${pageContext.request.contextPath}/technique">Technique</a></li>
							<li><a href="${pageContext.request.contextPath}/information">Information</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>Review</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
							<li><a href="${pageContext.request.contextPath}/partnership">제휴</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="contentWrap">
			<div class="content_title">
				<h2>Review</h2>
			</div>
			<div class="content">
				<div class="tableWrap">
					<div class="checkWrap">
						<p>비공개 글 입니다.</p>
						<p>글 작성시 입력하신 비밀번호를 입력해주세요.</p>
						<hr>
						<input type="hidden" value="${item.bno}">
						비밀번호 <input type="password" class="pwinput"><button class="btnOK">확인</button>&nbsp;<a href="review${pageMaker.makeSearch(pageMaker.cri.page)}"><button>목록으로</button></a>
					</div>
				</div>
			</div><!-- content end -->
		</div><!-- contentWrap end -->
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>