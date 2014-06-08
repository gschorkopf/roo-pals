schedule = ->
  $buttons = $('.togglers')

  $buttons.on 'click', ->
    target = $(this).find('a').data('stage')

    if target == '.all'
      $('.show').removeClass('hidden')
    else
      $toShow = $(target)
      $toHide = $('.show.hideable').not(target)
      $toShow.removeClass('hidden')
      $toHide.addClass('hidden')

  $add = $('.add-loading')

  $add.on 'click', ->
    $(this).addClass("disabled")
    $(this).text("Please Wait...")
    $(this).val("Please Wait...")

  $body = $('#app-body')

  $body.on 'click', ->
    if $('#navbarToggle.in').length > 0
      $('button.navbar-toggle').click()

$(document).ready schedule
$(document).on "page:load", schedule
