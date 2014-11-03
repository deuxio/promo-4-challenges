// show popup at sartup
$(function() {
  $('#message').hide();
  $('#message').delay(500).slideDown();


  // disappear when click
  $('#message').on('click', function(event) {
    $('#message').delay(500).slideUp();
  })

  // re-appear when mouse is over #message-wrapper
  $('#message-wrapper').on('mouseenter', function(event) {
    $('#message').delay(500).slideDown();
  })
});