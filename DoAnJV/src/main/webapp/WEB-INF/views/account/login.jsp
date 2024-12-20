<%@ page pageEncoding="utf-8"%>


<div id="container" style="margin-top:100px;background-color:#FFFFFF !important">
        <div class="userauth">
    <div class="userauth__inner">
    <h4  class="label label-danger">${message}</h4>
        <h3 class="text-center text-uper font-700 fs-30 mgB-45">login</h3>
        <form class="form-horizontal" role="form" method="post" action="/account/login">
            <div class="frm-item">
                <input class="form-control" name="id" value="${uid}" placeholder="ID" required autofocus >
                                    <span class="help-block">
                    </span>
                            </div>
            <div class="frm-item">
                <input class="form-control" name="pw" type="password" value="${pwd}" placeholder="Password"  required>
                            </div>
            <div class="form-group" style="margin-left:5px">
                            <input name="rm" type="checkbox"/> <label>Nhớ mật khẩu?</label>
                            </div>
            <div class="frm-item">
                <button type="submit" class="userauth__btn">sign in</button>
            </div>
        </form>
        <div class="text-center mgT-40">
            <p class="font-500 fs-16 text-uper mgB-10 text-decor"><a href="/account/register">create account</a></p>
            <p class="font-500 fs-16 text-uper text-decor"><a href="/account/forgot">forgot your password ?</a></p>
        </div>
    </div>
</div>
    </div>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>