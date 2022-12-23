
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbars");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}




$(document).ready(function() {
  $('.navbar a.dropdown-toggle').on('click', function(e) {
      var $el = $(this);
      var $parent = $(this).offsetParent(".dropdown-menu");
      $(this).parent("li").toggleClass('open');
      if (!$parent.parent().hasClass('nav')) {
          $el.next().css({
              "top": $el[0].offsetTop,
              "left": $parent.outerWidth() - 4
          });
      }
      $('.nav li.open').not($(this).parents("li")).removeClass("open");
      return false;
  });
});



