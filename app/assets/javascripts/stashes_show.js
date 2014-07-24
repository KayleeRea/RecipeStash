function setupStash(stashes_path){
  $.getJSON(stashes_path, function(data) {
    if (data.stash) {
      $('.trash_it_button').show();
    } else {
      $('.stash_it_button').show();
    }
  });

  $('.trash_it_button a').on('click', function(event) {
    event.preventDefault();
    $.ajax(event.target.href, {
      dataType: 'json',
      type: 'DELETE',
      success: function(data) {
        $('.trash_it_button').hide();
        $('.stash_it_button').show();
      }
    });
  });
  $('.stash_it_button a').on('click', function(event) {
    event.preventDefault();
    var params = $(this).data();
    $.ajax(event.target.href, {
      dataType: 'json',
      data: {
        stash: {
          name: params.name,
          yummly_id: params.yummlyId,
          photo_url: params.photoUrl,
          recipe_url: params.recipeUrl
        }
      },
      type: 'POST',
      success: function(data) {
        $('.stash_it_button').hide();
        $('.trash_it_button').show();
      }
    });
  });
}
