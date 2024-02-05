<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/category/category.css">
<link rel="stylesheet" href="/resources/css/ranking/ranking.css">
<script src="/resources/js/category/category.js"></script>
</head>
<body>
<%@ include file="../../views/common/header.jsp"%>
<%@ include file="../../views/category/categoryNav.jsp"%>
<div class="rankingContainer">
	<div class="rankingContain">

	<ul class="recipeList">
	<c:choose>
		<c:when test="${empty list }">
			<div>
				<h3 class="text-center">등록된 글이 없습니다.</h3>
			</div>
		</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${list}">
		<li class="recipeRanking">
		<input type="hidden" value="${item.foodCategory}"> <!-- 종류별 -->
		<input type="hidden" value="${item.situationCategory }">	<!-- 상황별 -->
		<input type="hidden" value="${item.howCategory}">	<!-- 방법별 -->
		<input type="hidden" value="${item.ingredientCategory}">	<!-- 재료별 -->
		
			<!--  
			<p class="rankingNum"></p>
			-->
			<div>
				<a>
					<img src="/resources/uploads/recipe/${item.uploadName}" class="rank-image" onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
				</a>
			</div>
			<div class="recipeTitle">${item.title}</div>
			<div class="chefName">
				<a><img src="/resources/uploads/고양이그림.png" class="ChefPicture">${item.memberNickName }</a>
			</div>
			<div class="RecipeScore">
				<span>요리번호 : ${item.rno}</span>
				<span>별점</span>
				<span>조회수 : ${item.views}</span>
			</div>
		</li>
					<c:set var="row" value="${row-1 }"/>
				</c:forEach>
			</c:otherwise>
	</c:choose>

	 
	</ul>
	
	 		<ul class="pagination justify-content-center">
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
						      <a class="page-link" href="/recipe/categoryList.do?cpage=${pi.cpage-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
				    	<li class="page-item">
				    		<a class="page-link" href="/recipe/categoryList.do?cpage=${page}">${page}</a>
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
						      <a class="page-link" href="/recipe/categoryList.do?cpage=${pi.cpage+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
		</ul>
	

	</div>
</div>

</body>
</html>