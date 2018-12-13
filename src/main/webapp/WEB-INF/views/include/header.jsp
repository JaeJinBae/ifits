<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<style>
@media only screen and (min-width:320px) and (max-width:767px){
	
}
@media only screen and (min-width:768px) and (max-width:1024px){
	.headerWrap{
		width:100%;
		background: #fff; 
		padding-bottom:10px;
		height:120px;
	}
	.topMenu{
		width: 100%;
		margin: 0 auto;
		text-align: right;
		padding:10px 20px;
		padding-bottom:0;
	}
	.topMenu > a{
		font-size:14px;
		margin-left:10px;
	}
	.mainMenu{
		width:100%;
		margin: 0 auto;
		overflow: hidden;
		padding:0 7px;
	}
	.mainMenu > a{
		float:left;
		width:180px;
	}
	.logo{
		width:100%;
	}
	.mainUlWrap{
		float:right;
	}
	.mainUlWrap > ul{
		width:100%;
		overflow:hidden;
	}
	.mainUlWrap > ul > li{
		/* display:inline-block; */
		float:left;
		margin:0 8px; 
		line-height: 80px;
	}
	.mainUlWrap > ul > li > a{
		font-size:19px;
		font-weight:600;
	}
	.mainUlWrap > ul > li:hover > a{
		text-decoration: none;
		color: #3075ba; /*마우스오버시 자연스럽게*/
		transition-duration: 300ms;
		transition-property: color, border-color, background-color;
		transition-timing-function: ease;
	}
	.mainUlWrap > ul > li:last-child:hover > .subUlWrap{
		display:block; 
		transition-duration: 300ms;
		transition-property: display;
		transition-timing-function: ease;
	} 
	.subUlWrap{ 
		display:none;
		background: #fff;
		opacity: 0.8;
		margin-top:10px;
	}
	.subUlWrap > ul > li {
		text-align: center;
		line-height: 37px;
	}
	.subUlWrap > ul > li > a {
		font-size:17px;
	}
}
@media only screen and (min-width:1025px){
	.headerWrap{
		width:100%;
		background: #fff; 
		padding-bottom:10px;
		height:136px;
	}
	.topMenu{
		width: 1100px;
		margin: 0 auto;
		text-align: right;
		padding-top:10px;
	}
	.topMenu > a{
		font-size:14px;
		margin-left:10px;
	}
	.mainMenu{
		width:1100px;
		margin: 0 auto;
		overflow: hidden;
	}
	.logo{
		float:left;
		width:240px;
	}
	.mainUlWrap{
		float:right;
	}
	.mainUlWrap > ul{
		width:100%;
		overflow:hidden;
	}
	.mainUlWrap > ul > li{
		/* display:inline-block; */
		float:left;
		margin:0 15px; 
		line-height: 97px;
	}
	.mainUlWrap > ul > li > a{
		font-size:22px;
		font-weight:600;
	}
	.mainUlWrap > ul > li:hover > a{
		text-decoration: none;
		color: #3075ba; /*마우스오버시 자연스럽게*/
		transition-duration: 300ms;
		transition-property: color, border-color, background-color;
		transition-timing-function: ease;
	}
	.mainUlWrap > ul > li:last-child:hover > .subUlWrap{
		display:block; 
		transition-duration: 300ms;
		transition-property: display;
		transition-timing-function: ease;
	} 
	.subUlWrap{ 
		display:none;
		background: #fff;
		opacity: 0.8;
		margin-top:10px;
	}
	.subUlWrap > ul > li {
		text-align: center;
		line-height: 37px;
	}
	.subUlWrap > ul > li > a {
		font-size:17px;
	}
	
}
</style>
<script>

</script>
<div class="headerWrap">
	<div class="topMenu">
		<c:if test="${sessionScope.id != null}">
			<a href="${pageContext.request.contextPath}/userInfo">${sessionScope.id}</a>
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</c:if>
		<c:if test="${sessionScope.id == null}">
			<a href="${pageContext.request.contextPath}/login">로그인</a>
			<a href="${pageContext.request.contextPath}/userSignIn">회원가입</a>
		</c:if>
	</div>
	<div class="mainMenu">
		<a href="${pageContext.request.contextPath}/"><img class="logo" src="${pageContext.request.contextPath}/resources/images/logo_test3.png"></a>
		<div class="mainUlWrap">
			<ul>
				<li><a href="${pageContext.request.contextPath}/ourbrand">Our brand</a></li>
				<li><a href="${pageContext.request.contextPath}/product">Product</a></li>
				<li><a href="${pageContext.request.contextPath}/technique">Technique</a></li>
				<li><a href="${pageContext.request.contextPath}/information">Information</a></li>
				<li>
					<a href="${pageContext.request.contextPath}/notice">Community</a>
					<div class="subUlWrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
							<li><a href="${pageContext.request.contextPath}/review">Review</a></li>
							<li><a href="${pageContext.request.contextPath}/partnership">제휴</a></li>
						</ul>
					</div>
				</li>
				<%-- <li>
					<img src="${pageContext.request.contextPath}/resources/images/info_icon.png">
				</li> --%>
			</ul>
		</div>
	</div>
</div>