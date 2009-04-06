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
    item_func = options.delete(:type) == :textarea ? method(:textarea_edit_in_place) : method(:numeric_edit_in_place)
    alt_text = options.delete(:label)
    "
      <li>
          #{bold_label(form, field, alt_text) if alt_text != :no_label}
          #{item_func.call resource, field, options}
          <hr/>
      </li>
    "
  end

  def final_report_items form, resource, items = [], options = {}
    items.inject("") do |output, elem|
      name, type, label = elem
      opts = options.dup
      opts[:type] = type
      opts[:label] = label
      output << final_report_item(form, resource, name, opts)
    end
  end

end
