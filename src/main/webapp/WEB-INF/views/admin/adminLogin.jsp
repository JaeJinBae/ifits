<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 | 아이핏S</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
	.formWrap{
		width:600px;
		margin:0 auto;
		margin-top:300px;
		border:1px solid black;
		border-radius:2px;
		position: relative;
	}
	.formWrap>h2{
		position: absolute;
		top:-55px;
	}
	.formDiv table{
		width:315px;
		margin: 20px auto;
		border-collapse: collapse;
	}
	table tr td:first-child{
		width:70px;
	}
	table tr td input{
		width:160px;
	}
	table tr td button{
		height:44px;
		background:#5f5f5f;
		border:0;
		border-radius: 5px;
		color:white;
		font-weight: 600;
		font-size:17px;
	}
	.loginNotice{
		border-top:1px solid black;
		padding:0 10px;
	}
	.loginNotice>p{
		font-size:14px;
		line-height: 7px;
	}
	.goMainBtn{
		width:130px;
		height:30px;
		display:block;
		margin: 30px auto;
		margin-bottom:20px;
	}
	.goMainBtn>button{
		background: #5f5f5f;
		border:0;
		border-radius: 5px;
		color:white;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		function idpwCheck(){
			var id=$("input[name='id']").val();
			var pw=$("input[name='pw']").val();
			if(id==""||pw==""){
				alert("아이디와 비밀번호를 모두 입력하세요.");
				return;
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/loginCheck/"+id+"/"+pw,
				type:"post",
				dataType:"text",
				success:function(json){
					console.log(json);
					
					if(json!="ok"){
						alert("아이디 또는 비밀번호를 다시 확인하세요.");
					}else{
						location.href="${pageContext.request.contextPath}/admin/";
					}
				}
			});
		}
		
		$(".loginBtn>button").click(function(){
			var id=$("input[name='id']").val();
			var pw=$("input[name='pw']").val();
			if(id==null||id==""||pw==null||pw==""){
				alert("아이디와 비밀번호를 다시 확인하세요.");
			}else{
				idpwCheck();
			}
		});
		
		$("input[name='pw']").keydown(function(){
			if(event.keyCode==13){
				idpwCheck();
			}
		});
	});
</script>
</head>
<body>
	<div class="formWrap">
		<h2>관리자 로그인</h2>
		<div class="formDiv">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
					<td class="loginBtn" rowspan="2"><button>로그인</button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
			</table>
		</div>
		<div class="loginNotice">
			<h3>관리자 로그인 안내</h3>
			<p>* 관리자 아이디 및 비밀번호 관리에 유의해 주십시오.</p>
			<p>* 관리자 아이디 및 비밀번호가 기억나지 않을 때는 제작 업체에 문의해 주십시오.</p>
		</div>
		<a  class="goMainBtn" href="${pageContext.request.contextPath}/"><button>메인으로 돌아가기</button></a>
	</div>
</body>
</html>