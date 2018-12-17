<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버쉽 | 아이핏에스</title>
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
		font-size:16px;
		font-weight:600;
		border-right:1px solid lightgray; 
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li:last-child{
		width:145px;
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
	.contentWrap{
		width:100%;
		padding:0 15px;
	}
	.content{
		width:100;
		margin:0 auto;
		padding:60px 0;
	}
	.formWrap{
		width:100%;
		margin:0 auto;
		text-align: center;
	}
	.formWrap > h2{
		font-size: 18px;
		margin-bottom:20px;
		letter-spacing: -1px;
	}
	.formDiv{
		width:100%;
		margin:0 auto;
		padding:20px 0;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	.formDiv > table{
		width:50%;
		margin:0 auto;
	}
	.formDiv > table th{
		font-size:15px;
		text-align: left;
		width:100px;
	}
	.formDiv > table td{
		width:175px;
	}
	.formDiv > table td > input[name='name'], .formDiv > table td > input[name='id']{
		background: #F3F3F3;
	}
	.formDiv > table td > input{
		padding-left:3px;
		border-radius:5px;
		width:100%;
	}
	.warning{
		color: blue;
		margin-top:15px;
	}
	.submitDiv{
		width:100%;
		text-align: center;
		margin-top:10px;
	}
	.submitDiv > button{
		background: #5f5f5f;
		color:#fff;
		border:1px solid lightgray;
		border-radius: 5px;
		padding:3px 10px;
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
	.contentWrap{
		width:100%;
		
	}
	.content{
		width:100;
		margin:0 auto;
		padding:60px 0;
	}
	.formWrap{
		width:580px;
		margin:0 auto;
		text-align: center;
	}
	.formWrap > h2{
		font-size: 23px;
		margin-bottom:20px;
	}
	.formDiv{
		width:100%;
		margin:0 auto;
		padding:20px 0;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	.formDiv > table{
		width:50%;
		margin:0 auto;
	}
	.formDiv > table th{
		font-size:15px;
		text-align: left;
		width:100px;
	}
	.formDiv > table td{
		width:175px;
	}
	.formDiv > table td > input[name='name'], .formDiv > table td > input[name='id']{
		background: #F3F3F3;
	}
	.formDiv > table td > input{
		padding-left:3px;
		border-radius:5px;
		width:100%;
	}
	.warning{
		color: blue;
		margin-top:15px;
	}
	.submitDiv{
		width:100%;
		text-align: center;
		margin-top:10px;
	}
	.submitDiv > button{
		background: #5f5f5f;
		color:#fff;
		border:1px solid lightgray;
		border-radius: 5px;
		padding:3px 10px;
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
	.contentWrap{
		
	}
	.content{
		width:1024px;
		margin:0 auto;
		padding:60px 0;
	}
	.formWrap{
		width:580px;
		margin:0 auto;
		text-align: center;
	}
	.formWrap > h2{
		font-size: 23px;
		margin-bottom:20px;
	}
	.formDiv{
		width:100%;
		margin:0 auto;
		padding:20px 0;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	.formDiv > table{
		width:50%;
		margin:0 auto;
	}
	.formDiv > table th{
		font-size:15px;
		text-align: left;
		width:100px;
	}
	.formDiv > table td{
		width:175px;
	}
	.formDiv > table td > input[name='name'], .formDiv > table td > input[name='id']{
		background: #F3F3F3;
	}
	.formDiv > table td > input{
		padding-left:3px;
		border-radius:5px;
		width:100%;
	}
	.warning{
		color: blue;
		margin-top:15px;
	}
	.submitDiv{
		width:100%;
		text-align: center;
		margin-top:10px;
	}
	.submitDiv > button{
		background: #5f5f5f;
		color:#fff;
		border:1px solid lightgray;
		border-radius: 5px;
		padding:3px 10px;
		font-size:15px;
	}
	
	footer{ 
		width:100%;
	}
}
</style>
<script>
$(function(){   
  //id, pw check
    function userUpdate(id, pw, mail){
		if(pw==""){
			pw="no";
		}
		/* alert("아이디: "+id+", 비번: "+pw+", 메일: "+mail); */
		$.ajax({
			url:"${pageContext.request.contextPath}/userUpdate/"+id+"/"+pw+"/"+mail,
			type:"post",
			dataType:"text",
			success:function(json){
				console.log(json);
				
				if(json =="ok"){
					alert("정보가 변경되었습니다."); 
					location.href="${pageContext.request.contextPath}/userInfo";
				}
			}
		});
	}
	
	$(".submitDiv > button").eq(0).click(function(){
		var id=$("input[name='id']").val();
		var pw=$("input[name='pw']").eq(0).val(); 
		var pwConfirm=$("input[name='pw']").eq(1).val();
		var mail=$("input[name='mail']").val();
		
		if(pw != pwConfirm){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else if(mail == ""){
			alert("이메일을 바르게 입력해주세요.");
			return false;
		}else{
			userUpdate(id, pw, mail);
		}
	});
	
	$(".submitDiv > button").eq(1).click(function(){
		var id=$("input[name='id']").val();
		var delConfirm = confirm("회원탈퇴를 하시겠습니까?");
		if(delConfirm==true){
			location.href="${pageContext.request.contextPath}/delUser/"+id;
		}else{
			return false;
		}
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
			<img src="${pageContext.request.contextPath}/resources/images/sub_membership_test1.jpg">
		</div>
		<div class="mid_nav_wrap">
			<ul>
				<li class="mid_nav_first_li"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/homeBtnImg.png"></a></li>
				<li>
					<p>Membership</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/ourbrand">Our Brand</a></li>
							<li><a href="${pageContext.request.contextPath}/product">Product</a></li>
							<li><a href="${pageContext.request.contextPath}/technique">Technique</a></li>
							<li><a href="${pageContext.request.contextPath}/information">Information</a></li>
							<li><a href="${pageContext.request.contextPath}/notice">Community</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>회원정보</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/agreement">이용약관</a></li>
							<li><a href="${pageContext.request.contextPath}/privacyPolicy">개인정보취급방침</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="contentWrap">
			<div class="content">
				<div class="formWrap"> 
				<h2>'${vo.name}'님의 정보를 확인 및 수정할 수 있습니다.</h2>
				<div class="formDiv">
					<table>
						<tr>
							<th>- 이름</th>
							<td><input type="text" name="name" value="${vo.name}" readonly></td>
						</tr>
						<tr>
							<th>- 아이디</th>
							<td><input type="text" name="id" value="${vo.id}" readonly></td>
						</tr>
						<tr>
							<th>- 비밀번호</th>
							<td><input type="password" name="pw"></td>
						</tr>
						<tr>
							<th>- 비밀번호확인</th>
							<td><input type="password" name="pw"></td>
						</tr>
						<tr>
							<th>- 이메일</th>
							<td><input type="text" name="mail" value="${vo.mail}"></td>
						</tr>
					</table>
					<p class="warning">
						※비밀번호 분실 시 입력한 이메일로 정보가 발송되오니 정확하게 입력해주세요.※
					</p>
				</div>
				<div class="submitDiv">
					<!-- <input type="submit" value="로그인"> -->
					<button>저장</button>
					<button>회원탈퇴</button>
				</div>
			</div><!-- formWrap end -->
			</div><!-- content end -->
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>