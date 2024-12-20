<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<br/>
<div class="container" style="margin-top:100px;background-color:#FFFFFF !important">
<div class="userauth">	
		<h3 class="text-center text-uper font-700 fs-30 mgB-45">create account</h3>
		<h4 class="label label-success">${message}</h4>
		<form:form action="/account/register" modelAttribute="form"
			enctype="multipart/form-data">
			<div class="frm-item">
				<form:input path="id" class="form-control" required="required" placeholder="ID" pattern=".{6,}" title="Tên đăng nhập phải từ 6 ký tự trở lên"/>
			</div>
			<div class="frm-item">
				<form:input path="password" type="password" class="form-control" required="required" placeholder="Password" pattern=".{6,}" title="Mật khẩu phải từ 6 ký tự trở lên"/>
			</div>
			<div class="frm-item">
				<form:input path="fullname" class="form-control" required="required" placeholder="Name" pattern=".{6,}" title="Họ tên phải từ 6 ký tự trở lên"/>
			</div>
			<div class="frm-item">
				<form:input path="telephone" type="number" class="form-control" required="required" placeholder="Phone Number"  title="Số điện thoại gồm 10 số"/>
			</div>
			<div class="frm-item">
				<form:input path="email" class="form-control"  required="required" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email không hợp lệ"/>
			</div>
			<div class="frm-item">
				<label>Ảnh:</label> <input type="file" name="photo_file" />
				<form:hidden path="photo" class="form-control" />
			</div>
			<div class="frm-item">
               <button class="userauth__btn" >Đăng ký</button>
            </div>
			
			<a class="btn btn-default" style="width:100%" href="/account/register"><s:message code="act.button.reset" /></a>
		</form:form>
		<div class="text-center mgT-40">
            <p class="font-500 fs-16 text-uper mgB-10 text-decor"><a href="/account/login">you have a account ?</a></p>
            <p class="font-500 fs-16 text-uper text-decor"><a href="/account/forgot">forgot your password ?</a></p>
        </div>
</div>
</div>








