<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유한통증의학과 관리자페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css?ver=2">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	*{ 
		margin:0;
		padding:0;
	}
	a{
		display:inline-block;
		color:black;
		text-decoration: none;
	}
	#headerDiv #headerMenu #memberCtr{
		background: white;
		color:black;
	}
	.contentWrap{
		width:100%;
		min-width:1280px;
		/* height:700px; */
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
	
	/* 공지사항 */
	.tbl_board{
		width:90%;
		max-width:860px;
		height:700px;
		margin:0 auto;
		padding-top:30px;
		position:relative;
	}
	.tbl_board table{
		width:100%;
		margin:0 auto;
		border-collapse: collapse; 
	}
	.tbl_board table tr{
		border-bottom:1px solid lightgray;
	}
	.tbl_board table tr:first-child{
		border-top:1px solid lightgray;
	}
	.tbl_board table tr th{
		background: #e3e3e3;
	}
	.tbl_board table td{
		padding:8px 13px;
		font-size:15px;
	}
	.tbl_board table td > input[name='name'], .tbl_board table td > input[name='id'], .tbl_board table td > input[name='regdate']{
		background:#f1f1f1;
	}
	.btnDiv{
		margin-top:20px;
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		//게시판 검색
        $("#searchBtn").click(function(){
        	var s=$("select[name='searchType']").val();
    		var searchType = encodeURIComponent(s);
    		var k=$("input[name='keyword']").val();
    		var keyword = encodeURIComponent(k);
    		location.href="adminComment${pageMaker.makeQuery(1)}&searchType="+searchType+"&keyword="+keyword;
    	});
		
		$(".updateBtn").click(function(){
			var id=$("input[name='id']").val();
			var pw=$("input[name='pw']").val();
			var mail=$("input[name='mail']").val();
			if(pw==""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}else if(mail==""){
				alert("메일을 입력해주세요.");
				return false;
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/memberUpdate/"+id+"/"+pw+"/"+mail,
					type:"post",
					dataType:"text",
					success:function(json){
						console.log(json);
						
						if(json =="ok"){
							alert("수정되었습니다.");
							location.href="${pageContext.request.contextPath}/admin/member";
						}
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div class="contentWrap">
		<div class="leftMenu">
			<h2>회원 리스트</h2>
			<ul> 
				<li> <a href="${pageContext.request.contextPath}/admin/member"> 회원관리</a></li>
			</ul>
		</div>
		<div class="centerMenu">
			<h1 class="boardTitle">&lt;회원 관리&gt;</h1>
			<div class="tbl_board">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value="${vo.name}" readonly></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" value="${vo.id}" readonly></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="pw" value="${vo.pw}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="mail" value="${vo.mail}"></td>
					</tr>
					<tr>
						<th>가입일</th>
						<td><input type="text" name="regdate" value="<fmt:formatDate type='date' value='${vo.regdate}'/>" readonly></td>
					</tr>
				</table>
				<div class="btnDiv">
					<button class="updateBtn">수정</button>
					<a href="${pageContext.request.contextPath}/admin/member${pageMaker.makeSearch(pageMaker.cri.page)}"><input class="listBtn" type="button" value="목록"></a>
				</div>
			</div><!-- tbl_board -->
		</div>
	</div>
</body>
</html>