# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  slides = $ '.main-slide.expandable'

  slide_toggle = (element) ->
    slide = element.closest '.main-slide'
    content = slide.next '.content'
    panel = content.next '.content-panel'

    if slide.is '.active'
      inactive_background_position_x = slide.data 'inactive-background-position-x'
      inactive_width = slide.data 'inactive-width'
      slide.removeClass 'active'

      panel.hide 'fast'
      content.animate height: 'toggle', 'slow', ->
        slide.animate width: inactive_width, backgroundPositionX: inactive_background_position_x, 'slow'
        slides.not(slide).animate width: 'toggle', 'slow'
    else
      active_background_position_x = slide.data 'active-background-position-x'
      active_width = slide.data 'active-width'
      slide.addClass 'active'

      slides.not(slide).animate width: 'toggle', 'slow'
      slide.animate width: active_width, backgroundPositionX: active_background_position_x, 'slow', ->
        content.animate height: 'toggle', 'slow'
        panel.show 'fast'

  slides.each (index, element) ->
    slide = $(element)
    content = slide.next '.content'
    panel = content.next '.content-panel'

    slide.children('a').on 'click', ->
      slide_toggle slide
      false

    panel.children('a').on 'click', ->
      slide_toggle slide
      false

$(document).ready(ready)
$(document).on('page:load', ready)
