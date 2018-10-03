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


  //  Sets top position of mega menu based on dynamic header height

  $('.mega-menu').css('top', $('.header').height())



  /// displays the mega menu when the dropdown is hovered
  $( ".mega-menu-dropdown" ).hover(

    function() {

      var dropdownSelectorId = $(this).data('dropdown-selector');
      $( "#mega-menu-" + dropdownSelectorId ).addClass('display-mega-menu');

    }, function() {

      var dropdownSelectorId = $(this).data('dropdown-selector');
      $( "#mega-menu-" + dropdownSelectorId ).removeClass('display-mega-menu');

    }
  )


  // keeps the mega menu open when mega menu is hovered and keeps dropdown bg color active
  $( ".mega-menu" ).hover(

    function() {
      var megaMenuId = $(this).attr('id');
      $( "#" + megaMenuId ).addClass('display-mega-menu');

      var megaMenuData = $(this).data('mega-menu-id');
      $( "#drop-down-" + megaMenuData ).addClass("display-hover-background");

    }, function() {

      var megaMenuId = $(this).attr('id');
      $( "#" + megaMenuId ).removeClass('display-mega-menu');

      var megaMenuData = $(this).data('mega-menu-id');
      $( "#drop-down-" + megaMenuData ).removeClass("display-hover-background");
    }
  )





  // ~~~~~~~~ Creates Fading Flash Messages ~~~~~~~~

  $(".flash-message").bind('click', function () {
    $(".flash-message").fadeOut();
  });


  // ~~~~~~~~~~~~ SET CARDS TO SAME HEIGHT

  var maxTitleHeight = 0;

  $(".card-title").each(function(){
     if ($(this).height() > maxTitleHeight) { maxTitleHeight = $(this).height(); }
  });

  $(".card-title").height(maxTitleHeight);

  var maxSummaryHeight = 0;

  $(".card-summary").each(function(){
     if ($(this).height() > maxSummaryHeight) { maxSummaryHeight = $(this).height(); }
  });

  $(".card-summary").height(maxSummaryHeight);


});
