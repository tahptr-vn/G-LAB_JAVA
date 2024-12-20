// JavaScript Document
$(document).ready(function () {

    /* MENU MOBILE*/
    $('#togger__menu, #menu__mobi .close__menu').on('click', function(e){
        toggleMenuMobile(e);
        var $wrap = $('body');
        if ($wrap.hasClass('activeMenu')) {
            $('#wrapper').append('<span class="backdropMenu"></span>');
            $('#wrapper .backdropMenu').on('click', function(e){
                toggleMenuMobile(e);
            });
        }else {
            $('#wrapper .backdropMenu').off('click', toggleMenuMobile);
            $('#wrapper').find('.backdropMenu').remove();
        }
    });

    function toggleMenuMobile(e) {
        e.preventDefault();
        var $wrap = $('body');
        $wrap.toggleClass('activeMenu');
    }

    var wMenuTotal = 0,
        arrPrev = [],
        $wrap = $('#menu__mobi .menu__items--inner'),
        countSub = 0,
        wMenuMobile = 280;

    $('#menu__mobi .menu__items--inner li a').on('click', function(e){
        return true;
        /*var _this = $(this),
            txt = _this.text(),
            $parent = _this.parent(),
            $ul = $parent.find('>ul');
        if ($ul.length > 0) {
            e.preventDefault();
            var $prev = $('<li class="prev__menu"><a href=""><span class="icon-navigate_before"></span><span class="txtPrev"></span></a></li>');

            wMenuTotal += wMenuMobile;
            countSub += 1;

            $prev.find('.txtPrev').text(txt);
            $prev.find('a').attr('data-subkey', countSub);
            $prev.find('a').on('click', prevMenu);

            arrPrev.unshift($prev);
            for (var i = 0, len = arrPrev.length; i < len; i++) {
                $ul.prepend(arrPrev[i]);
            }

            $ul.attr('data-subkey', countSub).show();

            $wrap.css({
                transform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)',
                MozTransform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)',
                WebkitTransform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)',
                msTransform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)'
            });
        }*/
    });

    function prevMenu(e) {
        e.preventDefault();
        var _this = $(this),
            dataKey = Number(_this.data('subkey')),
            $prevEl = $('ul[data-subkey='+(dataKey-1)+']');

        wMenuTotal -= wMenuMobile*(arrPrev.length-dataKey+1);
        arrPrev.splice(arrPrev.length-dataKey, 1);

        if ($prevEl) {
            for (var i = 0, len = arrPrev.length; i < len; i++) {
                $prevEl.prepend(arrPrev[i]);
            }
        }

        countSub -= 1;

        $wrap.css({
            transform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)',
            MozTransform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)',
            WebkitTransform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)',
            msTransform: 'translate3d(-'+wMenuTotal+'px, 0px, 0px)'
        });

        setTimeout(function(){
            _this.closest('ul').hide();
            _this.parent().remove();
            if (wMenuTotal === 0) {
                arrPrev = [];
                countSub = 0;
                $('#menu__mobi .menu__items--inner ul .prev__menu').remove();
                // $('#menu__mobi .menu__items--inner ul li>ul').removeAttr('data-subkey').hide();
            }
        },310);
    }
    /* END MENU MOBILE*/

    /* TOGGLE CHOSE SIZE PRODUCT DETAIL */
    $('.dropdownChooseSize .val-selected').on('click', function(e){
        e.preventDefault();
        var $parent = $(this).parent();
        $(this).toggleClass('active');
        $parent.find('.chooseSize').toggleClass('active');
    });
    $('.chooseSizeInner a').on('click', function(e){
        e.preventDefault();
        var getDataSize = $(this).find('.detail__size').data('size'),
            getDataSizeValue = $(this).find('.detail__size').data('size-value'),
            getPrice = $(this).find('.detail__size').data('price');
            getNewStatus = $(this).find('.detail__size').data('new-status');
            getTxtSize = $(this).find('.detail__size').text(),
            getTxtPrice = $(this).find('.detail__price').text(),
            getDataProduct = $(this).find('.detail__size').data('product'),
            getDataDetail = $(this).find('.detail__size').data('detail');
        $('#val-size').val(getDataSize);
        $('#val-sizeValue').val(getDataSizeValue);
        $('#val-product').val(getDataProduct);
        $('#val-price').val(getPrice);
        $('#val-newStatus').val(getNewStatus);

        /* no need check*/
        /*
        if(parseInt(getNewStatus) == 0){
            $('.alert-used').removeClass('hide');
        }else{
            $('.alert-used').addClass('hide');
        }
        */
        //append choose size and price
        var $getVal = $('.dropdownChooseSize .val-selected .get-val'),
            htmlAppend = '<span class="icon-uniF335"></span><span class="txtPrice">'+getTxtPrice+'</span><span class="txtSize">Size '+getTxtSize+'</span>';
        $getVal.html(htmlAppend);

        $('.dropdownChooseSize .get-val .icon-uniF335').on('click', function(e){
            e.preventDefault();
            var $parent = $(this).parent();
            $parent.html('choose your size');
            $('#val-size').val('');
            $('#val-product').val('');
        });

        $('.dropdownChooseSize .val-selected').removeClass('active');
        $('.dropdownChooseSize .chooseSize').removeClass('active');
    });

    hideElOutSite('.dropdownChooseSize .val-selected', function() {
        $('.dropdownChooseSize .val-selected').removeClass('active');
        $('.dropdownChooseSize .chooseSize').removeClass('active');
    });
    /* END TOGGLE CHOSE SIZE PRODUCT DETAIL */


    if($('#container .lazy').length > 0){
        $('#container .lazy').lazy();
    }

    $('.detail__desc .btn-buy').on('click', addCart);

    if($('.header__left .dropdown').length > 0){
        $('.header__left .dropdown').dropdown();
    }

	var hWindow,
		hHeader,
		hSlideHome;

	$(window).on('resize', function () {
		hWindow = $(window).outerHeight();
		hHeader = $('header').outerHeight();
		hSlideHome = hWindow - hHeader;
	}).trigger('resize');
	
	$('#menu-open').click(function (e) {
        $('#menu').addClass('active');
        setTimeout(function () {
            $('body').addClass('menu-left');
        }, 100);
    });

	$('#menu-close').click(function () {
		$('body').removeClass('menu-left');
        setTimeout(function () {
            $('#menu').removeClass('active');
        }, 100);
	});

	hideElOutSite('#menu, #menu-open', function() {
		$('body').removeClass('menu-left');
        setTimeout(function () {
            $('#menu').removeClass('active');
        }, 100);
	});

	var flagCheck = false, timeoutRemove;
	$(window).on('scroll', function () {
		var valScroll = $(this).scrollTop();
		
        if (valScroll > hHeader+50) {
			if (flagCheck) return;
			$('header').addClass('active-before');
			timeoutRemove = setTimeout(function () {
				$('header').addClass('active');
			}, 500);
			flagCheck = true;
		}else {
			flagCheck = false;
			clearTimeout(timeoutRemove);
			$('header').removeClass('active');
			$('header').removeClass('active-before');
		}        
	});

    if($('.auth__user .dropdown, .header__cart').length > 0) {
        $('.auth__user .dropdown, .header__cart').dropdown();
    }

	hideElOutSite('.header__right .frm-icon, .auth__user', function (e) {
        var wWin = $(window).outerWidth();
        if (wWin <= 992) {
            $('.auth__user').removeClass('show__auth--user');
        }
        $('form.search').removeClass('show__sub--search');
        $('.toggle__auth').removeClass('active');
	});

	$('#menu li.has-sub > a').on('click', function (e) {
		e.preventDefault();
		$('#menu li.has-sub').removeClass('sub-open');
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
		}else {
			$(this).addClass('active');
			$(this).parent().addClass('sub-open');
		}
	});

	$('.filterToggle').on('click', function(e) {
	    e.preventDefault();
	    $(this).addClass('active');
	    $('body').css({
            height: hWindow+'px',
        }).toggleClass('filterActive');
    });

	$('.filterClose').on('click', function(e) {
        e.preventDefault();
        $('body').removeClass('filterActive').removeAttr('style');
        $('.filterToggle').removeClass('active');
    });

    hideElOutSite('.menuFilter, .filterToggle', function() {
        $('body').removeClass('filterActive').removeAttr('style');
        $('.filterToggle').removeClass('active');
    });

    $('.filterItems').on('scroll', function(e) {
        e.preventDefault();
        var valScroll = $(this).scrollTop();
        valScroll > 0 ? $('.filterIcon').addClass('shadowBottom') : $('.filterIcon').removeClass('shadowBottom');
    });

    $('.menuFilter .filterItem>a').on('click', function(e){
        e.preventDefault();
        var $root = $(this).parent();
        $root.toggleClass('active');
    });


    // start show search form
    $('.header__right--mbsearch, #closeSearch').on('click', function(e) {
        e.preventDefault();
        var elSearchPro = $('.searchPro');
        if (elSearchPro.is(':visible')) {
            elSearchPro.hide();
        }else {
            elSearchPro.show();
            $('.searchPro #search input').focus();
        }
    });
    // end start show search form
});

function addCart(e) {
    var body = $("html, body");

    body.stop().animate({scrollTop:0}, '1000', 'swing', function() {
        //callback finish animate
        $('.header__cart--num').addClass('active');
        setTimeout(function () {
            $('.header__cart--num').removeClass('active');
        }, 250);
    });
}

function checkMobile () {
	var wW = $(window).outerWidth();
	if (wW <= 768) {
		return true;
	}
	return false;
}

function hideElOutSite (el, callBackItem) {
    $(document).on('click', function (e) {
        var container = $(el);
        if ( !container.is(e.target) && container.has(e.target).length === 0 ) {
            callBackItem(e);
        }
    });
}
