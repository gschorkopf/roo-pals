scrollUp = ->
  $link = $('#scrollToTop')
  $link.on 'click', ->
    $("html, body").animate
      scrollTop: 0
    , 800
    false

  $(window).scroll ->
    if $(this).scrollTop() > 200
      $("#scrollToTop").fadeIn()
    else
      $("#scrollToTop").fadeOut()

$(document).ready scrollUp
$(document).on "page:load", scrollUp
