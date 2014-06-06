$ ->
  if $('.summernote').length
    summerNote = $('.summernote')

    summerNote.summernote
      height: 300
      resize: false
      scroll: false

    summerNote.code summerNote.val()

    summerNote.closest('form').submit ->
      summerNote.val summerNote.code()
      true