function removeStash() {
  $(".remove").on('click', function (event) {
    event.preventDefault();
    var link = event.target;
    $.ajax({
      url: $(link).attr('href'),
      type: 'DELETE',
      dataType: 'json',
      contentType: "application/json",
      success: function (result) {
        $(link).parents('.recipe_bucket').fadeOut('fast', function () {
          $(link).parents('.recipe_bucket').remove()
        })
      }
    });
  })
}