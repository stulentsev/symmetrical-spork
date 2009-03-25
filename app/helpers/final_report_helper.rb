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
end
