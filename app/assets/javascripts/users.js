//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  var delay=2700, setTimeoutConst;
  $('#navToggle').hover (function() {
    div = $(this);
    div.addClass("HoverBorder");
     setTimeoutConst = setTimeout(function(){
       $('#navMenu').toggle();
       div.toggleClass("navOpen")
     }, delay);
   }, function(){
     div.removeClass("HoverBorder");
     clearTimeout(setTimeoutConst );
  });
  $('#navToggle').click (function(){
    div = $(this);
    $('#navMenu').toggle();
    div.toggleClass("navOpen")
  })

  $('.modalClick').hover (function() {
    div = $(this);
    href = div.parent().attr("href");
    div.addClass("HoverBorder");
     setTimeoutConst = setTimeout(function(){
       window.location.href = href;
     }, delay);
   }, function(){
     div.removeClass("HoverBorder");
     clearTimeout(setTimeoutConst );
  });

});
