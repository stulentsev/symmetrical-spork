class DeadlinesController < ApplicationController
  before_filter :authorize

  def index
    @course = Course.find_by_id(params[:course_id])
    @courses = Course.find(:all,
                           :conditions => ["period_to >= ?", Date.today])
    @deadlines =  @courses.map{|c| c.reports_with_deadlines }.flatten
  end

  def new
    @course = Course.find_by_id(params[:course_id])
    @report_with_deadline = ReportsWithDeadline.new(:course_id => @course.id)
  end

  def create
    @school = School.find_by_id(params[:school_id])
    @course = @school.current_course
    reports = @course.reports_with_deadlines.
                      select{|rwd| rwd.report.user_type_id == params[:user_type_id].to_i &&
                                   rwd.report.id == params[:reports_with_deadline][:report_id].to_i}
    temp_rep = ReportsWithDeadline.new(params[:reports_with_deadline])
    date = temp_rep.deadline
    reports.each do |r|
      r.deadline = date
      r.save!
    end
    redirect_to course_deadlines_url(@course.id)
  end

  def edit
  end

  def update
  end

  def get_reports_for_user
    user_id = params.select {|k, v| v == nil && k.to_i.to_s == k}.first
    reports = Report.find(:all,
                          :conditions => {:user_type_id => user_id})

    render :partial => 'deadlines/report_select_box',
           :locals => {:reports => reports}
  end

  private

  def authorize
    require_user_role [:gestor]
  end

end
