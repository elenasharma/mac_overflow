//CR - your JS files are all compiled into one - so each ready function s
//run at the intial page load.  It is much more readable to have
//separate files for each model (response, questions, answers) and
//a single document.ready method that initializes all aspect of
//the application.

//Make actual Controller/View (and when necessary Model) objects
//(either with Object Literal or Constructor Functions)

var ready;
ready = function() {

  // Controller

  $('.signin_link').click(function() {
    showSignin();
  })
  $('.login_link').click(function() {
    showLogin();
  });

  $('.background').click(function() {
    hideSignin();
    hideLogin();
  })


  // View

  var showSignin = function() {
    $('.background, .signin_lightbox').fadeIn('slow');
  }

  var hideSignin = function() {
    $('.background, .signin_lightbox').hide();
  }

  var showLogin = function() {
    $('.background, .login_lightbox').fadeIn('slow');
  }

  var hideLogin = function() {
    $('.background, .login_lightbox').hide();
  }

  hideSignin();
  hideLogin();

};

$(document).ready(ready);
$(document).on('page:load', ready)
