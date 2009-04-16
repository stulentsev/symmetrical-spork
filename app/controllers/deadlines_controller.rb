class DeadlinesController < ApplicationController
  def index
    @course = Course.find_by_id(params[:course_id])
    @deadlines =  @course.reports_with_deadlines
  end

  def new
    @course = Course.find_by_id(params[:course_id])
    @report_with_deadline = ReportsWithDeadline.new(:course_id => @course.id)
  end

  def create
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

end
