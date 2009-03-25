class FinalReportsController < ApplicationController

  def update
    @course = Course.find_by_id(params[:course_id])

    @final_report = current_user.reports_with_deadlines.select {|r| r.report_id == 4}.first
    @final_report.status = 2 # completed
    @final_report.save

    update_page
  end

  def show
  end

  def edit
    @course = Course.find_by_id(params[:course_id])
    @final_report = current_user.reports_with_deadlines.select {|r| r.report_id == 4}.first
    #update_page
  end

private

  def update_page
    render :update do |page|
      page.replace_html 'course_final_report_div',
                        :partial => 'final_reports/edit'
    end
  end
end
