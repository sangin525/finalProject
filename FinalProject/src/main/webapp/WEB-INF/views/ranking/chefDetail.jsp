<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">

</head>
<body class="Main_body">
	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp" %>
	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="container">
			<div class="content">
				<div class="chef_cont">
					<ul class="nav">
						<li><a>해당 쉐프의 레시피</a></li>
					
						<div class="list">
							<!-- <a onclick="window.location.href='/member/newList.do'">최신순</a><a onclick="window.location.href='/member/viewList.do'">조회순</a> -->
						</div>
					</ul>
					<hr />
					<br>
					<div class="result">
						<c:choose>
					<c:when test="${not empty list}">
								<c:forEach var="item" items="${list}">
									<div class="result">
									<a onclick="location.href='/member/detail.do?rno=${item.rno}'">
									<img src="/resources/uploads/recipe/${item.uploadName}"  class="recipe-image">
									<div class="recipe-info">
										<p class="">레시피 제목: ${item.title }</p>
										<p class="">레시피 올린 날짜: ${item.indate }</p>
										<p class="">레시피 번호 : ${item.rno }</p>
										<p class="">레시피 조회수 : ${item.views }</p>
									</div>
									</a>
								</div>
								<c:set var="row" value="${row-1 }"/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="https://recipe1.ezmember.co.kr/img/none_recipe.png">
									<p>해당쉐프의 레시피가 없습니다!</p>
									
								</div>
							</c:otherwise> 						</c:choose>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div>
	<%-- <ul class="pagination justify-content-center">
				 <c:choose>
				  		<c:when test="${pi.cpage eq 1}">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:when>
					    <c:otherwise>
						    <li class="page-item">
						      <a class="page-link" href="/member/myRecipe.do?cpage=${pi.cpage-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
				    	<li class="page-item">
				    		<a class="page-link" href="/member/myRecipe.do?cpage=${page}">${page}</a>
			    		</li>
				    </c:forEach>
				    
				    <c:choose>
					    <c:when test="${pi.cpage eq pi.maxPage}">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:when>
					    <c:otherwise>
  						    <li class="page-item">
						      <a class="page-link" href="/member/myRecipe.do?cpage=${pi.cpage+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
		</ul>	 --%>
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>