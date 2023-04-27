$(document).on('change', '#add_to_collection', function(){
  var image_id = $(this).data('image-id');
  var collection_id = $(this).val();

  $.ajax({
    url : `/images/${image_id}`,
    type : 'PATCH',
    data : { image: { collection_id: collection_id } },
    dataType:'json',
    success : function(data) {           
      alert('Collection updated.');
    },
    error : function(request,error) {
      alert(`Request: ${JSON.stringify(request)}`);
    }
  });
});


$(document).on('click', '#reveal-potd', function(event) {
  event.preventDefault()

  $(this).remove();

  var $potd = $('.picture-of-the-day');
  $potd.parent().removeClass('d-none');

  $.ajax({
    url : "/picture_of_the_day",
    type : 'GET',
    success : function(data) {
      $('.spinner-border').addClass('d-none');

      $potd.removeClass('d-none');
      $potd.find('img').attr('src', data['url']);
      $potd.find('.card-body .card-title').text(data['title']);
      $potd.find('.card-body a').attr('href', `/images/${data['id']}`);
    },
    error : function(request,error) {
      alert(`Request: ${JSON.stringify(request)}`);
    }
  });
});
