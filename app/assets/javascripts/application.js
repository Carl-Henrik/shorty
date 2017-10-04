// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require clipboard
//= require bootstrap-sprockets
//= require data-confirm-modal
//= require_tree .

// Script adding clipboard functionality via gem https://github.com/sadiqmmm/clipboard-rails
$(document).on('ready turbolinks:load', function(){
  var clipboard = new Clipboard('.clipboard-btn');
});

// Script randomizing wich background image to show by changing the css
$(document).on('ready turbolinks:load', function(){
  var bgArray = ['1.jpg', '2.jpg','3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg','8.jpg', '9.jpg', '10.jpg', '11.jpg', '12.jpg', '13.jpg', '14.jpg'];
  var bg = bgArray[Math.floor(Math.random() * bgArray.length)];
  var path = '/bg/';
  var imageUrl = path + bg;
  $('body').css('background-image', 'url(' + imageUrl +')', 'no-repeat');
});
