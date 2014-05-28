require 'sanitize'

class ArticleDecorator < Draper::Decorator
  delegate_all
  SHORT_TEXT_LENGTH = 200

  def short_text
    only_text = Sanitize.clean(text)
    if  only_text.length > SHORT_TEXT_LENGTH
      only_text.slice(0, SHORT_TEXT_LENGTH).concat("...")
    else
      only_text
    end
  end

  def comments_count 
    subcomments_count = 0
    comments.each do |comment|
      subcomments_count += comment.subcomments.count
    end
    comments.count +  subcomments_count
  end
end
