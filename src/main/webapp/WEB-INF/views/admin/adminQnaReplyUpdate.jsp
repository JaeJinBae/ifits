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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditorFull/ckeditor.js"></script>
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
		margin-right:20px;
		padding-top:15px;
		padding-bottom:15px;
		border-radius: 10px; 
		float:left;
		text-align: center;
		background:white;
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
	.contentWrap .leftMenu ul li:nth-child(4) a{
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
		margin-bottom:30px;
	}
	
	/* 글쓰기 */
	#form1{
		width:90%;
		margin:0 auto; 
		padding:0 20px;
		background: white;
		margin-bottom:10px;
	}
	#container{
		width:95%;
		margin:0 auto;
	}
	#header{
		width:100%;
		margin-bottom:30px;
	}
	#title{
		width:50%;
		line-height: 20px;
	}
	
	.btn{
		width:300px;
		height:40px;
		font-size: 1.2em;
		margin:0 auto;
		margin-top:40px;
		margin-bottom:50px;
		text-align: center;
	}
	.btn > a > button{
		border: 0;
	    background: #5c4530;
	    color: #fff;
	    border-radius: 3px;
	    width: 35px;
	    height:23px;
	}
	.btn > input{
		border: 0;
	    background: #5c4530;
	    color: #fff;
	    border-radius: 3px;
	    width: 35px;
	    height:23px;
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
			<h1 class="boardTitle">&lt;Q&A 관리&gt;</h1>
			<form id="form1" method="post" action="adminQnaReplyUpdate${pageMaker.makeSearch(pageMaker.cri.page)}">
				<div id="container">
					<p>작성자: <input type="text" name="replyer" value="관리자"></p>
					<br> 
					<input type="hidden" name="bno" value="${reply.bno}">
					<input type="hidden" name="rno" value="${reply.rno}">
					<textarea id="editor1" name="replytext">
					    ${reply.replytext}
					</textarea>
					<script>
						CKEDITOR.replace('replytext',{filebrowserUploadUrl:"/admin/imgUpload",height:400});
					</script>
					<div class="btn">
						<input type="submit" value="저장">
						<a href="${pageContext.request.contextPath}/admin/adminQnaRead${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${reply.bno}"><button type="button">뒤로가기</button></a>
					</div>
				</div>
			</form>
		</div><!-- centerMenu end -->
	</div>
</body>
</html>