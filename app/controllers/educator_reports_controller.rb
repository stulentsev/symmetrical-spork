class EducatorReportsController < ApplicationController
  before_filter :init_state


  def edit
    @educator = ProjectTeamMember.find_by_course_id_and_user_id(params[:course_id],
                                                                current_user.id)

  end

  def update
    if params[:commit] == 'Finalizar Relatório' &&
            @educator_report.update_attributes(params[:educator_report])
      @rep_with_deadline.status = 2 # completed
      @rep_with_deadline.save
      redirect_to edit_course_educator_report_url(params[:course_id], params[:id])
      return
    end

    respond_to do |format|
      if @educator_report.update_attributes(params[:educator_report])
        format.json { render :json => @educator_report}
      end
    end
  end
private
  def get_rep_with_deadline(num)
    arr = current_user.reports_with_deadlines.select {|r| r.report.report_type == 2 }
    arr = arr.sort {|l, r| l.report_id <=> r.report_id}
    arr[num.to_i - 1]
  end

  def init_state
    @rep_with_deadline = get_rep_with_deadline(params[:id])
    @educator_report = EducatorReport.find(@rep_with_deadline.actual_report_id)
  end

end
