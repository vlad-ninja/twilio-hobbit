$(document).ready(function() {
  $('#send-sms').click(function(e) {
    e.preventDefault();
    var phone = $('#phone').val();

    if (phone) {
      toogleLoadingScreen();

      $.post('/send_sms/' + phone, function(data) {
        showMessage('<p class="success">SMS is sent!</p>');
      }).fail(function() {
        showMessage('<p class="error">Phone number is incorrect..</p>');
      }).always(function() {
        toogleLoadingScreen();
      })

    } else {
      showMessage('<p class="error">Please enter phone number..</p>');
    }
  });

  function showMessage(message) {
    $('#result').html(message).show();
  }

  function toogleLoadingScreen() {
    $('#loading').toggle();
  }
});
