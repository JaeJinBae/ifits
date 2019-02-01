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
		border:1px solid lightgray;
	}
	.mid_nav_wrap > ul{
		width:100%;
		margin:0 auto;
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li{
		float:left;
		background: #fff;
		line-height:44px;
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
		width:100%;
		margin:0 auto;
	}
	.formWrap{
		width:100%;
		margin:0 auto;
		padding:60px 0;
	}
	.formWrap > h2{
		font-size: 20px;
		margin-bottom:20px;
	}
	.formDiv{
		width:100%;
		margin:0 auto;
		padding:20px 5px;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	.agreeInfoWrap{
		width:100%;
		text-align: left;
	}
	.warning{
		color:orange;
		margin-top:15px;
		font-size:16px;
		text-align: center;
	}
	.agreeInfoWrap > h2{
		font-size:18px;
		margin:15px 0 7px 0;
	}
	.txtWrap{
		width:99%;
		height:200px;
		border:1px solid lightgray;
		padding:5px;
		overflow: scroll;
	}
	input[type='checkbox']{
		margin:10px;
	}
	hr{
		margin:15px 0;
		margin-bottom:35px;
	}
	.formTitle{
		font-size:18px;
		margin:15px 0 7px 0;
		text-align: left;
	}
	.formDiv > form{
		width:100%;
	}
	.formDiv > form > table{
		width:100%;
		margin:0 auto;
		margin-top:20px;
	}
	.formDiv > form > table tr{
		display:block;
		border-bottom:1px solid lightgray;
	}
	.formDiv > form > table tr:first-child{
		border-top:1px solid lightgray;
	}
	.formDiv > form > table th{
		font-size:15px;
		padding:5px 0 5px 10px;
		text-align: left;
		background: #f5f8f9;
		width:96px;
	}
	.formDiv > form > table td:not(.idConfirmBtn){
		text-align: left;
		padding-left:15px;
	}
	.idConfirmBtn{
		padding:10px 0;
	}
	.idTxt{
		display:block;
	}
	.formDiv > form > table td > input{
		padding-left:3px;
		border-radius:5px;
		width:125px;
	} 
	.idConfirmBtn > input{
		border-radius:5px;
		padding: 0 3px;
		margin:0 7px;
		width:70px !important;
	}
	.submitDiv{
		width:100%;
		text-align: center;
		margin-top:10px;
	}
	.submitDiv > input[type='submit']{
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
		border:1px solid lightgray;
	}
	.mid_nav_wrap > ul{
		width:100%;
		margin:0 auto;
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li{
		float:left;
		background: #fff;
		line-height:59px;
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
	.content{
		width:100%;
		margin:0 auto;
	}
	.formWrap{
		width:100%;
		margin:0 auto;
		padding:60px 0;
	}
	.formWrap > h2{
		font-size: 23px;
		margin-bottom:20px;
	}
	.formDiv{
		width:100%;
		margin:0 auto;
		padding:20px 15px;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	.agreeInfoWrap{
		width:100%;
		text-align: left;
	}
	.warning{
		color:orange;
		margin-top:15px;
		font-size:16px;
		text-align: center;
	}
	.agreeInfoWrap > h2{
		font-size:23px;
		margin:15px 0 7px 0;
	}
	.txtWrap{
		width:99%;
		height:200px;
		border:1px solid lightgray;
		padding:5px;
		overflow: scroll;
	}
	input[type='checkbox']{
		margin:10px;
	}
	hr{
		margin:15px 0;
		margin-bottom:35px;
	}
	.formTitle{
		font-size:23px;
		margin:15px 0 7px 0;
		text-align: left;
	}
	.formDiv > form{
		width:100%;
	}
	.formDiv > form > table{
		width:95%;
		margin:0 auto;
		margin-top:20px;
	}
	.formDiv > form > table tr{
		display:block;
		border-bottom:1px solid lightgray;
	}
	.formDiv > form > table tr:first-child{
		border-top:1px solid lightgray;
	}
	.formDiv > form > table th{
		font-size:17px;
		padding:5px 0 5px 10px;
		text-align: left;
		background: #f5f8f9;
		width:110px;
	}
	.formDiv > form > table td:not(.idConfirmBtn){
		text-align: left;
		padding-left:15px;
	}
	.formDiv > form > table td > input{
		padding-left:3px;
		border-radius:5px;
		width:180px;
	} 
	.idConfirmBtn > input{
		border-radius:5px;
		padding: 0 3px;
		margin:0 7px;
		width:70px !important;
	}
	.submitDiv{
		width:100%;
		text-align: center;
		margin-top:10px;
	}
	.submitDiv > input[type='submit']{
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
		border:1px solid lightgray;
	}
	.mid_nav_wrap > ul{
		width:1024px;
		margin:0 auto;
		overflow:hidden;
	}
	.mid_nav_wrap > ul > li{
		float:left;
		background: #fff;
		line-height:59px;
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
	}
	.formWrap{
		width:780px;
		margin:0 auto;
		padding:60px 0;
	}
	.formWrap > h2{
		font-size: 23px;
		margin-bottom:20px;
	}
	.formDiv{
		width:100%;
		margin:0 auto;
		padding:20px 15px;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	.agreeInfoWrap{
		width:100%;
		text-align: left;
	}
	.warning{
		color:orange;
		margin-top:15px;
		font-size:16px;
		text-align: center;
	}
	.agreeInfoWrap > h2{
		font-size:23px;
		margin:15px 0 7px 0;
	}
	.txtWrap{
		width:99%;
		height:200px;
		border:1px solid lightgray;
		padding:5px;
		overflow: scroll;
	}
	input[type='checkbox']{
		margin:10px;
	}
	hr{
		margin:15px 0;
		margin-bottom:35px;
	}
	.formTitle{
		font-size:23px;
		margin:15px 0 7px 0;
		text-align: left;
	}
	.formDiv > form{
		width:100%;
	}
	.formDiv > form > table{
		width:95%;
		margin:0 auto;
		margin-top:20px;
	}
	.formDiv > form > table tr{
		display:block;
		border-bottom:1px solid lightgray;
	}
	.formDiv > form > table tr:first-child{
		border-top:1px solid lightgray;
	}
	.formDiv > form > table th{
		font-size:17px;
		padding:5px 0 5px 10px;
		text-align: left;
		background: #f5f8f9;
		width:110px;
	}
	.formDiv > form > table td:not(.idConfirmBtn){
		text-align: left;
		padding-left:15px;
	}
	.formDiv > form > table td > input{
		padding-left:3px;
		border-radius:5px;
		width:180px;
	} 
	.idConfirmBtn > input{
		border-radius:5px;
		padding: 0 3px;
		margin:0 7px;
		width:70px !important;
	}
	.submitDiv{
		width:100%;
		text-align: center;
		margin-top:10px;
	}
	.submitDiv > input[type='submit']{
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
	//아이디 정규표현식
    var idReg=/^[A-Za-z0-9+]{5,15}$/;
    
    //아이디 중복확인
    $(".idConfirmBtn > input[type='button']").click(function(){
    	var id_=$("input[name='id']").val();
    	
    	
    	console.log(idReg.test(id_));
    	
    	if(id_==""||id_==null){
    		alert("아이디를 입력해주세요.");
    		return false;
    	}else if(!idReg.test(id_)){
    		alert("아이디가 조건에 맞지 않습니다.");
    		return false;
    	}else{
    		idCheck(id_);
    	}
    });
    
    var idChk=0;
    
    function idCheck(id){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/idCheck/"+id,
    		type:"post",
    		dataType:"text",
    		success:function(json){
    			console.log(json);
    			if(json=="ok"){
    				alert("사용가능한 아이디 입니다.");
    				idChk=1;
    			}else{
    				alert("이미 존재하는 아이디입니다.");
    				idChk=0;
    			}
    		}
    	})
    }
    
	
	$("#formTag").submit(function(){
		var chkBox1=$("input[type='checkbox']").eq(0).prop("checked");
		var chkBox2=$("input[type='checkbox']").eq(1).prop("checked");
		var name=$("input[name='name']").val();
		var id=$("input[name='id']").val();
		var pw=$("input[name='pw']").val(); 
		var pwConfirm=$("input[name='pwConfirm']").val();
		var mail=$("input[name='mail']").val();
		
		name=name.toLowerCase();
		id=id.toLowerCase();
		pw=pw.toLowerCase();
		pwConfirm=pwConfirm.toLowerCase();
		mail=mail.toLowerCase();
		
		if(chkBox1==false || chkBox2==false){
			alert("회원가입약관 및 개인정보처리방침안내의 내용에 동의하지 않으면  회원가입을 할 수 없습니다.");
			return false;
		}
		else if(name == ""){
			alert("이름을 입력하세요.");
			return false;
		}else if(id==""){
			alert("아이디를 입력해주세요.");
			return false;
		}else if(pw==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(pw != pwConfirm || pwConfirm ==""){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else if(mail == ""){
			alert("이메일을 바르게 입력해주세요.");
			return false;
		}else if(idChk == 0){
			alert("아이디 중복확인을 해주세요.");
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
			<img src="${pageContext.request.contextPath}/resources/images/sub_membership_test2.jpg">
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
					<p>회원가입</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
							<li><a href="${pageContext.request.contextPath}/userFindInfo">회원정보찾기</a></li>
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
					<h2>서비스를 이용하기 위해서는 회원가입이 필요합니다.</h2>
					<div class="formDiv">
						<div class="agreeInfoWrap">
							<p class="warning">※회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.※</p>
							<h2>회원가입약관</h2>
							<div class="txtWrap">
								<jsp:include page="signInText1.jsp"></jsp:include>
							</div>
							<input type="checkbox">회원가입약관의 내용에 동의합니다.
							<hr>
							
							<h2>개인정보처리방침</h2>
							<div class="txtWrap">
								<jsp:include page="signInText2.jsp"></jsp:include>
							</div>
							<input type="checkbox">개인정보처리방침의 내용에 동의합니다.
							<hr>
						</div>
						<h2 class="formTitle">회원정보입력</h2>
						<form id="formTag" method="post" action="userSignIn">
							<table>
							<tr>
								<th>이름</th>
								<td colspan='2'><input type="text" name="name" onkeyup="this.value=this.value.toLowerCase();"></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" onkeyup="this.value=this.value.toLowerCase();"></td>
								<td class="idConfirmBtn"><input type="button" value="중복확인"><span class="idTxt">영문, 숫자만 가능. 최소 5자리 이상 입력하세요.</span></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan='2'><input type="password" name="pw" onkeyup="this.value=this.value.toLowerCase();"></td>
							</tr>
							<tr>
								<th>비밀번호확인</th>
								<td colspan='2'><input type="password" name="pwConfirm" onkeyup="this.value=this.value.toLowerCase();"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan='2'><input type="text" name="mail" onkeyup="this.value=this.value.toLowerCase();"></td>
							</tr>
						</table>
						<p class="warning">
							※비밀번호 분실 시 입력한 이메일로 정보가 발송되오니 정확하게 입력해주세요.※
						</p>
						<div class="submitDiv">
							<input type="submit" value="회원가입">
						</div>
						</form>
					</div><!-- formDiv end -->
				</div><!-- loginFormWrap end -->
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>