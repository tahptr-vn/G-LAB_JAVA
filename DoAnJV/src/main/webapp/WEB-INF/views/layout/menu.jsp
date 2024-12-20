<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!--  
<div class="container">
	<div id="menu">
		<div class="inner-menu">
			<div>
				<ul>
					<li><a href="#"><span>Features</span></a></li>
					<li><a href="#"><span>Footwear</span></a>
						<div class="menu__sub">
							<ul>
								<li><a href="#">Newest Sneakers</a></li>
								<li><a href="#">Lifestyle</a></li>
								<li><a href="#">Running</a></li>
								<li><a href="#">Basketball</a></li>
								<li><a href="#">Gym &amp; Training</a></li>
								<li><a href="#">Sandal</a></li>
							</ul>
						</div></li>
					<li><a href="#"><span>Apparel</span></a>
						<div class="menu__sub">
							<ul>
								<li><a href="#" style="color: red;">CONIC®</a></li>
								<li><a href="#">Hoodies</a></li>
								<li><a href="#">Shorts</a></li>
								<li><a href="#">Outerwears</a></li>
								<li><a href="#">Tees</a></li>
								<li><a href="#">Pants</a></li>
								<li><a href="#">Shirts</a></li>
								<li><a href="#">Jackets</a></li>
								<li><a href="#">Sweaters</a></li>
								<li><a href="#">Long Sleeves</a></li>
								<li><a href="#">Vintage</a></li>
							</ul>
						</div></li>
					<li><a href="#"><span>Accessories</span></a>
						<div class="menu__sub">
							<ul>
								<li><a href="#">Watch</a></li>
								<li><a href="#">Socks</a></li>
								<li><a href="#">Cap</a></li>
								<li><a href="#">Backpack and Bag</a></li>
								<li><a href="#">Shoe Care</a></li>
								<li><a href="#">Miscellaneous</a></li>
								<li><a href="#">Glasses</a></li>
								<li><a href="#">Bearbrick</a></li>
								<li><a href="#">Face Mask</a></li>
							</ul>
						</div></li>
					<li><a href="#"><span>Used</span></a></li>
					<li><a href="#"><span>Sale</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!--  
<nav class="navbar navbar-expand-sm navbar-dark"
	style="margin-top: -20px; background-color: #111111">
	<div class="container-fluid"
		style="height: 30px; padding: 0px 60px 0px 60px">
		<ul class="navbar-nav" style="margin-right: 450px">
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white;" data-toggle="collapse" href="#chungloai"> 
				<i class="fa fa-navicon"></i>&nbsp;&nbsp; <span class="danh_muc">DANH MỤC SẢN PHẨM</span>
			</a>
			</li>
			
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white; text-align:center"> 
				<span>Features</span>
			</a>
			</li>
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white; text-align:center"> 
				<span>Footwear</span>
				<div class="menu_sub">
					<li>
						 <a href="/product/list-by-cat">Newest Sneakers</a>
					</li>
				</div>
			</a>
			</li>
			
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white; text-align:center"> 
				<span>Apparel</span>
			</a>
				
			</li>
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white; text-align:center"> 
				<span>Accessories</span>
			</a>
			</li>
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white; text-align:center"> 
				<span>Used</span>
			</a>
			</li>
			<li
				style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white; text-align:center"> 
				<span>Sale</span>
			</a>
			</li>	
			<!-- Dropdown -->
<!-- 	
		</ul>
	</div>
</nav>

				<div class="list_danh_muc" style="position: absolute;z-index:1;display: none;width: 350px;padding-left: 70px;margin-top: -20px">

						<c:forEach var="c" items="${cates}">
							<a  class="list-group-item" href="/product/list-by-categorys/${c.id}">
								 ${c.nameVN}
							</a>
						</c:forEach>

				</div>
	-->
<style>
.list-group-item {
	background-color: #F8F8FF;
	border-bottom: 2px solid #EEEEEE;
}

.list-group-item:hover {
	color: black;
	font-weight: bold;
}
</style>


