// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  $('#new_search').bind('ajax:success', function (e, data, status) {
    console.log('success');
    $.each(data, function(index, value) {
      $('.tweet-container').append(value.html);
    });
  });
});
