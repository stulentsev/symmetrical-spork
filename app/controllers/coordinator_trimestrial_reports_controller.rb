class CoordinatorTrimestrialReportsController < ApplicationController
  before_filter :init_state, :authorize

  def edit
  end

  def update
    if params[:commit] == 'Finalizar Relatório' &&
            @coordinator_trimestrial_report.update_attributes(params[:coordinator_trimestrial_report])
      @rep_with_deadline.status = 2 # completed
      @rep_with_deadline.save
      redirect_to edit_course_coordinator_trimestrial_report_url(params[:course_id], params[:id])
      return
    end

    respond_to do |format|
      if @coordinator_trimestrial_report.update_attributes(params[:coordinator_trimestrial_report])
        flash[:notice] = 'CoordinatorTrimestrialReport was successfully updated.'
        format.json {render :json => @coordinator_trimestrial_report}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coordinator_trimestrial_report.errors, :status => :unprocessable_entity }
      end
    end
  end

private
  def init_state
    @rep_with_deadline = get_rep_with_deadline(params[:id])
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(@rep_with_deadline.actual_report_id)
    @activity = CoordinatorTrimestrialReportActivity.new(:coordinator_trimestrial_report_id => params[:id])
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


  def get_rep_with_deadline(num)
    arr = get_user_with_reports.reports_with_deadlines.select {|r| r.report.report_type == 2 }
    arr = arr.sort {|l, r| l.report_id <=> r.report_id}
    arr[num.to_i - 1]
  end

  def authorize
    require_user_role [:coordinator, :gestor]
  end
end
