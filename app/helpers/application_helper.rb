module ApplicationHelper
  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    html = '<div class="alert alert-danger"><ul>'
    resource.errors.full_messages.each do |message|
      html += "<li>#{message}</li>"
    end
    html += '</ul></div>'
    html.html_safe
  end
end
