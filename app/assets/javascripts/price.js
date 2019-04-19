$(function () {

  var commission = 0.1;

  function insertComma(num) {
    num = String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')
    return num;
  }

  $("#item_price").on("keyup", function(){
    var price = $("#item_price").val();
    var commissionPrice = Math.round(price * commission);
    var profit = Math.round(price - (price * commission));

    profit = insertComma(profit);
    commissionPrice = insertComma(commissionPrice);

    if(price >= 300 && price < 10000000) {
      $(".comission-price").text( "¥" + commissionPrice);
      $(".profit").text( "¥" + profit);
    } else {
      $(".comission-price").text("-");
      $(".profit").text("-");
    }
  });
});
