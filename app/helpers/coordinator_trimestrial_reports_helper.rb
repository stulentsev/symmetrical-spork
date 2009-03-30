module CoordinatorTrimestrialReportsHelper
  def performance_field form, field
    form.select field, (1..10).to_a.map {|num| [num, num]}
  end

end
