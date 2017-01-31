$(document).ready(function () {
  $('.alert').fadeIn(function() {
    setTimeout(function() {
      $('.alert').fadeOut();
    }, '3000');
  });
});
