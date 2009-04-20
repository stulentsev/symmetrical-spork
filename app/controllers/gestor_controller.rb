class GestorController < ApplicationController
  def index
  end

  def view_reports
  end

  def create_reports
  end

  def monitor_students
  end

  def report_search_results
    temp_course = Course.new(params[:period])
    @report_search_results = {}
    School.find(:all).each do |s|
      @report_search_results[s.name] = []
      if (params[:balch]["school_#{s.id}"] == '1')
        conditions = ["course_id in (?) and deadline > ? and deadline < ?",
                s.courses.map{|c| c.id}.join(', '),
                temp_course.period_from,
                temp_course.period_to]
        if params[:balch][:include_current_period] == '1' && s.current_course
          conditions[0] << " or course_id = ? and deadline > ? and deadline < ?"
          conditions << s.current_course.id
          conditions << s.current_course.period_from
          conditions << s.current_course.period_to
        end
        ReportsWithDeadline.find(:all,
                                 :conditions => conditions).
                select{|rwd| params[:selected_reports].member?(rwd.report_id.to_s)}.
                each{|rwd| @report_search_results[s.name] << rwd}
      end
    end
  end

  def get_reports_for_user
    user_id = params.select {|k, v| v == nil && k.to_i.to_s == k}.first
    reports = Report.find(:all,
                          :conditions => {:user_type_id => user_id})

    render :partial => 'gestor/report_comboboxes',
           :locals => {:reports => reports}
  end

end
