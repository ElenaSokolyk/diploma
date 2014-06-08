class DocumentDecorator < Draper::Decorator
  delegate_all
  
  def document_icon
    document_type + '.png'
  end
end