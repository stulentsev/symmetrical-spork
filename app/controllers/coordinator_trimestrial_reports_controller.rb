class CoordinatorTrimestrialReportsController < ApplicationController
  def get_rep_with_deadline(num)
    arr = current_user.reports_with_deadlines.select {|r| (5..10).member?(r.report_id) }
    arr = arr.sort {|l, r| l.report_id <=> r.report_id}
    arr[num.to_i - 1]
  end

  def edit
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(params[:id])
    @rep_with_deadline = get_rep_with_deadline(params[:id])
    @activity = CoordinatorTrimestrialReportActivity.new(:coordinator_trimestrial_report_id => params[:id])
  end

  def update
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(params[:id])
    @rep_with_deadline = get_rep_with_deadline(params[:id])

    if params[:commit] == 'Finalizar Relatório' &&
            @coordinator_trimestrial_report.update_attributes(params[:coordinator_trimestrial_report])
      @rep_with_deadline.status = 2 # completed
      @rep_with_deadline.save
      redirect_to edit_course_coordinator_trimestrial_report_url(@coordinator_trimestrial_report)
      return
    end

    respond_to do |format|
      if @coordinator_trimestrial_report.update_attributes(params[:coordinator_trimestrial_report])
        flash[:notice] = 'CoordinatorTrimestrialReport was successfully updated.'
        format.html { redirect_to(@coordinator_trimestrial_report) }
        format.xml  { head :ok }
        format.json {render :json => @coordinator_trimestrial_report}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coordinator_trimestrial_report.errors, :status => :unprocessable_entity }
      end
    end
  end
end
