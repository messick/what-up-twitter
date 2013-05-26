// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function () {
  $container = $('.tweet-container');
  $loader = $('.loader');

  $('#profile_search').bind('submit', function(e) {
    username = $(e.currentTarget).find('#username').val();
    window.location = '/users/' + username
  });


  $('#new_search').bind('ajax:before', function(e, data, status) {
    $container.css('display', 'none');
    $container.empty();
    $loader.css('display', 'block');

  });

  $('#new_search').bind('ajax:success', function(e, data, status) {
    $loader.css('display', 'none');
    $.each(data, function(index, value) {
      $container.append(value.html);
    });
    $container.css('display', 'inline-block');
  });
});

