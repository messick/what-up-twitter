// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function () {
  $container = $('.tweet-container');
  $loader = $('.loader');
  $searchTime = $('#search_time');

  $('#new_search').bind('ajax:before', function(e, data, status) {

    // if we're doing the profile search, change the browser URL
    username = $(e.currentTarget).find('#username').val();
    if (username !== undefined) {
      history.pushState('data', '', username);
    }

    $container.css('display', 'none');
    $container.empty();
    $loader.css('display', 'block');

  });

  $('#new_search').bind('ajax:success', function(e, data, status) {
    $loader.css('display', 'none');
    $.each(data.tweets, function(index, value) {
      $container.append(value.html);
    });
    $searchTime.html(data.searchTime);
    $container.css('display', 'inline-block');
  });
});

