$(function () {

  function buildHtmlAddImage(data, blobUrl) {
    var html = `<div class="sell-dropbox-item">
                  <figure class="sell-upload-image">
                    <img id="file-preview" src="${blobUrl}">
                    <input name='item[images][]' type='hidden' value='${data.image_id}' multiple="multiple" id="item_images">
                  </figure>
                  <div class="sell-upload-edit-button">
                    <a href="">編集</a>
                    <a href class="sell-upload-image-delete">削除</a>
                  </div>
                </div>`
    return html;
  }

  $(".sell-upload-drop-file").on('change',  function(e) {
      var file = e.target.files[0];
      var formData = new FormData();
      formData.append('image', file);
      var blobUrl = window.URL.createObjectURL(file);
      $.ajax({
        type: "POST",
        url: "/items/upload_image",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false,
      })
      .done(function(data) {
        var html = buildHtmlAddImage(data,blobUrl);
        if($(".sell-dropbox-wrap").children().length < 6) {
          $(".sell-dropbox-wrap").prepend(html);
        } else {
          $(".sell-dropbox-upload-item").css("display", "none");
          $(".sell-dropbox-wrap").prepend(html);
        }
      })
      .fail(function(){
        alert("fail")
      })
      $('.sell-upload-drop-file').val('');
    });


    $(".sell-dropbox-wrap").on("click", ".sell-upload-image-delete",function(e) {
      e.preventDefault();
      var parent = $(this).parent().parent();
      parent.remove();
      if($(".sell-dropbox-wrap").children().length < 7) {
        $(".sell-dropbox-upload-item").css("display", "block");
      }
    });

    $(".sell-dropbox-upload-item").on("click", function(e){
      $('.sell-upload-drop-file').trigger('click');
    })

    if($(".sell-dropbox-wrap").children().length > 6) {
      $(".sell-dropbox-upload-item").css("display", "none");
    }

});
