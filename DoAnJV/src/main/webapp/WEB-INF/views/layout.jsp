<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>G-LAB: NỀN TẢNG MUA BÁN KÝ GỬI SNEAKER, STREETWEAR -
	GLAB.VN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<tiles:insertAttribute name="head" />
<!-- DataTables CSS -->
<link
	href="/static/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" href="/static/themes/v1/fonts/fontawesome.css">
<link rel="stylesheet" href="/static/themes/v1/css/reset.css">
<link rel="stylesheet" href="/static/themes/v1/css/font.css">
<link rel="stylesheet" href="/static/themes/v1/css/swiper.min.css">
<link rel="stylesheet" href="/static/themes/v1/css/style.css">

<link rel="stylesheet" href="/static/themes/v1/css/responsive.css">

<link rel="stylesheet" href="/static/themes/v1/css/style-update.css" />
<!-- DataTables Responsive CSS -->
<link
	href="/static/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">


</head>

<body style="background-color:#FFFFFF !important">
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<div class="row">
		<tiles:insertAttribute name="aside" />
	</div>
	<tiles:insertAttribute name="footer" />
</body>

<script type="text/javascript"
	src="/static/themes/v1/js/jquery-1.11.1.js?v=3"></script>
<script type="text/javascript"
	src="/static/themes/v1/js/jquery.lazy.min.js?v=3"></script>
<script type="text/javascript"
	src="/static/themes/v1/js/bootstrap.min.js?v=3"></script>
<script type="text/javascript"
	src="/static/themes/v1/js/jquery.slimscroll.min.js?v=3"></script>
<script type="text/javascript"
	src="/static/themes/v1/js/common.func.js?v=3"></script>
<script type="text/javascript" src="/static/themes/v1/js/common.js?v=3"></script>
<script type="text/javascript"
	src="/static/themes/v1/js/common.dev.js?v=3"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').DataTable({
			responsive : true
		});
	});
</script>
<style>
body {
background-color:#FFFFFF;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('click', '.btn-see-more.ajax', function(e) {
			var url = $(this).attr('href');
			$.ajax({
				type : 'GET',
				url : url,
				success : function(data) {
					console.log(data.next_page);
					if (data) {
						$('.products').append(data.html);
						if (data.next_page) {
							$('.btn-see-more').attr('href', data.next_page)
						} else {
							$('.btn-see-more').remove();
						}
						$("img.lazy").lazy({
							effect : "fadeIn"
						});
					}
				}
			});
			return false;
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('click', '.btn-see-more.ajax', function(e) {
			var url = $(this).attr('href');
			$.ajax({
				type : 'GET',
				url : url,
				success : function(data) {
					console.log(data.next_page);
					if (data) {
						$('.products').append(data.html);
						if (data.next_page) {
							$('.btn-see-more').attr('href', data.next_page)
						} else {
							$('.btn-see-more').remove();
						}
						$("img.lazy").lazy({
							effect : "fadeIn"
						});
					}
				}
			});
			return false;
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('click', '.btn-see-more.ajax', function(e) {
			var url = $(this).attr('href');
			$.ajax({
				type : 'GET',
				url : url,
				success : function(data) {
					console.log(data.next_page);
					if (data) {
						$('.products').append(data.html);
						if (data.next_page) {
							$('.btn-see-more').attr('href', data.next_page)
						} else {
							$('.btn-see-more').remove();
						}
						$("img.lazy").lazy({
							effect : "fadeIn"
						});
					}
				}
			});
			return false;
		});
	});
</script>
<script type="text/javascript"
	src="/static/themes/v1/js/swiper.jquery.min.js"></script>
<script type="text/javascript"
	src="/static/themes/v1/js/jquery.lazyload.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("img.lazy").lazyload({
			effect : "fadeIn"
		});

		var swiper = new Swiper('.slidehomepage', {
			nextButton : '.glyphicon-chevron-right',
			prevButton : '.glyphicon-chevron-left',
			loop : true,
			autoplay : 5000,
			speed : 800,
		});

		var swiper__group = new Swiper('.swiper__group', {
			pagination : '.swiper-pagination',
		});
	});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.searchPro')
								.on(
										'keyup',
										'#search input:text[name=word]',
										function(e) {
											var words = $(this).val();
											var url = 'https://glab.vn/product/search?word='
													+ words;
											$
													.ajax({
														type : 'GET',
														url : url,
														success : function(data) {
															var html = '';
															$
																	.each(
																			data.data,
																			function(
																					idx,
																					val) {
																				html += '<a href="https://glab.vn/product?word='
																						+ val.name
																						+ '" class="item">'
																						+ '<div class="name">'
																						+ val.name
																						+ ' </div><div class="numItems">1 items</div>'
																						+ '</a>';
																			});
															$('.suggestSearch')
																	.html(html);
														}
													});

										});
					});
</script>
</html>