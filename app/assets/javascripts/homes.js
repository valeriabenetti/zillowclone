// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  $('.clickable-heart').on('click', function(event) {
    $(this).css({color: 'red'})
  })
  $('.media-heading').on('click', function(event) {
    $(this).css({color: 'orange'})
  })

  $('#query').on('input', function(event) {
    let queryValue = $(this).val()

    console.log(`You are searching for ${queryValue}`)

    $.ajax({
      url: '/homes',
      data: { query: queryValue },
      dataType: 'script'
    })
  })
 })
