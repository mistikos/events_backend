$ ->
  $('.event-show-hover').hover(
    ->
      $(@).closest('.item-event').find('.event-show-hover').fadeTo( "fast", 1 )
    ->
      $(@).fadeTo( "fast", 1)
      $(@).closest('.item-event').find('.event-show-hover').fadeTo( "fast", 0)
    )