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
	}
	
	/* 공지사항 */
	.tbl_board{
		width:90%;
		max-width:860px;
		margin:0 auto;
		padding:30px 0;
		position:relative;
	}
	.tbl_board table{
		width:800px;
		margin:0 auto;
		border-collapse: collapse; 
	}
	.tbl_board table .tbl_header th{
		border-top:2px solid #e3e3e3;
		border-bottom:2px solid #00B4AE;
		padding:8px 13px;
		font-size:15px;
	}
	.tbl_board table .tbl_header th:nth-child(2){
		width:400px;
	}
	.tbl_board table td{
		padding:8px 13px;
		border-bottom:1px solid lightgray;
		font-size:15px;
	}
	.tbl_board table td a{
		font-size:15px;
	}
	.tbl_board table tr:not(first-child) td:nth-child(2){
		text-align: left;
	}
	.tbl_board table td:not(.title){
		text-align: center;
	}
	.replyCnt{
		font-weight: 600;
	}
	.title>a:hover{
		color:red;
	}
	.title>img{
		width:12px;
	}
	.page{
		clear:both;
		width:626px; 
		margin:70px auto;
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
		background: #00B4AE;
	}
	.active2{
		font-weight: bold;
		color:white;
	}
	.page ul li a{
		font-size:1.1em;
		line-height: 40px;
	}
	.registerBtn{
		float:right;
		margin-right:35px;
		margin-top:31px;
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
    		location.href="adminNotice${pageMaker.makeQuery(1)}&searchType="+searchType+"&keyword="+keyword;
    	});
		
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
		<div class="centerMenu"> 
			<h1 class="boardTitle">&lt;공지사항 관리&gt;</h1>
			<div class="tbl_board">
				<table>
					<tr class="tbl_header">
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th> 
						<th>조회</th>
						<th>비고</th>
					</tr>
					<c:choose>
					    <c:when test="${fn:length(list) == 0}">
				        	<tr>
				        		<td colspan="6" style=" text-align: center;">등록된 게시물이 없습니다.</td>
				        	</tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="item" items="${list}">
								<tr>
									<td>${item.bno}</td>
									<td class="title"><a href="adminNoticeRead${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}">${item.title}</a></td>
									<td>${item.writer}</td>
									<td><fmt:formatDate type="date" value="${item.regdate}"/></td>
									<td>${item.cnt}</td>
									<td>
										<a href="${pageContext.request.contextPath}/admin/adminNoticeUpdate${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}"><button>수정</button></a>
										<a href="${pageContext.request.contextPath}/admin/adminNoticeDelete${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}"><button>삭제</button></a>
									</td>
								</tr>	
							</c:forEach>
					    </c:otherwise> 
					</c:choose>
				</table>
				<p class="registerBtn"><a href="adminNoticeRegister${pageMaker.makeSearch(pageMaker.cri.page)}"><button>글쓰기</button></a></p>
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
				<div class="box-body" style="text-align:center;">
						<select name="searchType">
							<option value="n">선택해주세요.</option>
							<option value="t" ${cri.searchType=='t'?'selected':''}>제목</option>
							<option value="c" ${cri.searchType=='c'?'selected':''}>내용</option>
							<option value="r" ${cri.searchType=='r'?'selected':''}>작성일</option>
						</select> 
						<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
						<button id="searchBtn">검색</button>
					</div>
			</div><!-- tbl_board -->
		</div><!-- centerMenu end -->
	</div>
</body>
</html>