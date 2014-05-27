$ ->
  if $('#new_comment').length
    $(document).on 'click', '.reply', (event) ->
      subcomments = $(@).parent().siblings('.subcomments')
      unless subcomments.find('.subcomment-form').length
        appendSubcommentForm $(@), subcomments
      toggleSubcomments subcomments
      
    $(document).on 'click', '.replies', (event) ->
      subcomments = $(@).parent().siblings('.subcomments')
      if subcomments.find('.comment').length
        $(@).find('.fa').toggleClass 'fa-caret-down fa-caret-right'
        toggleSubcomments subcomments
        
    appendSubcommentForm = (reply, subcomments) ->
      form = $('.main-comment-form').clone()
      form.toggleClass 'main-comment-form subcomment-form'
      form.find('#comment_commentable_type').val 'Comment'
      form.find('#comment_commentable_id').val reply.data('comment')
      subcomments.append form
      
    hideSubcomments = (element) -> element.hide(300)

    toggleSubcomments = (element) -> element.show(300)
        
    toggleSubcomments = (element) -> element.toggle(300)
    
    updateRepliesCount = (element, data) -> element.text "#{data} replies"
    
    findRepliesFromEvent = (event) ->
      $(event.currentTarget).parents('.subcomments').siblings('.content-wrapper').find('.replies .text')
    
    $(document).on 'ajax:success', '.subcomment-form', (event, data, status, xhr) ->
      updateRepliesCount findRepliesFromEvent(event), data.siblings_count
      $(event.currentTarget).before HoganTemplates['subcomment'].render(data)
      $('#comment_text').val('')
    
    $(document).on 'ajax:success', '.main-comment-form', (event, data, status, xhr) ->
      $(event.currentTarget).before HoganTemplates['comment'].render(data)
      $('#comment_text').val('')
      
    $(document).on 'ajax:success', '.remove-comment', (event, data, status, xhr) ->
      updateRepliesCount findRepliesFromEvent(event), data.siblings_count
      $(event.currentTarget).parents('.comment:first').remove()