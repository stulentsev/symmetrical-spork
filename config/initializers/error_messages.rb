 ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag =~ /<(input|label|textarea|select)/
      error_class = 'erro'
      nodes = Hpricot(html_tag)
      nodes.each_child { |node| node[:class] = node.classes.push(error_class).join(' ') unless !node.elem? || node[:type] == 'hidden' || node.classes.include?(error_class) }
      nodes.to_html
    else
      html_tag
    end
  end





  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  error_class = "erro"
  if html_tag =~ /<(input|textarea|select)[^>]+class=/
    class_attribute = html_tag =~ /class=['"]/
    html_tag.insert(class_attribute + 7, "#{error_class} ")
  elsif html_tag =~ /<(input|textarea|select)/
    first_whitespace = html_tag =~ /\s/
    html_tag[first_whitespace] = " class='#{error_class}' "
  end
  html_tag
end
