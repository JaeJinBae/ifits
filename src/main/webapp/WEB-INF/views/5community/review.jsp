<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review | 아이핏에스</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media only screen and (min-width:320px) and (max-width:767px){
	.pc_ver{
		display:none;
	}
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
		/* width:155px; */
		font-size:16px;
		font-weight:600;
		border-right:1px solid lightgray; 
		overflow:hidden;
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
	/* content */
	.contentWrap{
		width:100%;
		padding:0 15px;
	}
	.content_title{
		width:100%;
		margin:10px auto;
		padding:15px;
		padding-left:5px;
		border-bottom:2px solid #3e3e3e;
	}
	.content_title > h2{
		font-size:20px;
	}
	.content{
		width:100%;
		margin:0 auto;
	}
	.tableWrap{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table tr:first-child{
		border-bottom:2px solid gray;
	}
	.tableWrap > table th{
		font-size:15px;
		font-weight:600;
		padding:12px 2px;
	}
	.tableWrap > table tr:first-child th:first-child{
		width:40px;
	}
	.tableWrap > table tr:first-child th:nth-child(2){
		width:100%;
	}
	.tableWrap > table tr:first-child th:nth-child(3){
		width:60px;
	}
	.tableWrap > table tr:first-child th:nth-child(4){
		width:40px;
	}
	.tableWrap > table tr:first-child th:nth-child(5){
		width:75px;
	}
	.tableWrap > table tr:first-child th:last-child{
		width:40px;
	}
	.tableWrap > table th:last-child, .tableWrap > table td:last-child{
		display:none;
	}
	.tableWrap > table td{
		text-align: center;
		font-size:14px;
		padding:10px 0;
		border-bottom:1px solid #e3e3e3;
		letter-spacing: -1px;
	}
	.tableWrap > table tr td:nth-child(2){
		text-align: left;
		padding-left:3px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	.title>img{
		width:16px;
	}
	.writeBtn{
		width:100%;
		text-align: right;
		margin-top:20px;
		padding:0 30px;
	}
	.writeBtn > a{
		display:inline-block;
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
		text-align: center;
		line-height: 24px;
	}
	.page{
		clear:both;
		width:100%; 
		margin:50px auto;
		margin-bottom:50px;
	}
	.page > ul{
		text-align: center;
	}
	.page ul li{
		width:25px;
		height:30px;
		margin:0 auto;
		list-style: none;
		display: inline-block;
		text-align:center;
		border:1px solid #e9e9e9;
	}
	.active1{
		border:2px solid skyblue !important;
	}
	.active2{
		font-weight: bold;
	}
	.page ul li a{
		font-size:1.1em;
		line-height: 30px;
	}
	#searchBtn{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.searchWrap{
		text-align: center;
		margin-bottom:50px;
	}
	
	footer{ 
		width:100%;
	}
}
@media only screen and (min-width:768px) and (max-width:1024px){
	.m_ver{
		display:none;
	}
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
	.content_title{
		width:100%;
		margin:20px auto;
		padding:30px;
		padding-left:5px;
		border-bottom:2px solid #3e3e3e;
	}
	.content{
		width:100%;
		margin:0 auto;
	}
	.tableWrap{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table{
		width:98%;
		margin:0 auto;
	}
	.tableWrap > table tr:first-child{
		border-bottom:2px solid gray;
	}
	.tableWrap > table th{
		font-size:17px;
		font-weight:600;
		padding:12px 5px;
	}
	.tableWrap > table tr:first-child th:first-child{
		width:53px;
	}
	.tableWrap > table tr:first-child th:nth-child(2){
		width:100%;
	}
	.tableWrap > table tr:first-child th:nth-child(3){
		width:100px;
	}
	.tableWrap > table tr:first-child th:nth-child(4){
		width:50px;
	}
	.tableWrap > table tr:first-child th:nth-child(5){
		width:100px;
	}
	.tableWrap > table tr:first-child th:last-child{
		width:53px;
	}
	.tableWrap > table td{
		text-align: center;
		font-size:16px;
		padding:10px 5px;
		border-bottom:1px solid #e3e3e3;
	}
	.tableWrap > table tr td:nth-child(2){
		text-align: left;
		padding-left:10px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	.title>img{
		width:16px;
	}
	.writeBtn{
		width:100%;
		text-align: right;
		margin-top:20px;
		padding:0 30px;
	}
	.writeBtn > a{
		display:inline-block;
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
		text-align: center;
		line-height: 24px;
	}
	.page{
		clear:both;
		width:626px; 
		margin:70px auto;
		margin-bottom:50px;
	}
	.page > ul{
		text-align: center;
	}
	.page ul li{
		width:45px;
		height:40px;
		margin:0 auto;
		list-style: none;
		display: inline-block;
		text-align:center;
		border:1px solid #e9e9e9;
	}
	.active1{
		border:2px solid skyblue !important;
	}
	.active2{
		font-weight: bold;
	}
	.page ul li a{
		font-size:1.1em;
		line-height: 40px;
	}
	#searchBtn{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.searchWrap{
		text-align: center;
		margin-bottom:50px;
	}
	
	footer{ 
		width:100%;
	}
}
@media only screen and (min-width:1025px){
	.m_ver{
		display:none;
	}
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
	.mid_nav_wrap > ul > li:last-child{
		border-right:1px solid lightgray;
	}
	.mid_nav_wrap > ul > li:not(.mid_nav_first_li){
		width:210px;
		font-size:20px;
		font-weight:600;
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
	.sMenu1 > ul > li{
		border-right:1px solid lightgray;
	}
	/* content */
	.contentWrap{
		width:100%;
	}
	.content_title{
		width:1024px;
		margin:20px auto;
		padding:30px;
		padding-left:5px;
		border-bottom:2px solid #3e3e3e;
	}
	.content{
		width:1024px;
		margin:0 auto;
	}
	.tableWrap{
		width:100%;
		margin:0 auto;
	}
	.tableWrap > table{
		width:98%;
		margin:0 auto;
	}
	.tableWrap > table tr:first-child{
		border-bottom:2px solid gray;
	}
	.tableWrap > table th{
		font-size:17px;
		font-weight:600;
		padding:12px 5px;
	}
	.tableWrap > table tr:first-child th:first-child{
		width:53px;
	}
	.tableWrap > table tr:first-child th:nth-child(2){
		width:100%;
	}
	.tableWrap > table tr:first-child th:nth-child(3){
		width:100px;
	}
	.tableWrap > table tr:first-child th:nth-child(4){
		width:50px;
	}
	.tableWrap > table tr:first-child th:nth-child(5){
		width:100px;
	}
	.tableWrap > table tr:first-child th:last-child{
		width:53px;
	}
	.tableWrap > table td{
		text-align: center;
		font-size:16px;
		padding:10px 5px;
		border-bottom:1px solid #e3e3e3;
	}
	.tableWrap > table tr td:nth-child(2){
		text-align: left;
		padding-left:10px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
	.title>img{
		width:16px;
	}
	.writeBtn{
		width:100%;
		text-align: right;
		margin-top:20px;
		padding:0 30px;
	}
	.writeBtn > a{
		display:inline-block;
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
		text-align: center;
		line-height: 24px;
	}
	.page{
		clear:both;
		width:626px; 
		margin:70px auto;
		margin-bottom:50px;
	}
	.page > ul{
		text-align: center;
	}
	.page ul li{
		width:45px;
		height:40px;
		margin:0 auto;
		list-style: none;
		display: inline-block;
		text-align:center;
		border:1px solid #e9e9e9;
	}
	.active1{
		border:2px solid skyblue !important;
	}
	.active2{
		font-weight: bold;
	}
	.page ul li a{
		font-size:1.1em;
		line-height: 40px;
	}
	#searchBtn{
		width:50px;
		height:24px;
		background: #5f5f5f;
		color:white;
		border:none;
		border-radius: 3px;
		font-size:15px;
	}
	.searchWrap{
		text-align: center;
		margin-bottom:50px;
	}
	
	footer{ 
		width:100%;
	}
}
</style>
<script>
$(function(){
	//게시판 검색
    $("#searchBtn").click(function(){
    	var s=$("select[name='searchType']").val();
		var searchType = encodeURIComponent(s);
		var k=$("input[name='keyword']").val();
		var keyword = encodeURIComponent(k);
		location.href="review${pageMaker.makeQuery(1)}&searchType="+searchType+"&keyword="+keyword;
	});
	
	//익스플로러에서 한글 검색 후 read로 넘어갈 때 인코딩 문제 아래와 같이 해결
	$(".title > a").click(function(e){
		e.preventDefault();
		var bno=$(this).parent().parent().find(".bno").text();
		var s=$("select[name='searchType']").val();
		var searchType = encodeURIComponent(s);
		var k=$("input[name='keyword']").val();
		var keyword = encodeURIComponent(k);
		location.href="reviewPwType${pageMaker.makeQuery(pageMaker.cri.page)}&searchType="+searchType+"&keyword="+keyword+"&bno="+bno;
	});
	
	$("input[name='keyword']").val("");
	
	 //loginChk
    function loginCheck(url){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/userLoginChk",
    		type:"post",
    		dataType:"text",
    		success:function(json){
    			console.log(json);
    			if(json=="no"){
    				alert("로그인 후 이용가능합니다.");
    				return false;
    			}else{
    				location.href=url;
    			}
    		}
    	})
    }
    
    $(".writeBtn > a").click(function(e){
    	e.preventDefault();
    	var boardUrl=$(this).attr("href");
    	loginCheck(boardUrl);
    	return false;
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
			<img class="pc_ver" src="${pageContext.request.contextPath}/resources/images/sub_community_top.jpg">
			<img class="m_ver" src="${pageContext.request.contextPath}/resources/images/mobile_sub_community_top.jpg">
		</div>
		<div class="mid_nav_wrap">
			<ul>
				<li class="mid_nav_first_li"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/homeBtnImg.png"></a></li>
				<li>
					<p>Community</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap sMenu1">
						<ul>
							<li><a href="${pageContext.request.contextPath}/ourbrand">Our Brand</a></li>
							<li><a href="${pageContext.request.contextPath}/product">Product</a></li>
							<li><a href="${pageContext.request.contextPath}/technique">Technique</a></li>
							<li><a href="${pageContext.request.contextPath}/information">Information</a></li>
						</ul>
					</div>
				</li>
				<li>
					<p>Review</p>
					<img src="${pageContext.request.contextPath}/resources/images/arrow_down.png">
					<div class="mid_sub_nav_wrap sMenu2">
						<ul>
							<li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
							<li><a href="${pageContext.request.contextPath}/partnership">제휴</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="contentWrap">
			<div class="content_title">
				<h2>Review</h2>
			</div>
			<div class="content">
				<div class="tableWrap">
					<table>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>답변</th>
							<th>등록일</th>
							<th>조회</th>
						</tr>
						<c:choose> 
					    <c:when test="${fn:length(list) == 0}">
				        	<tr>
				        		<td colspan="5" style=" text-align: center;">등록된 게시물이 없습니다.</td>
				        	</tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="item" items="${list}">
								<tr>
									<td class="bno">${item.bno}</td>
									<td class="title">
											<c:if test="${item.pwtype=='o'}">
												<img class="lockImg" src="${pageContext.request.contextPath}/resources/images/lock1.png">
											</c:if>
											<a href="${pageContext.request.contextPath}/reviewPwType${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}">${item.title}</a>
										</td>
									<td>${item.writer}</td>
									<td>${item.state}</td>
									<td><fmt:formatDate type="date" value="${item.regdate}"/></td>
									<td>${item.cnt}</td>
								</tr>	
							</c:forEach>
					    </c:otherwise> 
					</c:choose>
					</table>
					<p class="writeBtn"><a href="${pageContext.request.contextPath}/reviewRegister${pageMaker.makeSearch(pageMaker.cri.page)}">글쓰기</a></p>
					<div class="page">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li ${pageMaker.cri.page == idx? 'class=active1':''}><a href="${pageMaker.makeSearch(idx)}" ${pageMaker.cri.page == idx? 'class=active2':''}>${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<li><a href="${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
							</c:if>
							
						</ul>
					</div><!-- page end -->
					<div class="searchWrap">
						<select name="searchType">
							<option value="n">선택해주세요.</option>
							<option value="t" ${cri.searchType=='t'?'selected':''}>제목</option>
							<option value="c" ${cri.searchType=='c'?'selected':''}>내용</option>
							<option value="r" ${cri.searchType=='r'?'selected':''}>작성일</option>
						</select> 
						<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
						<button id="searchBtn">검색</button>
					</div>
				</div><!-- tableWrap end -->
			</div><!-- content end -->
		</div><!-- contentWrap end -->
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>