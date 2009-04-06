module StudentReportsHelper
  def semestrial_report_navigation
    case current_user.user_type_id
    when 4
      reps = current_user.reports_with_deadlines.select {|rwd| rwd.report.report_type == 3}
      reps.map{|rwd| get_markup_for_rwd(rwd)}.to_a.join(' ')
    else
      'nothing here'
    end
  end
end
