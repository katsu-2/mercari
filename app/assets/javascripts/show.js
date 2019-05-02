$(function(){
  $("img.owl").hover(function(){
    var src = $(this).attr('src');
    $("img#show-main-image").attr({src});
    $("img#show-main-image").hide();
    $("img#show-main-image").fadeIn(50);
    return false;
  });
});
