module FinalReportHelper
  def numeric_edit_in_place(resource, field, options = {})
    options[:size] ||= 3

    edit_in_place(resource, field, options)
  end

  def textarea_edit_in_place(resource, field, options = {})
    options[:rows] ||= 10
    options[:cols] ||= 80
    options[:type] ||= :textarea

    edit_in_place(resource, field, options)
  end

  def bold_label form, field
    "<h4>#{form.label field}</h4>"
  end

  def final_report_item form, resource, field, options = {}
    item_func = options[:type] == :textarea ? method(:textarea_edit_in_place) : method(:numeric_edit_in_place)

    "
      <li>
          #{bold_label form, field}
          #{item_func.call resource, field, options}
          <hr/>
      </li>
    "
  end

  def final_report_items form, resource, items = []
    items.inject("") do |output, elem|
      output << final_report_item(form, resource, elem[0], :type => elem[1])
    end
  end

end
