function onFail(err) {
  console.error(err)
}

function flashSuccess() {
  $('.pieces-show').prepend('<div class="alert alert-success alert-dismissable"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> Your video has been removed from YouTube. </div>')
  $('.youtube-player').remove();
  $('.youtube-icons .btn').remove();
  
}

$('.pieces-show').ready(function() {
  $('#yt-del').on('click', function() {
    var ytid = $('#yt-del').data('ytid')
    var pieceid = $('#yt-del').data('pieceid')
    $.ajax({
        method: 'POST',
        url: '/api/v1/youtube/delete',
        data: {ytid: ytid, pieceid: pieceid}
      })
    .done(flashSuccess)
    .fail(onFail)
  })
});
