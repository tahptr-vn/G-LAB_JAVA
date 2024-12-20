<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />

<br />
<div id="container" style="margin-top: 100px">
	<div class="container detail wrap-checkout">
		<div class="checkout__inner clearfix">
			<form:form action="/order/checkout" method="post">
				<div class="checkout__infor">
					<div class="checkout__infor__shipping step-checkout">
						<div class="checkout__infor__user__shipping">
							<p class="font-700 mgB-20 fs-24 mgT-20">SHIPPING INFOMATION</p>


							<form:form action="/order/checkout" modelAttribute="order"
								method="post">
								<div class="frm-item">
									<form:input path="user.fullname" class="form-control"
										readonly="true" />
								</div>
								<div class="frm-item">
									<form:input path="user.id" class="form-control" readonly="true" />
								</div>
								<div class="frm-item">
									<form:input path="orderDate" class="form-control" />
								</div>
								<div class="frm-item">
									<form:input path="address" class="form-control"
										placeholder="Địa chỉ. Vui lòng điền CHÍNH XÁC 'tầng, số nhà, đường'.  (*)" required="required"/>
								</div>
								<div class="frm-item">
									<form:input path="telephone" class="form-control"
										placeholder="Điện thoại  (*)" required="required" pattern=".{10,}" title="Số điện thoại không hợp lệ"/>
								</div>

								<div class="frm-item">

									<form:hidden path="status" class="form-control" />
								</div>
								<div class="frm-item">
									<form:hidden path="amount" class="form-control" />
									<div class="form-control">
										<f:formatNumber value="${cart.amount}" pattern="#,###" />
										VNĐ
									</div>
								</div>
								<div class="frm-item">
									<form:textarea path="description" rows="3" class="form-control"
										placeholder="Lưu ý" />
								</div>
								<div class="text-center mgT-30">
									<button class="btn__conti--pay">CONTINUE TO PAYMENT
										METHOD</button>

								</div>

							</form:form>
						</div>

					</div>
				</div>
				<div class="checkout__inforpro">
					<p class="font-700 mgB-30 text-center fs-17">YOUR CART</p>
					<c:forEach var="p"
						items="${sessionScope['scopedTarget.cartService'].items}">

						<div class="clearfix checkout__inforpro-detail 23323">
							<div class="font-600 fs-14 mgB-10">
								<a href="/product/detail/${p.id}"> ${p.name} </a>
							</div>

							<div class="font-600 fs-11 justifyAround mgB-5">
								<em>SIZE:</em>
								<div>6.5W US</div>
							</div>
							<div class="up__down--qty font-600 fs-11 justifyAround">
								<em>QTY:</em>
								<div>
									
									<span class="qty__val">${p.quantity}</span>
									<input name="quantity_select" class="quantity_select"
										type="hidden" value="1">
								</div>
							</div>
							<div class="font-600 fs-11 justifyAround mgB-5">
								<em>Thành Tiền:</em>
								<div>
									đ
									<f:formatNumber value="${p.quantity * p.unitPrice}" pattern="#,###" />
								</div>
							</div>
							<div class="font-600 fs-11 justifyAround mgB-5">
								<em>Giá Đã Giảm:</em>
								<div>đ <f:formatNumber value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" /></div>
							</div>
							<div class="promoCode">
								<a href="" class="removeCoupon hide"><span
									class="icon-uniF335"></span></a>
								<div class="frm-item">
									<input type="text" placeholder="PROMO CODE"
										name="coupon_code[37473]" value="">
									<div class="error">Mã Khuyến Mãi không phù hợp</div>
								</div>
								<div class="btnApply">
									<button>APPLY</button>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix mgB-10">
						<p class="pull-right font-600 fs-12">đ <f:formatNumber value="${cart.amount}" pattern="#,###" /></p>
						<p class="font-600 fs-12">Thành Tiền</p>
					</div>

					<div class="clearfix mgB-10">
						<p class="pull-right font-700 fs-12">0 đ</p>
						<p class="font-700 fs-12">Tiền Ship</p>
					</div>
					<div class="clearfix mgB-40">
						<p class="pull-right font-700 fs-17">đ <f:formatNumber value="${cart.amount}" pattern="#,###" /></p>
						<p class="font-700 fs-17">Tổng Số Tiền</p>
					</div>
					<div class="backLink">
						<a href="/home"><span
							class="glyphicon glyphicon-menu-left"></span>RETURN TO STOCK INFOMATION</a>
					</div>

				</div>
			</form:form>
		</div>
	</div>
</div>


