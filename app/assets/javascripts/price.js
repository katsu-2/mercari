$(function () {

  var commission = 0.1;

  $("#item_price").on("keyup", function(){
    var price = $("#item_price").val();
    var commissionPrice = price * commission;
    var profit = price - (price * commission);

    profit = String(profit).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    commissionPrice = String(commissionPrice).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');

    if(price >= 300 && price < 10000000) {
      $(".comission-price").text( "¥" + commissionPrice);
      $(".profit").text( "¥" + profit);
    } else {
      $(".comission-price").text("-");
      $(".profit").text("-");
    }
  });
});
