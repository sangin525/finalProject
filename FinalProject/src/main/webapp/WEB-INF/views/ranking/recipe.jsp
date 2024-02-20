<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/ranking/ranking.css">
<script src="/resources/js/ranking/ranking.js"></script>
</head>
<body>
<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp" %>
<div class="rankingContainer">
	<div class="rankingContain">
<%@ include file="../../views/ranking/rankingNav.jsp"%>
	
	<ul class="recipeList">
	<c:choose>
		<c:when test="${empty list}">
			<h3 class = "text-center">등록된 글이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<c:forEach var="item" items="${list}">
		<li class="recipeRanking">
			<p class="rankingNum"><b>1</b></p>
			<div>
				<a>
					<img src="/resources/uploads/recipe/${item.uploadName}" class="rank-image" onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
				</a>
			</div>
			<div class="recipeTitle">${item.title}</div>
			<div class="chefName">
				<a><img src="/resources/uploads/고양이그림.png" class="ChefPicture">${item.memberNickName}</a>
			</div>
			<div class="RecipeScore">
				<span>댓글수 ${item.commentCount}</span>					
				<span>별점 ${item.star}</span>	
				<span>조회수 ${item.views}</span>
			</div>
		</li>
				</c:forEach>
		</c:otherwise>
	</c:choose>
		
	</ul>
	
	</div>
</div>
<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>