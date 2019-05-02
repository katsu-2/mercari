$(function(){
  $("img.owl").hover(function(){
    $(this).css("opacity", "1");
    var src = $(this).attr('src');
    $("img#show-main-image").attr({src});
    $("img#show-main-image").hide();
    $("img#show-main-image").fadeIn(50);
    return false;
  },
  function(){
    $(this).css("opacity", "0.3");
  });
});
