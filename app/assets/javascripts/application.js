// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(function() {

$('#world_map a.person').each(function() {
  var top = parseInt($(this).css('top'));
  var left = parseInt($(this).css('left'));
  var width = parseInt($(this).css('width'));
  var height = parseInt($(this).css('height'));
  $(this).css('top', top-(height/2));
  $(this).css('left', left-(width/2));
});

$('#world_map a.person').hover(function() {
  $(this).find('.info').fadeIn('fast');
}, function() {
  $(this).find('.info').fadeOut('fast');
});



/*var hasntName = true;
$("#new_user #name").keydown(function() {
  hasntName = ($(this).val() == '');
  $("#draggable").draggable({ disabled: hasntName });
});

$("#draggable").mouseover(function() {
  if (hasntName) {
    alert('Type a name first');
  }
});*/

$("#draggable").draggable();

$( "#world_map" ).droppable({
  drop: function( event, ui ) {
    //alert(ui.offset.top);
    //alert(ui.offset.left);
    var latitude = ui.offset.top-90 - parseInt($("#draggable").css('height'))/2;
    var longitude = ui.offset.left-180 - parseInt($("#draggable").css('width'))/2;
    $.ajax({
      url: 'http://127.0.0.1:3000/user/create',
      data: { name: $("#new_user #name").val(), latitude: latitude, longitude: longitude },
      success: function() {
        alert('User created!');
        location.reload(true);
      }
    });
  }
});

/**/

});