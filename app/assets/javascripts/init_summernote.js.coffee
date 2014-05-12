# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('.summernote').length
    summerNote = $('.summernote')

    summerNote.summernote
      height: 300

    summerNote.code summerNote.val()

    summerNote.closest('form').submit ->
      summerNote.val summerNote.code()
      true