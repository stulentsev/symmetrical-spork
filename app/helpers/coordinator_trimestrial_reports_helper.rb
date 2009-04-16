module CoordinatorTrimestrialReportsHelper
  def performance_field form, field
    form.select field, (1..10).to_a.map {|num| [num, num]}
  end

  def trimestrial_report_navigation
    items_markup = case current_user.user_type_id
    when 1, 2, 3
      reps = current_user.reports_with_deadlines.select {|rwd| rwd.report.report_type == 2}
      reps.map{|rwd| get_markup_for_rwd(rwd)}.to_a.join(' ')
    else # someone else (TODO: educando)
      'nothing here'
    end

    "<h5 class='fundo'>Navegação Rápida</h5><ul>#{items_markup}</ul>"
  end

end
