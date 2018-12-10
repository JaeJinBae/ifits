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
		font-size:17px;
	}
	.contentWrap .leftMenu ul li:nth-child(2) a{
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
	#container{
		width:900px;
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
	/* 이미지 업로드 설명서 */
	.howToUpload{
		width:225px;
		position:absolute;
		top:452px;
		padding:15px;
		background: white;
		text-align: center;
		border-radius: 10px;
	}
	.howToUpload>h3{
		font-size:20px;
		margin-bottom:20px;
	}
	.howToUpload ol{
		text-align: left;
		margin-left:30px;
	}
	.howToUpload ol li{
		list-style: decimal;
	}
	.howToUpload ol li img{
		width:20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		//예외처리
    	$("#form1").submit(function(){

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
		<div class="howToUpload">
			<h3>이미지 업로드 사용법</h3>
			<ol>
				<li><img src="${pageContext.request.contextPath}/resources/images/uploadIcon.PNG"> 클릭</li>
				<li>업로드 탭 클릭</li>
				<li>파일 선택</li>
				<li>서버로 전송 클릭</li>
				<li>필요시 너비, 높이, 테두리 등 설정 후 확인</li>
			</ol>
		</div>
		<div class="centerMenu">
			<h1 class="boardTitle">&lt;공지사항 관리&gt;</h1>
			<form id="form1" method="post" action="adminNoticeUpdate">
				<div id="container">
					<input type="hidden" value="${pageMaker.cri.page}" name="page">
					<input type="hidden" value="${pageMaker}" name="pageMaker"> 
					<input type="hidden" value="${item.bno}" name="bno">
					<p>작성자: <input type="text" name="writer" value="관리자"></p>
					<br> 
					<div id="header">
						<span>제목:</span>
						<input id="title" type="text" name="title" value="${item.title}">
					</div>
					
					<textarea id="editor1" name="content">
					    ${item.content}
					</textarea>
					<script>
						CKEDITOR.replace('content',{filebrowserUploadUrl:"/admin/imgUpload",height:500});
					</script>
					<div class="btn">
						<input type="submit" value="저장">
						<a href="${pageContext.request.contextPath}/admin/adminNotice"><button type="button">뒤로가기</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>