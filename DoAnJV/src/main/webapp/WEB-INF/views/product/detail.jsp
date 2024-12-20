<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />



<!-- /content -->
<div class="container" style="margin-top: 100px;background-color:#FFFFFF !important">
	<div class="detailInner clearfix" style="margin-top: 100px;"
		data-sticky_parent>
		<div class="detail__img" data-sticky_column>

			<div class="slidedetailpage swiper-container">
				<div class="swiper-wrapper">
					<div class="slidedetail__item swiper-slide">
						<img src="/static/images/products/${prod.image}" alt=""
							style="width: 50%;" />
					</div>
					<div class="slidedetail__item swiper-slide">
						<img src="/static/images/products/${prod.image}" alt=""
							style="width: 50%;" />
					</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
		<div class="detail__desc" data-sticky_column>
			<div class="detail__desc--inner">
				<div class="detail__desc--fix">

					<p class="color7c7c7c font-700 fs-14">${prod.category.nameVN}</p>
					<p class="text-uper font-500  fs-24 mgB-0 lh-40 mgB-20">${prod.name}</p>

					<br></br>
					<div class="row">
							<div class="col-sm-6" data-id="${prod.id}">
								<button class="btn btn-xm btn-warning" style="background-color:#D8D8D8;width:300px"
									data-toggle="modal" data-target="#myModals">Add to cart</button>
							</div>

						</div>

					<div class="row shareWrap">
						<div class="col-xs-12" style="margin-top:20px">
							<button class="btn btn-share" data-toggle="collapse"
								data-target="#shareButton" style="background-color:black;width:100px">
								<p style="color:white;text-align:center">Share <i class="fa fa-share-alt"></i></p>
							</button>
						</div>
						<div class="w-100"></div>
						<div class="col-xs-12">
							<div id="shareButton" class="collapse">
								<div class="col">
									<div class="col-sm-2">
										<a target="_blank"
											href="//www.facebook.com/sharer.php?u=https:/product/detail/${prod.name}"><i
											class="fab fa-facebook-f"></i></a> <a target="_blank"
											href="//twitter.com/share?text=&url=https:/product/detail/${prod.name}"><i
											class="fab fa-twitter"></i></a>
									</div>
									<div class="col-sm-10">
										<input type="text" class="" name="user[name]"
											placeholder="Name"
											value="/product/detail/${prod.id}"
											id="copyInput">
										<button class="btn btn-copy">Copy URL</button>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="detail__desc--intro">
						<p class="title__detailproduct">Detail</p>
						<div class="color-7c7c7c mgB-5">

							${prod.name}

							<div class="alert alert-danger alert-dismissable alert-used hide">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<i class="icon fa fa-ban"></i> Alert!
								</h4>
								Danger alert preview. This alert is dismissable. A wonderful
								serenity has taken possession of my entire soul, like these
								sweet mornings of spring which I enjoy with my whole heart.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- SP tương tự -->
	<div class="container-fluid" style="padding: 0px 80px 0px 80px">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#tab1">SẢN
					PHẨM CÙNG LOẠI</a></li>

			<li><a data-toggle="tab" href="#tab3">SẢN PHẨM ĐÃ XEM</a></li>
		</ul>

		<div class="tab-content">
			<div id="tab1" class="tab-pane fade in active">
				<div>
					<c:forEach var="p" items="${list}" begin="0" end="7">
						<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
							<div class="thumbnail">

								<a href="/product/detail/${p.id}"> <c:choose>
										<c:when test="${p.discount > 0 }">
											<p
												style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
												<span
													style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
													-<f:formatNumber value="${p.discount}" type="percent" />
												</span>
											</p>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose> <img style="margin-right: 30px; margin-top: 5px"
									class="estore-prod" src="/static/images/products/${p.image}"
									title="${p.name}">
								</a>

								<div class="caption">
									<p style="padding: 3px; text-align: center; color: black">
										<b>${p.name}</b>
									</p>
									<p
										style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
										<c:choose>
											<c:when test="${p.discount <= 0 }">
												<span
													style="text-align: left; font-weight: bold; color: red"><f:formatNumber
														value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
											</c:when>
											<c:otherwise>
												<span
													style="text-decoration: line-through; color: Gray; font-weight: bold;">
													<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
													VNĐ
												</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${p.discount > 0 }">
												<span
													style="margin-left: 5px; font-weight: bold; color: red">
													<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
														pattern="#,###" /> VNĐ
												</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</p>
									<br /> <br />
									<div data-id="${p.id}" class="pull-center text-center">
										<button class="btn btn-sm btn-success btn-add-to-cart"
											data-toggle="modal" data-target="#myModals"
											style="width: 100%;background-color:grey">
											<i class="glyphicon glyphicon-shopping-cart"> Mua</i>
										</button>


									</div>
								</div>


							</div>
						</div>

					</c:forEach>


					<jsp:include page="dialog.jsp" />
				</div>
			</div>

			<div id="tab3" class="tab-pane fade">
				<div>
					<c:forEach var="p" items="${viewed}" begin="0" end="7">
						<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
							<div class="thumbnail">

								<a href="/product/detail/${p.id}"> <c:choose>
										<c:when test="${p.discount > 0 }">
											<p
												style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
												<span
													style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
													-<f:formatNumber value="${p.discount}" type="percent" />
												</span>
											</p>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose> <img style="margin-right: 30px; margin-top: 5px"
									class="estore-prod" src="/static/images/products/${p.image}"
									title="${p.name}">
								</a>

								<div class="caption">
									<p style="padding: 3px; text-align: center; color: black">
										<b>${p.name}</b>
									</p>
									<p
										style="padding: 3px; font-size: 15px; text-align: center; font-weight: bold;">
										<c:choose>
											<c:when test="${p.discount <= 0 }">
												<span
													style="text-align: left; font-weight: bold; color: red"><f:formatNumber
														value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
											</c:when>
											<c:otherwise>
												<span
													style="text-decoration: line-through; color: Gray; font-weight: bold;">
													<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
													VNĐ
												</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${p.discount > 0 }">
												<span
													style="margin-left: 5px; font-weight: bold; color: red">
													<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
														pattern="#,###" /> VNĐ
												</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</p>
									<br /> <br />
									<div data-id="${p.id}" class="pull-center text-center">
										<button class="btn btn-sm btn-success btn-add-to-cart"
											data-toggle="modal" data-target="#myModals"
											style="width: 100%;background-color:grey">
											<i class="glyphicon glyphicon-shopping-cart"> Mua</i>
										</button>


									</div>
								</div>


							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<br />
	<jsp:include page="dialog.jsp" />
</div>


<br />


<jsp:include page="dialog_cart.jsp" />
<style>
.thumbnail:hover {
	-webkit-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	-moz-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
}

.pull-center {
	margin-top: -30px;
}

.caption {
	height: 150px
}

.mua-ngay {
	border-radius: 5px;
	padding: 5px 10px;
	text-align: center;
	background-color: rgb(20, 53, 195);
	border: none;
	color: #fff;
	font-weight: 800;
	width: 100%;
	font-size: 18px;
}

.theo-vao-gio {
	border-radius: 5px;
	padding: 5px;
	text-align: center;
	background-image: linear-gradient(-90deg, rgb(240, 232, 8),
		rgb(248, 32, 32));
	border: none;
	color: #fff;
	font-weight: 800;
	width: 100%;
	font-size: 18px;
}

.ct1 {
	background-color: #fff;
	padding: 30px 40px;
	border-radius: 10px;
}

.ct2 {
	background-color: #fff;
	padding: 30px 20px;
	border-radius: 10px;
}

.product-image img {
	width: 100%;
	height: 100%;
}

.sp-km {
	padding-top: 15px;
	border-top: 1px dotted green;
	padding: 15px 0px 10px 15px
}

.sp-km li {
	font-size: 15px;
}

.sp-km p {
	font-size: 15px;
	line-height: 16px;
}

.sp-km i {
	font-size: 14px;
	line-height: 16px;
}

.sp-km .ico {
	color: #0c78aa;
}

.san-pham-ct p {
	margin-top: -5px;
	color: #616060;
}

.san-pham-ct b {
	color: #076692;
}

.san-pham-ct u {
	color: #fa0606;
	font-weight: bold;
	font-size: x-large;
}
</style>