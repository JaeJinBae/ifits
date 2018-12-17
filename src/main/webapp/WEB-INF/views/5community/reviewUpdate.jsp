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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditorBasic/ckeditor.js"></script>
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
	.tableWrap #f1{ 
		width:100%;
		margin:0 auto;
	}
	.tableWrap #f1 table{
		width:100%;
		border-top:5px solid #e3e3e3;
	}
	#f1 table tr td{
		font-size:14px;
		border-bottom:1px solid #e3e3e3;
		padding:10px 0;
	}
	#f1 table tr td:first-child{
		width:75px;
		text-align: right;
	}
	#f1 table tr td:nth-child(2){
		/* width:70%; */
		text-align: left;
		padding-left:15px;
	}
	#f1 table tr:nth-child(4) td:last-child input{
		width:100%;
	}
	#f1 table tr:last-child td{
		padding-top:20px;
	}
	.star{
		color:#0b8783;
	}
	.stick{
		margin-left:10px;
		color:lightgray;
	}
	.warn{
		display:block;
		margin-top:5px;
		margin-left:5px;
	}
	.btnWrap{
		width:100%;
		margin-top:10px;
		margin-bottom:50px;
		text-align: center;
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
	.btnWrap .goListBtn>button{
		width:50px;
	}
	.btnWrap .submitBtn{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
		cursor:pointer; 
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
	.tableWrap #f1{ 
		width:95%;
		margin:0 auto;
	}
	.tableWrap #f1 table{
		width:100%;
		border-top:5px solid #e3e3e3;
	}
	#f1 table tr td{
		font-size:14px;
		border-bottom:1px solid #e3e3e3;
		padding:10px 0;
	}
	#f1 table tr td:first-child{
		width:8%;
		text-align: right;
	}
	#f1 table tr td:nth-child(2){
		width:70%;
		text-align: left;
		padding-left:30px;
	}
	#f1 table tr:nth-child(4) td:last-child input{
		width:600px;
	}
	#f1 table tr:last-child td{
		padding-top:20px;
	}
	.star{
		color:#0b8783;
		/* font-size:20px; */
	}
	.stick{
		margin-left:10px;
		color:lightgray;
	}
	.warn{
		margin-left:15px;
	}
	.btnWrap{
		width:100%;
		margin-top:10px;
		margin-bottom:50px;
		text-align: center;
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
	.btnWrap .goListBtn>button{
		width:50px;
	}
	.btnWrap .submitBtn{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
		cursor:pointer; 
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
	.tableWrap #f1{ 
		width:95%;
		margin:0 auto;
	}
	.tableWrap #f1 table{
		width:100%;
		border-top:5px solid #e3e3e3;
	}
	#f1 table tr td{
		font-size:14px;
		border-bottom:1px solid #e3e3e3;
		padding:10px 0;
	}
	#f1 table tr td:first-child{
		width:8%;
		text-align: right;
	}
	#f1 table tr td:nth-child(2){
		width:70%;
		text-align: left;
		padding-left:30px;
	}
	#f1 table tr:nth-child(4) td:last-child input{
		width:600px;
	}
	#f1 table tr:last-child td{
		padding-top:20px;
	}
	.star{
		color:#0b8783;
		/* font-size:20px; */
	}
	.stick{
		margin-left:10px;
		color:lightgray;
	}
	.warn{
		margin-left:15px;
	}
	.btnWrap{
		width:100%;
		margin-top:10px;
		margin-bottom:50px;
		text-align: center;
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
	.btnWrap .goListBtn>button{
		width:50px;
	}
	.btnWrap .submitBtn{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
		cursor:pointer; 
	}
	
	footer{ 
		width:100%;
	}
}
</style>
<script>
$(function(){
	//예외처리
	$("#f1").submit(function(){
		if($("input[name='writer']").val()==""||$("input[name='writer']").val()==null){
			alert("작성자를 입력해주세요.");
			return false;
		}else if($("input[name='title']").val()==""||$("input[name='title']").val()==null){
			alert("제목을 입력해주세요.");
			return false;
		}
	})
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
					<form id="f1" method="post" action="reviewUpdate${pageMaker.makeSearch(pageMaker.cri.page)}">
						<input type="hidden" name="bno" value="${item.bno}">
						<table>
							<tr>
								<td><span class="star">*</span> 공개여부<span class="stick">|</span></td>
								<td>
									<input type="radio" name="pwtype" value="o">공개 &nbsp;&nbsp;
									<input type="radio" name="pwtype" value="x" checked="checked">비공개
								</td>
							</tr>
							<tr>
								<td><span class="star">*</span> 비밀번호<span class="stick">|</span></td>
								<td><input type="text" name="pw" style="width:150px;" readonly><span class="warn">※ 비공개 선택 시 비밀번호는 필수 입니다.</span></td> 
							</tr>
							<tr>
								<td><span class="star">*</span> 작성자<span class="stick">|</span></td>
								<td><input type="text" name="writer" style="width:150px;" value="${item.writer}"></td>
							</tr>
							<tr>
								<td><span class="star">*</span> 제목<span class="stick">|</span></td>
								<td><input type="text" name="title" value="${item.title}"></td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea id="editor1" name="content">${item.content}</textarea>
									<script>
										CKEDITOR.replace('content',{filebrowserUploadUrl:"/admin/imgUpload"});
									</script>
								</td>
							</tr>
						</table>
						<div class="btnWrap">
							<a href="${pageContext.request.contextPath}/review${pageMaker.makeSearch(pageMaker.cri.page)}" class="goListBtn"><button type="button">목록</button></a>
							<input type="submit" value="수정" class="submitBtn">
							<a href="${pageContext.request.contextPath}/reviewRead${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}" class="cancelBtn"><button type="button">취소</button></a>
						</div>
					</form>
				</div><!-- tableWrap end -->
			</div><!-- content end -->
		</div><!-- contentWrap end -->
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>