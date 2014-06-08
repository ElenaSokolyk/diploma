$ ->
  if $('.documents-container').length
    $('.documents-container .title').on 'click', ->
      $(@).siblings('ul').slideToggle()
      $(@).find('.fa').toggleClass('fa-caret-down fa-caret-right')
      
  if $('a.fancy').length
    $('.fancy').fancybox()