module ApplicationHelper


# None of the code in this file is mine, got it from : https://gist.github.com/suryart/7418454#gistcomment-1327611

# returns the correct bootstrap class depending on the message type supplied in the flash
def bootstrap_class_for flash_type
  { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
end

# puts together the html for displaying the flashmessage correctly
def flash_messages(opts = {})
  flash.each do |msg_type, message|
    concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
      concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
        concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
        concat content_tag(:span, 'Close', class: 'sr-only')
      end)
      concat message
    end)
  end
  nil
end
end
