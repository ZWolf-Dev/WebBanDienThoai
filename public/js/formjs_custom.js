/**
* Tùy chỉnh javascript
**/
$(document).ready(function() {
    function NH_close(){
		if($('.NH_container .NH_close').length){
			$('.NH_container .NH_close i').on('click', function(){
				$('.NH_sideward_right').parent().addClass('off');
				$('.NH_sideward_right').parent().removeClass('on');	
			});
		}
	}
	NH_close();

	function NH_open(){
		if($('.test').length){
			$('.test').on('click', function(){
				$('.NH_sideward_right').parent().addClass('on');
				$('.NH_sideward_right').parent().removeClass('off');			
			});
		}
		$( '.NH-container-popup' ).on( 'click.break', function( event ) {
			var wrapper = $( '.NH_container' );
			wrapper.addClass( 'off' );
			wrapper.removeClass( 'on' );
		} );
	}
	NH_open();
	
	//Click event to scroll to top
    $('.back-top').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 800);
        return false;
    });
});
$(window).scroll(function() {
    if ($(this).scrollTop()) {
        $('.back-top').addClass('button-show');
    } else {
        $('.back-top').removeClass('button-show');
    }
});


$(document).ready(function(){
    $(window).scroll(function() {    
       var scroll = $(window).scrollTop();
       if (scroll > 100) {
            $(".headerSection-1").addClass("fix");
       } else {
        	$(".headerSection-1").removeClass("fix");
       }
    });
});
$(document).ready(function(){
    $(window).scroll(function() {    
       var scroll = $(window).scrollTop();
       if (scroll > 100) {
            $(".mb-menu-search").addClass("fix");
       } else {
        	$(".mb-menu-search").removeClass("fix");
       }
    });
});