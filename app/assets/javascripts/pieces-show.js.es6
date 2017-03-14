$('.pieces-show').ready(function() {
  $('#yt-del').on('click', function() {
    deleteVid();
  })
  $('#yt-like').on('click', function() {
    likeVid();
  })
  $('#yt-dislike').on('click', function() {
    dislikeVid();
  })
  $('#yt-comments').on('click', function() {
    if ($('#yt-comments').data('status') == 'showing') {
      clearComments();
      $('#yt-comments').data('status', 'hiding');
    } else {
      fetchComments();
      $('#yt-comments').data('status', 'showing');
    };
  });
});

function fetchComments() {
  var ytid = $('#yt-comments').data('ytid')
  $.ajax({
      method: 'GET',
      url: '/api/v1/youtube/comments',
      data: {ytid: ytid},
      success: function(data) {
        populateComments(data);
      }
  })
};

function deleteVid() {
  var ytid = $('#yt-del').data('ytid')
  var pieceid = $('#yt-del').data('pieceid')
  $.ajax({
      method: 'DELETE',
      url: '/api/v1/youtube/delete',
      data: {ytid: ytid, pieceid: pieceid}
    })
  .done(clearScreen)
  .then(flashSuccess('clear'))
  .fail(onFail)
}

function likeVid() {
  var ytid = $('#yt-like').data('ytid')
  var pieceid = $('#yt-del').data('pieceid')
  $.ajax({
      method: 'PATCH',
      url: '/api/v1/youtube/like',
      data: {ytid: ytid, pieceid: pieceid}
    })
  .done(flashSuccess('like'))
  .fail(onFail)
}

function dislikeVid() {
  var ytid = $('#yt-dislike').data('ytid')
  var pieceid = $('#yt-del').data('pieceid')
  $.ajax({
      method: 'PATCH',
      url: '/api/v1/youtube/dislike',
      data: {ytid: ytid, pieceid: pieceid}
    })
  .done(flashSuccess('dislike'))
  .fail(onFail)
}

function populateComments(data) {
  var comments = data
  $('.comments').append(`<div class="panel-group"><h3>Top Comments:</h3><p>(reclick comment button to remove)</p>`)

  comments.forEach(function(comment) {
    $('.comments').append(`<div class="panel panel-default"><div class="panel-body">${comment}</div></div>`)
  })
}

function clearComments() {
  $('.comments').children().remove()
}

function clearScreen() {
  $('.youtube-player').remove();
  $('.youtube-icons .btn').remove();
  $('.col-md-6').append(`<form class="testytesty" method="get" action="${pathName}/youtube_uploads/new"><input class="btn btn-primary" type="submit" value="Upload Video"></form>`)
}

function flashSuccess(method) {
  var pathName = window.location.pathname
  if (method == "clear") {
    clearFlash();
    $('.pieces-show').prepend('<div class="alert alert-success alert-dismissable"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> Your video has been removed from YouTube. </div>')
  } else if (method == "like") {
    clearFlash();
    $('.pieces-show').prepend('<div class="alert alert-success alert-dismissable"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> Video liked. </div>')
  } else {
    clearFlash();
    $('.pieces-show').prepend('<div class="alert alert-success alert-dismissable"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> Video disliked. </div>')
  }
}

function clearFlash() {
  $('.alert.alert-success.alert-dismissable').remove()
}

function onFail(err) {
  console.error(err)
}
