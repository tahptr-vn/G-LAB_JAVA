<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container" style="margin-bottom: 25px; margin-top: 100px">
	<br>


	<h3 class="title" style="font-weight: 700">Thông tin cá nhân</h3>
	<br>


	<div class="row">
		<div class="col-sm-4">
			<div class="quan-li-thong-tin">
				<li class="nav-item2 active" style="list-style-type: none;"><a
					class="nav-link collapsed" href="" data-toggle="collapse" id="i">
						<div class="row">
							<div class="col-sm-2">
								<i class="fas fa-info-circle"
									style="font-size: 30px; padding: 12px 5px; color: black;"></i>
							</div>
							<div class="col-sm-10" style="padding: 0px 15px;">
								<span> <b>Thông tin cá nhân</b>
									<p>Quản lý thông tin cá nhân</p>
								</span>
							</div>
						</div>
				</a></li>
			</div>
			<li class="nav-item2" style="list-style-type: none;"><a
				class="nav-link collapsed" href="/account/change"
				data-toggle="collapse" data-target="#collapseNews"
				aria-expanded="true" aria-controls="collapseNews">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-key"
								style="font-size: 30px; padding: 12px 5px; color: black;"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Thay đổi mật khẩu</b>
								<p>Cập nhật mật khẩu mới</p>
							</span>
						</div>
					</div>
			</a></li>
			<li class="nav-item2" style="list-style-type: none;"><a
				class="nav-link collapsed" href="/order/list"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-shopping-cart"
								style="font-size: 30px; padding: 12px 5px; color: black;"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Lịch sử đơn hàng</b>
								<p>Thông tin sản phẩm đã mua</p>
							</span>
						</div>
					</div>
			</a></li>

		</div>





		<!--  -->
		<div class="col-sm-8">
			<div class="ct1">
				<div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">User info</h4>
						</div>
						<form:form action="/account/edit" modelAttribute="form"
							enctype="multipart/form-data">
							<h4 class="label label-danger">${message}</h4>
							<div class="panel-body">
								<div class="row">
									<div class="col-sm-4">
										<p><b>Ảnh:</b></p>
									</div>
									<div class="col-sm-8">
										<p>
											<img src="/static/images/customers/${form.photo}"
												style="width: 80px; height: 90px;" /> <input type="file"
												name="photo_file" />
											<form:hidden path="photo" class="form-control" />
										</p>
									</div>
								</div>
								<div class="row" style="padding:10px">
									<div class="col-sm-4">
										<p><b>Tên đăng nhập:</b></p>
									</div>
									<div class="frm-item" style="width:500px;">
										<p>
											<form:input style="width: 90%;" path="id"
												class="form-control" readonly="true" />
										</p>
									</div>
								</div>
								<div class="row"style="padding:10px">
									<div class="col-sm-4">
										<p><b>Họ tên:</b></p>
									</div>
									<div class="frm-item" style="width:500px;">
										<p>
											<form:input style="width: 90%;" path="fullname"
												class="form-control" required="required" pattern=".{6,}"
												title="Họ tên phải từ 6 ký tự trở lên" />
										</p>
									</div>
								</div>
								<div class="row"style="padding:10px">
									<div class="col-sm-4">
										<p><b>Điện thoại:</b></p>
									</div>
									<div class="frm-item" style="width:500px;">
										<p>
											<form:input style="width: 90%;" path="telephone"
												class="form-control" required="required" pattern=".{10,}"
												title="Số điện thoại gồm 10 số " />
										</p>
									</div>
								</div>
								<div class="row"style="padding:10px">
									<div class="col-sm-4">
										<p><b>Email:</b></p>
									</div>
									<div class="frm-item" style="width:500px;">
										<p>
											<form:input style="width: 90%;" path="email"
												class="form-control" required="required"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
												title="Email không hợp lệ" />
										</p>
									</div>
								</div>
								<div class="row"style="padding:10px">
									<div class="col-sm-4"></div>
									<div class="col-sm-8" style="right: -85px;">
										<form:hidden path="password" />
										<form:hidden path="activated" />
										<form:hidden path="admin" />
										<button class="userauth__btn" style="width: 50%;">Update</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





	<style>
.dang-nhap {
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}

.quan-li-thong-tin .active {
	background-color: white;
	width: 110%;
	padding: 10px 5px 0px;
	border-radius: 5px;
}

.gach {
	background-color: blue;
	width: 100px;
}

.quan-li-thong-tin .active span {
	color: black;
}
</style>