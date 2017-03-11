$(document).ready(function() {
    var maxHeight = 0;
    $(".caption").each(function(){
      if ($(this).height() > maxHeight) { maxHeight = $(this).height(); }
    });
    $(".caption").height(maxHeight);
  });
