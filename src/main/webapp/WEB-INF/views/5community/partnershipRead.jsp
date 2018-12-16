<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제휴 | 아이핏에스</title>
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
	.custom{
		width:95%;
		margin:0 auto;
	}
	.custom > table{
		width:100%;
		margin:0 auto;
		border-top:5px solid #e3e3e3;
		border-bottom:5px solid #e3e3e3;
		text-align:left;
	}
	.custom > table td{
		padding:10px 10px;
		font-size:14px;
		display:inline-block;
	}
	.custom>table tr:first-child td{
		width:100%;
		border-bottom:2px solid #e3e3e3;
		font-size:16px;
	}
	.custom > table tr:last-child td{
		padding:3px 10px;
	}
	.customContent{
		width:100%;
		margin:0 auto;
		padding:20px 15px;
		text-align: left;
	}
	.btnWrap{
		margin-top:50px;
		text-align: right;
	}
	.btnWrap button{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.reply{
		width:95%;
		margin:100px auto;
	}
	.reply > table{
		width:100%;
		margin:0 auto;
		border-top:5px solid #e3e3e3;
		border-bottom:5px solid #e3e3e3;
		text-align:left;
	}
	.reply > table td{
		padding:10px 10px;
		font-size:14px;
	}
	.reply > table tr:first-child td{
		width: 100%;
		border-bottom:2px solid #e3e3e3;
		font-size:16px;
	}
	.replyContent{
		width:100%;
		max-width:970px;
		margin:0 auto;
		padding:20px 15px;
		text-align: left;
	}
	.replyContent img{
		max-width:100%;
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
	.custom{
		width:95%;
		margin:0 auto;
	}
	.custom > table{
		width:100%;
		margin:0 auto;
		border-top:5px solid #e3e3e3;
		border-bottom:5px solid #e3e3e3;
		text-align:left;
	}
	.custom > table td{
		padding:10px 15px;
		font-size:14px;
	}
	.custom>table tr:first-child td{
		border-bottom:2px solid #e3e3e3;
		font-size:22px;
	}
	.customContent{
		width:100%;
		margin:0 auto;
		padding:20px 15px;
		text-align: left;
	}
	.btnWrap{
		margin-top:50px;
		text-align: right;
	}
	.btnWrap button{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.reply{
		width:95%;
		margin:100px auto;
	}
	.reply > table{
		width:100%;
		margin:0 auto;
		border-top:5px solid #e3e3e3;
		border-bottom:5px solid #e3e3e3;
		text-align:left;
	}
	.reply > table td{
		padding:10px 15px;
		font-size:14px;
	}
	.reply > table tr:first-child td{
		border-bottom:2px solid #e3e3e3;
		font-size:22px;
	}
	.replyContent{
		width:100%;
		max-width:970px;
		margin:0 auto;
		padding:20px 15px;
		text-align: left;
	}
	.replyContent img{
		max-width:1000px;
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
	.custom{
		width:95%;
		margin:0 auto;
	}
	.custom > table{
		width:100%;
		margin:0 auto;
		border-top:5px solid #e3e3e3;
		border-bottom:5px solid #e3e3e3;
		text-align:left;
	}
	.custom > table td{
		padding:10px 15px;
		font-size:14px;
	}
	.custom>table tr:first-child td{
		border-bottom:2px solid #e3e3e3;
		font-size:22px;
	}
	.customContent{
		width:100%;
		margin:0 auto;
		padding:20px 15px;
		text-align: left;
	}
	.btnWrap{
		margin-top:50px;
		text-align: right;
	}
	.btnWrap button{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.reply{
		width:95%;
		margin:100px auto;
	}
	.reply > table{
		width:100%;
		margin:0 auto;
		border-top:5px solid #e3e3e3;
		border-bottom:5px solid #e3e3e3;
		text-align:left;
	}
	.reply > table td{
		padding:10px 15px;
		font-size:14px;
	}
	.reply > table tr:first-child td{
		border-bottom:2px solid #e3e3e3;
		font-size:22px;
	}
	.replyContent{
		width:100%;
		max-width:970px;
		margin:0 auto;
		padding:20px 15px;
		text-align: left;
	}
	.replyContent img{
		max-width:1000px;
	}
	
	footer{ 
		width:100%;
	}
}
</style>
<script>
$(function(){
	
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
							<li><a href="${pageContext.request.contextPath}/ourbrand">Our Brand</a></li>
							<li><a href="${pageContext.request.contextPath}/product">Product</a></li>
							<li><a href="${pageContext.request.contextPath}/technique">Technique</a></li>
							<li><a href="${pageContext.request.contextPath}/information">Information</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>제 휴</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
							<li><a href="${pageContext.request.contextPath}/review">Review</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="contentWrap">
			<div class="content_title">
				<h2>제 휴</h2>
			</div>
			<div class="content">
				<div class="tableWrap">
					<div class="custom">
						<table>
							<tr>
								<td colspan="4">제목: ${item.title}</td>
							</tr>
							<tr>
								<td>작성자: ${item.writer}</td>
								<td>등록일: <fmt:formatDate type="date" value="${item.regdate}"/>
								<td>답변상태: ${item.state}</td>
								<td>조회: ${item.cnt}</td>
							</tr>
						</table>
						<div class="customContent">
							${item.content}
						</div>
						<div class="btnWrap">
							<a href="${pageContext.request.contextPath}/partnership${pageMaker.makeSearch(pageMaker.cri.page)}" class="btn"><button>목록</button></a>
							<c:if test="${item.pwtype=='o'}">
								<a href="${pageContext.request.contextPath}/partnershipUpdate${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}"><button>수정</button></a>
								<a href="${pageContext.request.contextPath}/partnershipDelete${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}"><button>삭제</button></a>
							</c:if>
						</div>
					</div><!-- custom end -->
					<div class="reply">
						<c:if test="${item.state=='완료'}">
							<table>
								<tr>
									<td colspan="4">제목: Re] ${item.title}</td>
								</tr>
								<tr>
									<td>작성자: 관리자</td>
									<td>답변일: <fmt:formatDate type="date" value="${reply.regdate}"/></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						<div class="replyContent">
							${reply.replytext}
						</div>
						</c:if>				
					</div><!-- reply end -->
				</div><!-- tableWrap -->
			</div><!-- content end -->
		</div><!-- contentWrap end -->
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>