$(function () {

  function buildHtmlAddSelectCategoryChildren() {
    var html = `
                <div class="s--left__search__category__input__children category__relative">
                  <select class="input-default arrow-del category__children" name="q[category_children_id_eq]" id="q_category_id_eq">
                    <option value="">---</option>
                  </select>
                  <i class="fas fa-chevron-down s-icon arrow"></i>
                </div>
                `
    return html;
  }

  function buildHtmlAddSelectCategoryGrandChildren() {
    var html = `
                <div class="s--left__search__category__input__grand__children category__relative">
                  <select class="input-default arrow-del category__grand__children" name="q[category_grand_child_id_eq]" id="q_category_id_eq">
                    <option value="">---</option>
                  </select>
                  <i class="fas fa-chevron-down s-icon arrow"></i>
                </div>
                `
    return html;
  }

  function buildHtmlAddCategory(category) {
    var html = `
                <option value="${category.id}">${category.name}</option>
                `
    return html;
  }

  $(".category__parent").on("change", function(e) {
    $(".s--left__search__category__input__children").remove();
    $(".s--left__search__category__input__grand__children").remove();
    var category_id = $(this).val();
    var formData = new FormData();
    formData.append('category_id', category_id);
    $.ajax({
      type: "POST",
      url: "/searches/get_category",
      data: formData,
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      var html = buildHtmlAddSelectCategoryChildren();
      $(".s--left__search__category").append(html);

      data.forEach(function(category){
         var optionHtml = buildHtmlAddCategory(category);
         $(".category__children").append(optionHtml);
       });
    })
    .fail(function(data) {
      alert("fail")
    })
  })


  $(document).on("change", ".category__children", function(e) {
    $(".s--left__search__category__input__grand__children").remove();
    var category_id = $(this).val();
    var formData = new FormData();
    formData.append('category_id', category_id);
    $.ajax({
      type: "POST",
      url: "/searches/get_category",
      data: formData,
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      var html = buildHtmlAddSelectCategoryGrandChildren();
      $(".s--left__search__category").append(html);

      data.forEach(function(category){
         var optionHtml = buildHtmlAddCategory(category);
         $(".category__grand__children").append(optionHtml);
       });
    })
    .fail(function(data) {
      alert("fail")
    })
  })

});
