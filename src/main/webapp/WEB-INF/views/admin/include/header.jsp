<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이핏S 관리자페이지</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	#headerDiv{
		width:100%;
		min-width:1024px;
		color:skyblue;
		background: #17161C;
	}
	#headerDiv #logo{
		width:300px;
		height:80px;
		color:white;
		line-height: 80px;
		margin-left: 30px;
		position:  relative;
	}
	#headerDiv #logo h2 {
	    font-size: 25px;
	    font-weight: bold;
	    letter-spacing: 3px;
	}
	#headerDiv>.gohome{
		position: absolute;
		right:50px;
		top:21px;
	}
	#headerDiv>.gohome>img{
		width:40px;
	}
	#headerDiv #headerMenu{
		width:100%;
		min-width:1024px;
		height:40px;
		background: #383A3F;
	}
	#headerDiv #headerMenu ul{
		width:980px;
		line-height: 38px;
		margin-left:30px;
	}
	#headerDiv #headerMenu>ul>li{
		list-style: none;
		width:130px;
		display:inline-block;
		text-align:center;
		border-right:1px solid gray;
		float:left;
	}
	#headerDiv #headerMenu>ul>li a{
		width:128px;
		color:white;
		font-weight:bold;
		text-decoration: none;
		display: inline-block;
		font-size:20px;
	}
	#headerDiv #headerMenu>ul>li a:hover{
		background: white;
		color:black;
	}
</style>
</head>
<script>
$(function(){
	
});
</script>
<body>
	<div id="headerDiv">
		<div id="logo">
			<h2>아이핏S 관리자</h2>
		</div>
		<a class="gohome" href="${pageContext.request.contextPath}/logout"><img src="${pageContext.request.contextPath}/resources/images/home2.png" alt="메인페이지 바로가기" id="home"></a>
		<div id="headerMenu"> 
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/" title="게시판 관리" id="boardCtr">게시판 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/member" title="회원 관리" id="memberCtr">회원 관리</a></li>
			</ul>
		</div>
	</div>
</body>
</html>