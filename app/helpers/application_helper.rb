module ApplicationHelper
  def body_attributes
    {class: body_class, id: body_id}
  end

  def body_class
    [controller.controller_name.dasherize]
  end

  def body_id
    "#{controller.controller_name.dasherize}-#{controller.action_name.dasherize}"
  end
  
  def upload_button(text, button)
    content_tag :span, class: 'upload-button' do
      concat text
      concat button
    end
  end
end
