<%@ page pageEncoding="utf-8"%>

<br />
<div id="container"
	style="margin-top: 100px; background-color: #FFFFFF !important">
	<div class="container">
		<div class="row mgT-30">
		<div class="col-md-3"></div>
			<div class="col-md-6">
			<h3 class="text-center text-uper font-700 fs-30 mgB-45">Forgot
				password</h3>
			<h4 class="label label-danger">${message}</h4>
			<form action="/account/forgot" method="post">
				<div class="frm-item">
					<input name="id" class="form-control"placeholder="ID" />
				</div>
				<div class="frm-item">
					<input name="email" class="form-control"placeholder="Email" />
				</div>
				<div class="frm-item">
					<button class="userauth__btn">Find</button>
				</div>
			</form>
		</div>
		</div>
			<div class="col-md-3"></div>
	</div>
</div>



