class FinalReportsController < ApplicationController
  before_filter :authorize

  def update
    @course = Course.find_by_id(params[:course_id])

    @final_report = get_user_with_reports.reports_with_deadlines.select {|r| r.report_id == 4}.first
    @final_report.status = 2 # completed
    @final_report.save

    update_page
  end

  def show
  end

  def edit
    @course = Course.find_by_id(params[:course_id])
    @final_report = get_user_with_reports.reports_with_deadlines.select {|r| r.report_id == 4}.first
    #update_page
  end

private

  def update_page
    render :update do |page|
      page.replace_html 'course_final_report_div',
                        :partial => 'final_reports/edit'
    end
  end

  def authorize
    require_user_role [:coordinator]
  end

  def get_user_with_reports
    # TODO: replace with better permission check
    # TODO: (coordinator can access data only from its school)
    if current_user.gestor? && params[:domain_user_id]
      Coordinator.find_by_id(params[:domain_user_id]).user
    else
      current_user
    end
  end
end
