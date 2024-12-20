$(document).ready(function () {
    $.fn.dropdown = function (options) {

        return this.each(function() {
            var defaults = {
                selectedValue: false,
                hideWhenSelected: true,
                load: function() {},
                beforeOpen: function() {},
                closeCallBack: function() {},
                closeWhenSelectVal: function () {}
            },
            sc = {},
            el = $(this),
            itemClick = el.find('.val-selected'),
            txtItemClick = itemClick.find('.txt-selected'),
            itemDropClick = el.find('.dropdown__inner a');

            if ( el.length == 0 ) return el;

            sc.settings = $.extend({}, defaults, options);

            itemClick.unbind('click');
            itemClick.on('click', toggleView);

            showSortLoad();

            if ( sc.settings.selectedValue ) {
                selectItem();
            }

            //itemDropClick.unbind('click');
            itemDropClick.on('click', function (e) {
                var validateURL = validateURL($(this).attr('href'));
                if ( validateURL ) {
                    window.location = $(this).attr('href');
                }
                e.preventDefault();
                sc.settings.closeWhenSelectVal($(this), el);
                itemClick.trigger('click');
            });

            function validateURL(textval) {
                var urlregex = /^(https?|ftp|http?):\/\/([a-zA-Z0-9.-]+(:[a-zA-Z0-9.&%$-]+)*@)*((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}|([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|vnn|[a-zA-Z]{2}))(:[0-9]+)*(\/($|[a-zA-Z0-9.,?'\\+&%$#=~_-]+))*$/;
                var urlregex = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
                return urlregex.test(textval);
            }

            // set value input when reload page
            function showSortLoad () {
                if ( el.hasClass('price-area') ) {
                    renderPriceArea.updateHidden(el);
                    return;
                }
                if ( el.find('input[type=hidden]').val() !== undefined ) {
                    var valInputHidden = el.find('input[type=hidden]').val();
                    itemDropClick.each(function () {
                        var _this = $(this),
                            dataValue = _this.data('value'),
                            txtItem = _this.text();

                        dataValue = typeof dataValue === "number" ? ""+dataValue+"" : dataValue ;

                        if ( valInputHidden === dataValue ) {
                            if ( itemClick.find('.get-val').length ) {
                                itemClick.find('.get-val').text(txtItem);
                            }else {
                                itemClick.text(txtItem);
                            }
                        }
                    });
                }
            }

            // toggle show and hide
            function toggleView (e) {
                e.preventDefault();
                var _this = $(this);

                if ( _this.hasClass('active') ) {
                    _this.removeClass('active');
                    el.find('.dropdown-up-style').removeClass('active');
                    setTimeout(function() {
                        el.find('.dropdown-up-style').addClass('hide');
                    },250);
                    sc.settings.closeCallBack(el);
                }else {
                    _this.addClass('active');
                    el.find('.dropdown-up-style').removeClass('hide');
                    setTimeout(function() {
                        el.find('.dropdown-up-style').addClass('active');
                    },50);
                    sc.settings.beforeOpen(el);
                }
            }

            // show item when click in dropdown
            function selectItem () {
                //itemDropClick.unbind('click');
                itemDropClick.on('click', function (e) {
                    e.preventDefault();
                    var _this = $(this),
                        txtClick = _this.text(),
                        valSelected = _this.data('value');

                    itemDropClick.removeClass('active');
                    _this.addClass('active');
                    if ( itemClick.find('.get-val').length ) {
                        itemClick.find('.get-val').text(txtClick);
                    }else {
                        txtItemClick.text(txtClick);
                    }
                    el.find('input[type=hidden]').val(valSelected);
                    //itemClick.trigger('click');
                });
            }

            hideElOutSite(el, function () {
                el.find('.val-selected').removeClass('active');
                el.find('.dropdown-up-style').removeClass('active');
                setTimeout(function() {
                    el.find('.dropdown-up-style').addClass('hide');
                },250);
            });

        });
    }

    $.fn.loading = function (options) {

        return this.each(function() {
            var defaults = {
                inside_left: false,
                left: 10,
                inside_right: false,
                right: 10,
                full: true,
                elLoading: '<div class="loading"><span></span></div>',
                remove: false,
                done: function () {}
            },
            sc = {},
            settings,
            el = $(this);

            if ( el.length == 0 ) return el;

            settings = $.extend({}, defaults, options);

            if ( settings.remove ) {
                el.find('.loading').addClass('remove-loading');
                setTimeout(function () {
                    el.find('.loading').remove();
                }, 220);
                return;
            }

            el.css({
                position: 'relative'
            });

            el.append( $(settings.elLoading) );

            if ( settings.inside_left ) {
                el.find('.loading').css({
                    left: settings.left+'px',
                });
            }else if ( settings.inside_right ) {
                el.find('.loading').css({
                    right: settings.right+'px',
                });
            }else { //default settings.full === true
                if ( el.is('body') ) {
                    el.find('.loading').css({
                        position: 'fixed'
                    });
                }
                el.find('.loading').css({
                    height: '100%',
                    width: '100%',
                    top: 0,
                    left: 0,
                    'margin-top': 0,
                    'background-color': 'rgba(0, 0, 0, 0.26)'
                });
                el.find('.loading span').css({
                    position: 'absolute',
                    left: '50%',
                    top: '50%',
                    'margin-top': '-10px',
                    'margin-left': '-10px'
                });
            }
        });
    }
});