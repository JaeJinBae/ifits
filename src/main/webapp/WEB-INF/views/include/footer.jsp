<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<style>
@media only screen and (min-width:320px) and (max-width:767px){
	.footerWrap{
		width:100%;
		background: #fafafa;
		padding-top:10px;
	}
	.footer_top{
		width:100%;
		margin:15px 0;
		text-align: center;
	}
	.footer_top > a{
		display:inline-block;
		/* width: 125px; */
		text-align:center;
		font-size:14px;
		font-family: sans-serif;
		margin:0 2px;
	}
	.footer_mid{
		width:100%;
		margin:15px auto;
		margin-top:10px;
		overflow:hidden;
	}
	.footer_mid > div:not(.footer_mid_3){
		float:left;
		width:55%;
		height:150px;
		padding-left:20px;
	}
	.footer_mid > div > h4{
		margin:15px 0 15px 0;
		font-size:16px;
		
	}
	.footer_mid > div > p{
		font-size:14px;
		margin-bottom:5px; 
	}
	.footer_mid_1{
		border-right:1px solid lightgray;
		width: 43% !important;
	}
	.footer_mid_1 > p{
		font-size:15px !important; 
		margin:10px 0 !important;
	}
	.bank_name{
		display:block;
	}
	.footer_mid_2 > #tel{
		font-size:16px;
		font-weight:600;
	}
	.footer_mid_3{
		width:100%;
		/* clear:both; */
		overflow:hidden;
		padding: 0 20px;
	}
	.footer_mid_3 > p{
		float:left;
	}
	.footer_mid_3 > .footer_addr{
		overflow:hidden;
	}
	.footer_mid_3 > .footer_addr > span {
		float:left;
	}
	.addr_txt{
		width:180px;
	}
	.footer_mid_3 > p{
		margin-right:20px; 
	}
	.footer_mid_3 > p:last-child{
		display:none;
	}
	.footer_bottom{
		width:100%;
		text-align: center;
		margin:20px 0 9px 0;
	}
	.footer_bottom > p{
		font-size:14px;
	}
}
@media only screen and (min-width:768px) and (max-width:1024px){
	.footerWrap{
		width:100%;
		background: #fafafa;
		padding-top:10px;
	}
	.footer_top{
		width:100%;
		margin:25px 0;
		text-align: center;
	}
	.footer_top > a{
		display:inline-block;
		width: 125px;
		text-align:center;
		font-size:16px;
		font-family: sans-serif;
	}
	.footer_mid{
		width:100%;
		margin:15px auto;
		margin-top:10px;
		overflow:hidden;
	}
	.footer_mid > div{
		float:left;
		width:33%;
		height:218px;
		border-right:1px solid lightgray;
		padding-left:20px;
	}
	.footer_mid > div > h4{
		margin:15px 0 25px 0;
		font-size:20px;
		
	}
	.footer_mid > div > p{
		font-size:14px;
		margin-bottom:8px; 
	}
	.footer_mid_1{
		border-left:1px solid lightgray;
	}
	.footer_mid_1 > p{
		font-size:17px !important; 
		margin:18px 0 !important;
	}
	.footer_mid_2 > #tel{
		font-size:18px;
		font-weight:600;
	}
	.footer_mid_3 > p{
		overflow:hidden;
	}
	.footer_mid_3 > p > span {
		float:left;
	}
	.addr_txt{
		width:180px;
	}
	.footer_bottom{
		width:100%;
		text-align: center;
		margin:20px 0 9px 0;
	}
	.footer_bottom > p{
		font-size:14px;
	}
}
@media only screen and (min-width:1025px){
	.footerWrap{
		width:100%;
		background: #fafafa;
		padding-top:10px;
	}
	.footer_top{
		width:100%;
		margin:25px 0;
		text-align: center;
	}
	.footer_top > a{
		display:inline-block;
		width: 125px;
		text-align:center;
		font-size:16px;
		font-family: sans-serif;
	}
	/* .footer_top > a:hover{
		font-weight:600;
	} */
	.footer_mid{
		width:1100px;
		margin:15px auto;
		overflow:hidden;
	}
	.footer_mid > div{
		float:left;
		width:33%;
		height:208px;
		border-right:1px solid lightgray;
		padding-left:35px;
	}
	.footer_mid > div:last-child{
		/* border:0; */
	}
	.footer_mid > div > h4{
		margin:15px 0 25px 0;
		
	}
	.footer_mid > div > p{
		font-size:15px;
		margin-bottom:8px; 
	}
	.footer_mid_1{
		border-left:1px solid lightgray;
	}
	.footer_mid_1 > p{
		font-size:17px !important;
		margin:18px 0 !important;
	}
	.footer_mid_2 > #tel{
		font-size:20px;
		font-weight:600;
	}
	.footer_mid_3 > p{
		overflow:hidden;
	}
	.footer_mid_3 > p > span {
		float:left;
	}
	.addr_txt{
		width:285px;
	}
	.footer_bottom{
		width:100%;
		text-align: center;
		margin:30px 0 9px 0;
	}
	.footer_bottom > p{
		font-size:14px;
	}
	
}
</style>
<script>

</script>
<div class="footerWrap">
	<div class="footer_top">
		<a href="${pageContext.request.contextPath}/ourbrand">Company</a>
		<a href="${pageContext.request.contextPath}/agreement">Agreement</a>
		<a href="${pageContext.request.contextPath}/privacyPolicy">Privacy policy</a>
		<a href="${pageContext.request.contextPath}/product">Product</a>
		<a href="${pageContext.request.contextPath}/technique">Technique</a>
	</div>
	<div class="footer_mid">
		<div class="footer_mid_1">
			<h4>Bank Info</h4>
			<p><span class="bank_name">우리은행</span> <span class="bank_info">1006-801-489176</span></p>
			<p>예금주: 아이핏S</p>
		</div>
		<div class="footer_mid_2"> 
			<h4>CS Center</h4>
			<p id="tel">Tel. 010 - 8850 - 2744</p>
			<p>E-mail. skvudqja@nate.com</p>
			<p>평일 AM 10:00 ~ PM 05:00</p>
			<p>점심 AM 12:30 ~ PM 02:00</p>
		</div>
		<div class="footer_mid_3">
			<h4>Company</h4>
			<p>상호 : 아이핏S</p>
			<p>대표 : 김재등</p>
			<p>사업자등록번호 : 348-31-00468</p>
			<p class="footer_addr"><span class="addr_title">주소 :&nbsp;&nbsp;</span><span class="addr_txt">대구광역시 북구 구암로 51<br>(관음동, 청년 ICT창업성장센터)</span></p>
			<p><a href="${pageContext.request.contextPath}/admin/adminLogin">[관리자 모드]</a></p>
		</div>
	</div>
	<div class="footer_bottom">
		<p>Copyright ⓒ2018 <span class="bold">아이핏S</span>. All rights reserved</p>
	</div>
</div>