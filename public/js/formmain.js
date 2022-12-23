$(document).ready(function () {
	$( 'body' ).append( "<div class='back-drop'></div>" );
	$('body').on('click', '.btn-toggle', function (e) {
        $(this).toggleClass('open');
        $(".content-toggle").toggle();
    });

	$('body').on('click', '.btn-toggle-nav', function (e) {
        $(this).toggleClass('open');
        $(".cont-toggle-nav").toggleClass('open');
		$('body').toggleClass('ovl-hidden');
		$('.back-drop').toggleClass('open');
    });
    $('body').on('click', '.back-drop', function (e) {
        $(this).toggleClass('open');
        $(".cont-toggle-nav").toggleClass('open');
		$('body').toggleClass('ovl-hidden');
		
    });

	$('body').on('click', '.btn-view-nav-left', function (e) {
        $(this).toggleClass('open');
        $(this).parent().parent().find(".block-nav-left-mobile").slideToggle(300)
		
		
    });
    $('body').on('click', '.btn-toggle-cont-box-left', function (e) {
        $(this).toggleClass('open');
        $(this).parent().parent().parent().find(".content-box-left").slideToggle(300)
        
        
    });
    
    $('body').on('click', '.btn-hide-toggle-sub-menu', function (e) {
        $(this).toggleClass('open');
        $(this).next().slideToggle(300)
        
        
    });
	$('body').on('click', '.btn-view-list', function (e) {
        
        $(".list-item").addClass('view-list');
		 $(".list-item-blogs").addClass('view-list');
        
        
    });
	$('body').on('click', '.btn-view-gird', function (e) {
        
        $(".list-item").removeClass('view-list');
		$(".list-item-blogs").removeClass('view-list');
        
        
    });
	$('body').on('click', '.view-style .btn-view', function (e) {
        
        $(".view-style .btn-view").removeClass('active');
		 $(this).addClass('active');
        
        
    });
  $('body').on('click', '.thub-image .item', function (e) {
        
        $(".thub-image .item").removeClass('active');
     $(this).addClass('active');
        
        
    });
  
  $('body').on('click', '.setting-theme a', function (e) {
        
        $(".setting-theme a").removeClass('active');
     $(this).addClass('active');
        
        
    });
  $('body').on('click', '.menu-active', function (e) {
        $(this).toggleClass('open');
        $("#Nav-mobile .nav_desktop ul").slideToggle(300)
    
    
    });
  $('body').on('click', '.btn-show-search', function (e) {
        $(this).toggleClass('open');
        $(".box-search").slideToggle(300)
    
    
    });
	

});

jQuery(function ($) {
    "use strict";
    var usualmenu = $("ul.sf-menu");
    if (usualmenu.length != 0) usualmenu.supersubs({
        minWidth: 18,
        maxWidth: 27,
        extraWidth: 1
    }).superfish({onBeforeShow: function() {
   if($(this).parents("ul").length > 1){
      var w = $(window).width();  
      var ul_offset = $(this).parents("ul").offset();
      var ul_width = $(this).parents("ul").outerWidth();
      ul_width = ul_width + 50;
      if((ul_offset.left+ul_width > w-(ul_width/2)) && (ul_offset.left-ul_width > 0)) {
         $(this).addClass('offscreen_fix');
      }
      else {
         $(this).removeClass('offscreen_fix');
      }
   };
}})
});

/*! WOW - v0.1.6 - 2014-03-19
* Copyright (c) 2014 Matthieu Aussaguel; Licensed MIT */(function(){var a,b=function(a,b){return function(){return a.apply(b,arguments)}};a=function(){function a(){}return a.prototype.extend=function(a,b){var c,d;for(c in a)d=a[c],null!=d&&(b[c]=d);return b},a.prototype.isMobile=function(a){return/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(a)},a}(),this.WOW=function(){function c(a){null==a&&(a={}),this.scrollCallback=b(this.scrollCallback,this),this.scrollHandler=b(this.scrollHandler,this),this.start=b(this.start,this),this.scrolled=!0,this.config=this.util().extend(a,this.defaults)}return c.prototype.defaults={boxClass:"wow",animateClass:"animated",offset:0,mobile:!0},c.prototype.init=function(){var a;return this.element=window.document.documentElement,"interactive"===(a=document.readyState)||"complete"===a?this.start():document.addEventListener("DOMContentLoaded",this.start)},c.prototype.start=function(){var a,b,c,d;if(this.boxes=this.element.getElementsByClassName(this.config.boxClass),this.boxes.length){if(this.disabled())return this.resetStyle();for(d=this.boxes,b=0,c=d.length;c>b;b++)a=d[b],this.applyStyle(a,!0);return window.addEventListener("scroll",this.scrollHandler,!1),window.addEventListener("resize",this.scrollHandler,!1),this.interval=setInterval(this.scrollCallback,50)}},c.prototype.stop=function(){return window.removeEventListener("scroll",this.scrollHandler,!1),window.removeEventListener("resize",this.scrollHandler,!1),null!=this.interval?clearInterval(this.interval):void 0},c.prototype.show=function(a){return this.applyStyle(a),a.className=""+a.className+" "+this.config.animateClass},c.prototype.applyStyle=function(a,b){var c,d,e;return d=a.getAttribute("data-wow-duration"),c=a.getAttribute("data-wow-delay"),e=a.getAttribute("data-wow-iteration"),a.setAttribute("style",this.customStyle(b,d,c,e))},c.prototype.resetStyle=function(){var a,b,c,d,e;for(d=this.boxes,e=[],b=0,c=d.length;c>b;b++)a=d[b],e.push(a.setAttribute("style","visibility: visible;"));return e},c.prototype.customStyle=function(a,b,c,d){var e;return e=a?"visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;":"visibility: visible;",b&&(e+="-webkit-animation-duration: "+b+"; -moz-animation-duration: "+b+"; animation-duration: "+b+";"),c&&(e+="-webkit-animation-delay: "+c+"; -moz-animation-delay: "+c+"; animation-delay: "+c+";"),d&&(e+="-webkit-animation-iteration-count: "+d+"; -moz-animation-iteration-count: "+d+"; animation-iteration-count: "+d+";"),e},c.prototype.scrollHandler=function(){return this.scrolled=!0},c.prototype.scrollCallback=function(){var a;return this.scrolled&&(this.scrolled=!1,this.boxes=function(){var b,c,d,e;for(d=this.boxes,e=[],b=0,c=d.length;c>b;b++)a=d[b],a&&(this.isVisible(a)?this.show(a):e.push(a));return e}.call(this),!this.boxes.length)?this.stop():void 0},c.prototype.offsetTop=function(a){var b;for(b=a.offsetTop;a=a.offsetParent;)b+=a.offsetTop;return b},c.prototype.isVisible=function(a){var b,c,d,e,f;return c=a.getAttribute("data-wow-offset")||this.config.offset,f=window.pageYOffset,e=f+this.element.clientHeight-c,d=this.offsetTop(a),b=d+a.clientHeight,e>=d&&b>=f},c.prototype.util=function(){return this._util||(this._util=new a)},c.prototype.disabled=function(){return!this.config.mobile&&this.util().isMobile(navigator.userAgent)},c}()}).call(this);

var wow = new WOW({
    	offset:100,        // distance to the element when triggering the animation (default is 0)
    	mobile:false       // trigger animations on mobile devices (default is true)
  	});
	wow.init();
	
	
// css menu tabs bo sung

(function( $ ) {
            
    function storeTabs($tabs, $destination) {
        // measure width
        $tabs.each(function() {
            var width = $(this).outerWidth(true);
            $(this).data('width', width);          
        });
        $tabs.prependTo($destination);
    }
            
    function makeTabsResponsive($element) {

        var $tabs = $element.find('li');
        var $firstTab = $tabs.first();

        var individualTabHeight = $firstTab.outerHeight();
        var tabsHeight = $element.outerHeight();

        if(tabsHeight > individualTabHeight) {
                    
            // get y pos of first tab
            var firstTabPos = $firstTab.offset();

            var thisTabPos;
            $tabs.each(function() {

                var $thisTab = $(this);

                thisTabPos = $thisTab.offset();

                if(thisTabPos.top > firstTabPos.top) {

                    var $dropdown = $element.find('.responsivetabs-more');
                            
                    if(!$dropdown.length) {
                        var dropdownMarkup = '<li class="dropdown responsivetabs-more">'
                        + '<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon  icon-menu"></i></a>'
                        + '<ul class="dropdown-menu">'
                        + '</ul>';
                        $dropdown = $(dropdownMarkup);
                        $element.append($dropdown);
                                
                    }
                            
                    var $previousTab = $thisTab.prev();
                    var $followingTabs = $thisTab.nextAll().not('.dropdown');

                    var $destination = $('.dropdown-menu', $dropdown);
                            
                    if(!$thisTab.hasClass('dropdown')) {
                        storeTabs($followingTabs, $destination);
                        storeTabs($thisTab, $destination);
                    }
                    storeTabs($previousTab, $destination);
                            
                    return;

                }

            });

        } else {
                

                
            // check if enough space to move a menu item back out of "..."


            // get parent width
            var parentWidth = $element.parent().width();
            var tabSetWidth = 0;
            var xPxAvailable;

            // calculate total width of tab set (can't just use width of ul because it is 100% by default)
            $element.children('li').each(function() {
                tabSetWidth += $(this).outerWidth(true);
            });

            // calculate available horizontal space
            xPxAvailable = parentWidth - tabSetWidth;


                    
            $element.find('.dropdown-menu li').each(function() {
                if($(this).data('width') <= xPxAvailable) {
                    $(this).insertBefore($element.find('.responsivetabs-more')); 
                    xPxAvailable -= $(this).data('width');
                } else {
                    return false;
                } 
            });

            // if no menu items left, remove "..."
            if(!$element.find('.dropdown-menu li').length) {
                $element.find('.responsivetabs-more').remove();
            }
        }

   
    }
  
            
    $.fn.responsiveTabs = function() {
                
        this.each(function() {
            var tabs = $(this);
            makeTabsResponsive(tabs); 
            $(window).resize(function() {
                makeTabsResponsive(tabs); 
            });                    
        });
                
        return this;
                
    };
            
})( jQuery );
$(function() {
            $('.nav_title').responsiveTabs();
        });

