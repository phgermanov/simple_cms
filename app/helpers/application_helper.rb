module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def active_class(name)
    controller_name.eql?(name) ? "active" : ""
  end

  def status_tag(boolean, options = {})
    options[:true_text]  ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:true_text], :class => 'status false')
    end
  end
end
