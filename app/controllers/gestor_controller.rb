class GestorController < ApplicationController
  def index
  end

  def view_reports

    if request.post?
      temp_course = Course.new(params[:period])
      results = {}
      School.find(:all).each do |s|
        results[s.name] = []
        if (params[:balch]["school_#{s.id}"] == '1')
          conditions = ["deadline > ? and deadline < ?",
                        temp_course.period_from,
                        temp_course.period_to]
          if params[:include_current_period] == '1'
            conditions[0] << " or deadline > ? and deadline < ?"
            conditions << s.current_course.period_from
            conditions << s.current_course.period_to
          end
          ReportsWithDeadline.find(:all,
                                    :conditions => conditions).
                              select{|rwd| params[:selected_reports].member?(rwd.report_id.to_s)}.
                              each{|rwd| results[s.name] << rwd}
        end
      end
      render :partial => 'gestor/report_search_results',
             :object => results

    end
  end

  def create_reports
  end

  def monitor_students
  end

  def get_reports_for_user
    user_id = params.select {|k, v| v == nil && k.to_i.to_s == k}.first
    reports = Report.find(:all,
                          :conditions => {:user_type_id => user_id})

    render :partial => 'gestor/report_comboboxes',
           :locals => {:reports => reports}
  end

end
