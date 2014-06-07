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
  
  def upload_button(icon, form)
    content_tag :div, class: 'upload-button' do
      concat icon
      concat form.file_field(:file, 'data-url' => documents_path)
    end
  end
  
  def square(addition_class = nil)
    content_tag :div, class: "responsive-square #{addition_class}" do
      content_tag :div, class: 'square' do
        content_tag :div, class: 'content-wrapper' do
          capture_haml do
            yield
          end
        end
      end
    end
  end
end
