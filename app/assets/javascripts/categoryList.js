$(function() {
  $("#header-nav__list li").hover(function() {
    $(this).children('ul').show();
  }, function() {
    $(this).children('ul').hide();
  });
});
