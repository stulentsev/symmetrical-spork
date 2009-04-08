module FinalReportHelper
  def numeric_edit_in_place(resource, field, options = {})
    options[:size] ||= 3

    edit_in_place(resource, field, options)
  end

  def textarea_edit_in_place(resource, field, options = {})
    options[:rows] ||= 15
    options[:cols] ||= 100
    options[:type] ||= :textarea

    edit_in_place(resource, field, options)
  end

  def bold_label form, field, alt_text = nil
    "<h4>#{form.label field, alt_text}</h4>"
  end

  def final_report_item form, resource, field, options = {}
    item_func = case options.delete(:type)
    when :textarea
      method(:textarea_edit_in_place)
    when :numeric
      method(:numeric_edit_in_place)
    else
      method(:edit_in_place)
    end

    alt_text = options.delete(:label)
    template = options.delete(:markup)
    label_markup = bold_label(form, field, alt_text) if alt_text != :no_label
    field_markup = item_func.call resource, field, options

    eval('"' + template + '"')
  end

  def final_report_items form, resource, items = [], options = {}
    items.inject("") do |output, elem|
      name, type, label, markup = elem
      opts = options.dup
      opts[:type] = type
      opts[:label] = label
      opts[:markup] = markup || '<li>#{label_markup}#{field_markup}<hr/></li>'
      output << final_report_item(form, resource, name, opts)
    end
  end

end
