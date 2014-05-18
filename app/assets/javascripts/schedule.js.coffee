schedule = ->
  $buttons = $('.togglers')

  $buttons.on 'click', ->
    target = $(this).data('target')
    $names = $(target)
    $names.toggle()
    _.each $names.parent(), (list) ->
      $list = $(list)
      if $list.children('li:visible').size() == 0
        $list.parents('.panel').toggle()

$(document).ready schedule
$(document).on "page:load", schedule
