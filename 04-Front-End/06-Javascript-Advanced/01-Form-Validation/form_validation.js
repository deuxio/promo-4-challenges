var zipCodeRegExp = /^\d{5}$/g
var emailRegExp = /^\w+@\w+\.\w{2,3}$/g
var phoneRegExp = /^(0|\+33)(6|7)(?:\.|-| )?\d{2}(?:\.|-| )?\d{2}(?:\.|-| )?\d{2}(?:\.|-| )?\d{2}(?:\.|-| )?$/g

function formValid() {
  // Check all text filled
  if ($('input[type=text]').filter(function() { return this.value == ""; }).length > 0) {
    return false;
  }
  // Check zipcode pattern
  if(! zipCodeRegExp.test( $('#zip_code').val() ) ) {
    return false;
  }
  // Check email pattern
  if(! emailRegExp.test( $('#email').val() ) ) {
    return false;
  }
  // TOS checked
  if (!$('#tos').is(":checked")) {
    return false;
  }
  // Check mobile Phone pattern
  if(! phoneRegExp.test( $('#mobile_phone').val() ) ) {
    return false;
  }
  return true;
}

function enableButton() {
  if (formValid()) {
    $( "button" ).removeProp('disabled');
  } else {
    $( "button" ).attr('disabled', true);
  }
}

$('input, textarea').on('focusout change', enableButton);
