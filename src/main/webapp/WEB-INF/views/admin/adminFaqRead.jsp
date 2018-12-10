<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이핏S 관리자페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	html{
		background: lightgray;
	}
	*{ 
		margin:0; 
		padding:0;
	}
	a{
		display:inline-block;
		color:black;
		text-decoration: none;
	}
	#headerDiv #headerMenu #boardCtr{
		background: white;
		color:black;
	}
	.contentWrap{
		width:100%;
		min-width:1280px;
		margin:0 auto;
		padding:20px;
		background: lightgray;
		overflow: hidden;
	}
	.contentWrap .leftMenu{
		width:250px; 
		height:100%;
		margin-right:20px;
		padding-top:15px;
		padding-bottom:15px;
		border-radius: 10px; 
		float:left;
		text-align: center;
		background:white;;
	}
	.contentWrap .leftMenu h2{
		width:220px;
		margin:0 auto;
		margin-bottom:15px;
		background: url('${pageContext.request.contextPath}/resources/images/arrow2.gif') no-repeat 10px center;
		font-size:26px;
		font-weight:bold;
	}
	.contentWrap .leftMenu ul{
		width:80%;
		margin-left:40px;
		text-align: left;
	}
	.contentWrap .leftMenu ul li{
		list-style:none;
		margin-bottom:10px;
	}
	.contentWrap .leftMenu ul li:before{
		content:">";
	}
	.contentWrap .leftMenu ul li a{
		/* font-weight: bold; */
		font-size:17px;
	}
	.contentWrap .leftMenu ul li:nth-child(3) a{
		font-weight:600;
	}
	.contentWrap .centerMenu{
		width:70%;
		min-width:700px;
		height:100%;
		border-radius:10px;
		float:left;
		background:white;
	}
	.boardTitle{
		width:90%;
		max-width:860px;
		margin:0 auto;
		font-size:20px;
		margin-top:33px;
	}
	
	/* readNotice */
	.notice_content{
		width:90%;
		margin:10px auto;
		padding:60px 20px;
		background: white;
	}
	.notice_content hr{
		width:100%;
		margin:0 auto;
		border:0;
		border-top:2px solid #00B4AE;
	}
	.notice_content .nTitle{
		font-size:25px;
		text-align: left;
		padding:15px;
	}
	.notice_content .nRegdate{
		width:100%;
		text-align:left;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
		padding:10px 0;	
		margin-bottom:50px;
	}
	.notice_content .nRegdate span{
		margin-left:15px;
	}
	.notice_content .nContent{
		margin-bottom:50px;
		padding:0 15px;
	}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div class="contentWrap">
		<div class="leftMenu">
			<h2>게시판 리스트</h2>
			<ul> 
				<li> <a href="${pageContext.request.contextPath}/admin/adminInformation"> Information</a></li>
				<li> <a href="${pageContext.request.contextPath}/admin/adminNotice"> 공지사항</a></li>
				<li> <a href="${pageContext.request.contextPath}/admin/adminFaq"> FAQ</a></li>
				<li> <a href="${pageContext.request.contextPath}/admin/adminQna"> Q&A</a></li>
				<li> <a href="${pageContext.request.contextPath}/admin/adminReview"> Review</a></li>
				<li> <a href="${pageContext.request.contextPath}/admin/adminPartnership"> 제 휴</a></li>
			</ul>
		</div>
		<div class="centerMenu">
			<h1 class="boardTitle">&lt;FAQ 관리&gt;</h1>
			<div class="notice_content">
				<hr>
				<p class="nTitle">제목: ${item.title}</p>
				<p class="nRegdate"><span>작성일: <fmt:formatDate type="date" value="${item.regdate}"/></span></p>
				<div class="nContent">
					${item.content}
				</div>
				<hr>
				<p>
					<a href="${pageContext.request.contextPath}/admin/adminFaq${pageMaker.makeSearch(pageMaker.cri.page)}"><button>목록</button></a>
					<a href="${pageContext.request.contextPath}/admin/adminFaqUpdate${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}"><button>수정</button></a>
					<a href="${pageContext.request.contextPath}/admin/adminFaqDelete${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}"><button>삭제</button></a>
				</p>
			</div><!-- notice_content end -->
		</div>
	</div>
</body>
</html>