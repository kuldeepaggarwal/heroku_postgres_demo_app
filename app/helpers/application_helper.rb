module ApplicationHelper
  def render_flash_message
    flash_messages = []
    flash.each do |type, message|
      Array(message).each do |msg|
        flash_messages << content_tag(:div, msg, class: "alert fade in #{ type }") if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
