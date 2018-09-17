$(document).on('turbolinks:load', function() {


  // ~~~~~~~~ Dynamically Moves Post#Show Images Based on HTML Content ~~~~~~~~
  // if post show is showing
  $("#temp-image-holder").children('img').each(function(index) {
    var newIndex = index + 1;
    $(this).appendTo('#image-holder-' + newIndex);
  });


  // Post FORMS -- shows how many characters are left in title.
  $('#post_title').on('keyup', function() {

    var titleLength = $("#post_title").val().length;
    var remainingChars = 60 - titleLength;

    $("#post_title_char_count").text("Title: " + remainingChars + " characters left");

  });

  // ~~~~~~~~ NAVIGATION ~~~~~~~~
  // ~~~~~~~~ Set spacer equal to headers height ~~~~~~~~

  var setSpacerHeight = function() {
    var height = $("#nav-bar-menu").height();
    $(".spacer").height(height);
  }

  setSpacerHeight(); // on init

  $(window).resize(function(){
    setSpacerHeight();
    MagicScroll.refresh(); // resets tag scroller
  });



  // ~~~~~~~~ Expands/Contracts Mobile Navigation ~~~~~~~~

  // resets scrolling upon refresh
  $('html, body').removeClass('disable-scrolling');

  // expand
  $("#nav-opener").click(function() {
    $('#overlay-menu').css('height', '100vh');

    $('html, body').addClass('disable-scrolling');

    $("#nav-opener").hide();

  });

  // contract
  $("#nav-closer").click(function() {
    $('#overlay-menu').css('height', '0%');

    $('html, body').removeClass('disable-scrolling');

    $("#nav-opener").show();

  });




  // ~~~~~~~~ Creates Fading Flash Messages ~~~~~~~~

  $(".flash-message").bind('click', function () {
    $(".flash-message").fadeOut();
  });


});
