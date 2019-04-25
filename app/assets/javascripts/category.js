$(function () {

  function buildHtmlAddSelectCategoryChildren() {
    var html = `
                <div class="select-wrap-category-children">
                  <select class="select-default category-children" name="item[category_id]" id="item_category_id">
                    <option value="">---</option>
                  </select>
                  <i class="fa fa-angle-down"></i>
                </div>
                `
    return html;
  }

  function buildHtmlAddSelectCategoryGrandChildren() {
    var html = `
                <div class="select-wrap-category-grand-children">
                  <select class="select-default category-grand-children" name="item[category_id]" id="item_category_id">
                    <option value="">---</option>
                  </select>
                  <i class="fa fa-angle-down"></i>
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

  $(".category-parent").on("change", function(e) {
    $(".select-wrap-category-children").remove();
    $(".select-wrap-category-grand-children").remove();
    var category_id = $(this).val();
    var formData = new FormData();
    formData.append('category_id', category_id);
    $.ajax({
      type: "POST",
      url: "/items/get_category_id",
      data: formData,
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      var html = buildHtmlAddSelectCategoryChildren();
      $(".form-group-category").append(html);

      data.forEach(function(category){
         var optionHtml = buildHtmlAddCategory(category);
         $(".category-children").append(optionHtml);
       });
    })
    .fail(function(data) {
      alert("fail")
    })
  })


  $(document).on("change", ".category-children", function(e) {
    $(".select-wrap-category-grand-children").remove();
    var category_id = $(this).val();
    var formData = new FormData();
    formData.append('category_id', category_id);
    $.ajax({
      type: "POST",
      url: "/items/get_category_id",
      data: formData,
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      var html = buildHtmlAddSelectCategoryGrandChildren();
      $(".form-group-category").append(html);

      data.forEach(function(category){
         var optionHtml = buildHtmlAddCategory(category);
         $(".category-grand-children").append(optionHtml);
       });
    })
    .fail(function(data) {
      alert("fail")
    })
  })

})
