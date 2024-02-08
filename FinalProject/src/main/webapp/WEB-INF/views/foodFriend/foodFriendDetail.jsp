<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">
<script src="/resources/js/foodFriend/foodFriend.js"></script>

</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>
	<div class="container">
		<div class="board_wrap">
			<div class="board_title">
				<strong>밥친구 게시글</strong>

			</div>
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="title">${food.title}</div>
					<div class="info">
						<dl>
							<dt>번호</dt>
							<dd>${food.fno}</dd>
						</dl>
						<dl>
							<dt>글쓴이</dt>
							<dd>${food.writer}</dd>
						</dl>
						<dl>
							<dt>작성일</dt>
							<dd>${food.indate}</dd>
						</dl>
						<dl>
							<dt>조회</dt>
							<dd>${food.views }</dd>
						</dl>
					</div>
					<div class="cont">
						<img src="/resources/uploads/foodMate/${food.uploadName}"> 
						<br><br> 
						${food.contents}
					</div>
				</div>
				<div class="bt_wrap">
				<c:if test="${sessionScope.memberNickName == food.writer}">					
					<a href="/foodMate/foodMateDelete.do?fno=${food.fno}">삭제</a> <a href="/foodMate/foodMateEditForm.do?fno=${food.fno}">수정</a>
				</c:if>	
					<a href="/foodMate/foodMateList.do" class="on">목록</a><a href="foodFriendConv">1:1대화</a>
				</div>
			</div>
		</div>
		<c:if test="${sessionScope.memberNickName == food.writer}">
		<div>
			<form action="/foodMate/foodMateDelete.do?fno=${food.fno}" method="GET">
			<button type ="submit">삭제</button>
			</form>
		</div>
		</c:if>
		<div class="comment_title">
			댓글 <span>21</span>

		</div>
		<div class="commentList">

			<div class="reply_list">
				<div class="media-left">
					<a href="#"> <img class="profile_picture"
						src="/resources/uploads/레시피등록대표사진.gif"></a>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<b class="info_name_f">바비</b> <span>2024-1-29 07:32</span> <a
							onclick="#">답글</a>
					</h4>
					바비 <br>
				</div>


			</div>
		</div>

		<div class="comment-section">
			<h2>댓글 남기기</h2>
			<form id="comment-form">
				<div class="commentPic">
					<img src="/resources/uploads/레시피등록대표사진.gif">
				</div>
				<div class="comment">


					<textarea class="commentTextbox" name="comment"
						placeholder="댓글을 작성하세요."></textarea>
					<button class="comment_submit">댓글작성</button>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
