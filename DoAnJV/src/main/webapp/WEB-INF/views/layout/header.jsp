<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />

<div class="col-sm-4" style="padding-right: 15px;">
	<div class="input-group">
		<form action="/product/list-by-keywords" method="post">
			<input style="width: 240px" class="form-control"
				value="${param.keywords}" name="keywords" placeholder="Tìm kiếm" />
			<div class="input-group-append">
				<button class="btn btn-secondary" value="${param.keywords}"
					type="submit"
					style="background-color: red; border: none; width: 50px; height: 34px">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>
</div>

<div class="searchPro">
	<div class="text-right mgB-20 mgT-10">
		<a href="" id="closeSearch"><span class="fa fa-close"></span></a>
	</div>
	<form class="search" id="search" action="/product/list-by-keywords"
		method="post">
		<div class="frm-icon">
			<input name="keywords" type="text" value="${param.keywords}"
				placeholder="Search" />
			<button type="submit" class="icon-frm" value="${param.keywords}">
				<span class="fas fa-reply"></span>
			</button>
			<div class="suggestSearch"></div>
		</div>
	</form>
</div>


<header class="clearfix" style="height: 100px">
	<a href="" id="togger__menu"><span></span><span></span></a>
	<div class="container">
		<div class="header__left">
			<a href="" style="display: none">SELL</a> <a href="#"
				style="display: none">CONSIGNMENT MANAGER</a>
		</div>
		<div class="header__right" style="width: 300px; left: 150px">
			<div class="auth__user">
				<div class="dropdown">

					<c:choose>
						<c:when test="${empty sessionScope.user }">
							<a href="#" class="toggle__auth val-selected"><span
								class="fa fa-user" style="font-size: 20px"></span></a>
							<div class="dropdown-up-style hide">
								<div class="dropdown__inner">
									<ul>
										<li style="border-bottom: 1px solid #EEEEEE;"><a
											href="/account/login">Đăng nhập</a></li>
										<li style="border-bottom: 1px solid #EEEEEE;"><a
											href="/account/register">Đăng ký</a></li>
										<li style="border-bottom: 1px solid #EEEEEE;"><a
											href="/account/forgot">Quên mật khẩu?</a></li>
									</ul>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<a href="" class="toggle__auth val-selected" style="max-">${user.fullname}</a>
							<div class="dropdown-up-style hide">
								<div class="dropdown__inner">
									<ul>
										<li style="border-bottom: 1px solid #EEEEEE;"><a
											href="/account/edit">Cập nhật thông tin cá nhân</a></li>
										<li style="border-bottom: 1px solid #EEEEEE;"><a
											href="/account/change">Thay đổi mật khẩu</a></li>
										<li style="border-bottom: 1px solid #EEEEEE;"><a
											href="/order/list">Lịch sử đơn hàng</a></li>
										<li><a href="/order/items">Danh sách sản phẩm đã mua</a></li>
										<li style="border-bottom: 1 px solid #EEEEEE;"><a
											href="/account/logout">Đăng xuất</a></li>
									</ul>
								</div>
							</div>
						</c:otherwise>

					</c:choose>

				</div>
			</div>
			<a href="" class="header__right--mbsearch"><span
				class="fa fa-search" style="font-size: 20px"></span></a>



			<!-- favourite cart 
			<div class="header__cart">
				<a href="/product/favo"><span
					class="fa fa-heart" style="font-size: 20px"></span></a>
			</div>
			-->

			<!-- Shopping cart -->
			<div class="header__cart dropdown">
				<a href="" class="val-selected"><span
					class="fa fa-shopping-cart" style="font-size: 20px"></span></a>


				<c:choose>

					<c:when test="${cart.amount > 0}">
						<div class="dropdown-up-style active">
							<div class="dropdown__inner">
								<h2 class="text-uper font-700 fs-16">your cart</h2>
								<div class="header__cart--item">

									<c:forEach var="p"
										items="${sessionScope['scopedTarget.cartService'].items}">


										<a href="" class="header__cart--item clearfix">
											<div class="pull-left wrap-img">
												<img src="/static/images/products/${p.image}" alt="">
											</div>

											<div class="overflow-all">
												<p class="text-uper fs-15 font-700">${p.name}</p>
												<p class="product-type text-uper font-500 fs-13 mgB-10"></p>
												<p class="pull-right font-700 fs-12">
													đ
													<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												</p>
												<p class="text-uper font-700 fs-12">Quantity:
													${p.quantity}</p>

											</div>
										</a>

									</c:forEach>

									<div class="clearfix mgB-20">
										<span class="text-uper fs-14 font-600">Tạm tính</span>
										<p class="pull-right product-price">
											đ
											<f:formatNumber value="${cart.amount}" pattern="#,###" />
										</p>
									</div>
									<div class="text-center">
										<p class="font-500 fs-15 mgB-15">Phí vận chuyển và thuế sẽ
											tính lúc thanh toán</p>
										<a href="/cart/view" class="text-uper btn-checkout ">Xem
											giỏ hàng</a>
									</div>
								</div>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="dropdown-up-style hide">
							<div class="dropdown__inner">
								<h2 class="text-uper font-700 fs-16">your cart</h2>
								<p class="font-500 fs-15 mgB-15" style="text-align: center">Không
									có sản phẩm nào !</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Prefer card 
			<div class="header__cart ">
				<a href="/product/favo"><span
					class="fa fa-heart" style="font-size: 20px"></span></a>			
			</div>-->
			<!-- End -->
		</div>
	</div>
	<!-- END Shopping cart -->


	<div class="text-center header__logo">

		<a href="/"><img src="/static/images/logo.svg" alt="" /></a>
	</div>
	<div class="container">
		<div id="menu">
			<div class="inner-menu">
				<div>
					<ul>
						<li><a href="#"><span>Features</span></a></li>
						<li><a href="/product/footwear"><span>Footwear</span></a>
							<div class="menu__sub">
								<ul>
									<li><a href="/product/newest sneakers">Newest Sneakers</a></li>
									<li><a href="/product/lifestyle">Lifestyle</a></li>
									<li><a href="/product/running">Running</a></li>
									<li><a href="/product/basketball">Basketball</a></li>
									<li><a href="/product/gym & traning">Gym &amp;
											Training</a></li>
									<li><a href="/product/sandal">Sandal</a></li>
								</ul>
							</div></li>
						<li><a href="/product/apparel"><span>Apparel</span></a>
							<div class="menu__sub">
								<ul>
									<li><a href="/product/CONIC®" style="color: red;">CONIC®</a></li>
									<li><a href="/product/hoodies">Hoodies</a></li>
									<li><a href="/product/shorts">Shorts</a></li>
									<li><a href="/product/outerwears">Outerwears</a></li>
									<li><a href="/product/tees">Tees</a></li>
									<li><a href="/product/pants">Pants</a></li>
									<li><a href="/product/shirts">Shirts</a></li>
									<li><a href="/product/jackets">Jackets</a></li>
									<li><a href="/product/sweaters">Sweaters</a></li>
									<li><a href="/product/long sleeves">Long Sleeves</a></li>
									<li><a href="/product/vintage">Vintage</a></li>
								</ul>
							</div></li>
						<li><a href="/product/accessories"><span>Accessories</span></a>
							<div class="menu__sub">
								<ul>
									<li><a href="/product/watch">Watch</a></li>
									<li><a href="/product/socks">Socks</a></li>
									<li><a href="/product/cap">Cap</a></li>
									<li><a href="/product/backpack and bag">Backpack and
											Bag</a></li>
									<li><a href="/product/shoe care">Shoe Care</a></li>
									<li><a href="/product/miscellaneous">Miscellaneous</a></li>
									<li><a href="/product/glasses">Glasses</a></li>
									<li><a href="/product/bearbrick">Bearbrick</a></li>
									<li><a href="/product/face mask">Face Mask</a></li>
								</ul>
							</div></li>
						<li><a href="#"><span>Used</span></a></li>
						<li><a href="#"><span>Sale</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
