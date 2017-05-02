// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {


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

  $('body').on('click', '.favorite-home', function(event) {
    let favorited = $(this).hasClass('favorited')

    $(this).toggleClass('favorited')

    let homeid = $(this).data('home-id') // data-home-id="....."

    console.log(`clicked on a heart for home ${homeid}`)

    let url = favorited ? `/homes/${homeid}/unfavorite` : `/homes/${homeid}/favorite`

    $.ajax({
      method: 'POST',
      url: url,
      dataType: 'script'
    })
  })

  $('body').on('click', '.sqFeet', function(event){
    let sqFeet = $(this).data('sqfeet')
    let sqMeters = $(this).data('sqmeters')

    if ($(this).data('show-meters') === 'true') {
      $(this).text('${sqFeet} Square Feet')
      $(this).data('show-meters', 'false')
    } else {
      $(this).text('${sqMeters} Square Meters')
      $(this).data('show-meters', 'true')
    }
  })
})
