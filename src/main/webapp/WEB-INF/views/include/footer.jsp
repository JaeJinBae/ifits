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
	}
}
@media only screen and (min-width:768px) and (max-width:1023px){
	.footerWrap{
		width:100%;
	}
}
@media only screen and (min-width:1024px){
	.footerWrap{
		width:100%;
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
		height:188px;
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
		<a href="#none">Company</a>
		<a href="#none">Agreement</a>
		<a href="#none">Privacy policy</a>
		<a href="#none">Product</a>
		<a href="#none">Technique</a>
	</div>
	<div class="footer_mid">
		<div class="footer_mid_1">
			<h4>Bank Info</h4>
			<p>우리은행 1006-801-489176</p>
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
			<p><span class="addr_title">주소 :&nbsp;&nbsp;</span><span class="addr_txt">대구광역시 북구 구암로 51<br>(관음동, 청년 ICT창업성장센터)</span></p>
		</div>
	</div>
	<div class="footer_bottom">
		<p>Copyright ⓒ2018 <span class="bold">아이핏S</span>. All rights reserved</p>
	</div>
</div>