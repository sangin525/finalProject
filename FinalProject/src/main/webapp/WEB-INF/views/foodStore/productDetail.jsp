<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodStore/foodStore.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/js/foodStore/foodStore.js"></script>
</head>
<body>
	<%@ include file="../../views/common/header.jsp"%>

	<div class="productContainer">
		<div class="productContents">
			<div class="product-view">
				<div class="product-top-section">
					<div class="product-view-pic">
						<div class="product-view-pic-zoom">
							<a class="product-main-img"><img
								src="/resources/uploads/고양이그림.png"></a>
						</div>
						<div class="product-sub-img">
							<img src="/resources/uploads/고양이그림.png"> <img
								src="/resources/uploads/category/cate1_02.png"> <img
								src="/resources/uploads/category/cate1_03.png"> <img
								src="/resources/uploads/category/cate1_04.png"> <img
								src="/resources/uploads/category/cate1_05.png">
						</div>
					</div>
					<form>
						<div class="product-info">
							<div class="product-view-info">
								<h3>한일 내솥 일체형 가열식 가습기 퓨어팟2</h3>
								<p>100℃로 가열살균 후 적정온도로 가습되어 안전한 가습기</p>
								<div class="product-view-pricebox">
									<p class="dc">26%</p>
									<p class="price">
										139,000<b>원</b>
									</p>
									<p class="del">189,000원</p>
								</div>
								<div class="info-delivery-area">
									<dl class="info-delivery">
										<dt>
											<img src="/resources/uploads/배송아이콘.png">배송
										</dt>
										<dd>무료배송</dd>
									</dl>
								</div>
								<div class="option-display-area">
									<table class="option-display-table">
										<tbody class="option-display-tbody">
											<tr>
												<td colspan="2"><span>한일 내솥 일체형 가열식 가습기 퓨어팟2</span></td>
											</tr>
											<tr>
												<td colspan="2"><strong>139,000원</strong> <span
													class="count"> <span class="count-btn">
															<button type="button" class="down-product">감소</button> <input
															type="text" class="product-count" value="1">
															<button type="button" class="up-product">증가</button>
													</span>
												</span></td>
											</tr>
										</tbody>
									</table>
									<div class="price-total-area">
										<div class="price-total">
											<span>139,000원</span>
										</div>
									</div>
									<div class="payment-btn-box">
										<button type="button" class="go_to_cart">장바구니</button>
										<button type="button" class="go_to_payment">결제하기</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="product-detail-box">
				    <ul class="product-detail-ul">
				        <li><a href="#detail-img" class="active">상세정보</a></li>
				        <li><a href="#review">후기</a></li>
				        <li><a href="#refund">배송환불</a></li>
				        <li><a href="#inquiry">문의</a></li>
				    </ul>
				</div>
				<div class="detail-img" id=detail-img>
					<img src="/resources/uploads/가습기.jpg"> <img
						src="/resources/uploads/가습기2.jpg"> <img
						src="/resources/uploads/가습기3.jpg"> <img
						src="/resources/uploads/가습기4.jpg"> <img
						src="/resources/uploads/가습기5.jpg">
				</div>
				<div class="detail-img-pull">
					<a>상세정보 더보기</a>
				</div>

				<%@ include file="../../views/foodStore/productReview.jsp"%>
				<%@ include file="../../views/foodStore/questions.jsp"%>
			</div>
		</div>
	</div>


	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>