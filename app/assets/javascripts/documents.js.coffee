$ ->
  if $('.documents-container, .articles-container').length
    $('.documents-container .title, .articles-container .title').on 'click', ->
      $(@).siblings('ul').slideToggle()
      $(@).find('.fa').toggleClass('fa-caret-down fa-caret-right')
      
  if $('a.fancy').length
    $('.fancy').fancybox()