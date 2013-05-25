// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  $('#new_search').bind('ajax:success', function (e, data, status) {
    container = $('.tweet-container');

    container.empty();
    $.each(data, function(index, value) {
      container.append(value.html);
    });
  });
});
