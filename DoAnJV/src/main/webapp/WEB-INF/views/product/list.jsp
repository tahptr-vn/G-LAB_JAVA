<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div id="container" style="margin-top: 100px;background-color:#FFFFFF !important">
	<div class="container">
		<h3 class="title" style="margin-left: 10px;margin-top: 20px">

			<b>( ${listsp.size()} </b> sản phẩm)
		</h3>

		<div class="text-center">
			<div class="typeProducts">
				<div class="row" style="width: 100%">

					<div class="col-xs-12">
						<div class="typeFilter text-left">
							<a href="" class="filterToggle"><span class="fa fa-filter"></span>Filter</a>
						</div>
					</div>
				</div>

			</div>

			<div class="menuFilter">
				<a href="" class="filterClose"><span class="fa fa-close"></span></a>
				<div class="filterIcon">
					<span class="fa fa-filter"></span>Filter
				</div>
				<div class="filterItems">
					<div class="dropdown open">
						<div class="btn btn-default btn-xs dropdown-toggle" type="button"
							id="sortUsers" data-toggle="dropdown" aria-expanded="true">
							Sort <span class="caret"></span>
						</div>
						<ul class="dropdown-menu" role="menu" aria-labelledby="sortUsers">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="https://www.glab.vn/product/footwear?sortBy=c.price_asc">Price:
									lowest first <i class="fa fa-sort-amount-asc"
									aria-hidden="true"></i>
							</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="https://www.glab.vn/product/footwear?sortBy=c.price_desc">Price:
									highest first <i class="fa fa-sort-amount-desc"
									aria-hidden="true"></i>
							</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="https://www.glab.vn/product/footwear?sortBy=a.created_at_desc">New
									to Old <i class="fa fa-sort-amount-desc" aria-hidden="true"></i>
							</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="https://www.glab.vn/product/footwear?sortBy=a.created_at_asc">Old
									to New <i class="fa fa-sort-amount-desc" aria-hidden="true"></i>
							</a></li>
						</ul>
					</div>
					<div class="filterItem">
						<a href="">Brand <span class="toggleSub fa fa-plus"></span></a>
						<ul class="clearfix">
							<c:forEach var="c" items="${brands}">
								<li><a href="/product/footwear/${c.nameBrand}">${c.nameBrand}</a></li>
							</c:forEach>

						</ul>
					</div>

					<div class="filterItem">
						<a href="">Price <span class="toggleSub fa fa-plus"></span></a>
						<ul class="clearfix" style="padding: 0 0 20px 50px;">
							<li style="width: 90%;">
								<p>
									<input type="text" id="amount" readonly
										style="border: 0; color: #f6931f; font-weight: bold; width: 100%;">
								</p>
								<div id="slider-range"></div>
							</li>
						</ul>
					</div>
				</div>
			</div>



		</div>
		<!-- End filter -->
		<c:forEach var="p" items="${listsp}">

			<div class="col-sm-3" style="padding: 5px 5px 5px 5px">
				<div class="thumbnail" style="max-height: 380px">

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
									<span style="text-align: left; font-weight: bold; color: red">đ
										<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
									</span>
								</c:when>
								<c:otherwise>
									<span
										style="text-decoration: line-through; color: Gray; font-weight: bold;">đ
										<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
									</span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${p.discount > 0 }">
									<span style="margin-left: 5px; font-weight: bold; color: red">
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
								data-toggle="modal" data-target="#myModals" style="width:100%;background-color:grey">
								<i class="glyphicon glyphicon-shopping-cart"> Mua</i>
							</button>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>

		<jsp:include page="dialog_cart.jsp" />
		<jsp:include page="dialog.jsp" />
		
	</div>
	<div class="text-center">


			<a href="/product/footwear" class="btn-see-more ajax text-uper">see
				more</a>
		</div>
</div>


