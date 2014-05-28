schedule = ->
  $buttons = $('.togglers')

  $buttons.on 'click', ->
    target = $(this).data('target')
    $names = $(target)
    $names.toggleClass('hidden')
    _.each $names.parent(), (list) ->
      $list = $(list)
      if $list.children('li').not('.hidden').size() == 0
        $list.parents('.panel').addClass('hidden')
      else
        $list.parents('.panel').removeClass('hidden')

  $add = $('.add-loading')

  $add.on 'click', ->
    $(this).addClass("disabled")
    $(this).val("Please Wait...")

$(document).ready schedule
$(document).on "page:load", schedule
