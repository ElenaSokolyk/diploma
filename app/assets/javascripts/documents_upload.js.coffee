$ ->
  if $('.sub-form .documents-container').length
    $('.documents-container input[type="file"]').fileupload
      done: (event, data) ->
        $('.documents-container li.add-document').before HoganTemplates['document'].render(data.result.file)
      stop: (e, data) ->
        $('.progress-animated .bar').css 'width', '0%'

    $('.documents-container ul').on 'click', 'li a', (event) ->
      event.preventDefault()
      $.ajax
        method: 'POST'
        url: $(@).attr('href')
        data: 
          _method: 'DELETE'
        success: => 
          $(@).closest('li').remove()