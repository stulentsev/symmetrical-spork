class StudentReportsController < ApplicationController
  before_filter :init_state, :authorize

  def edit
  end

  def update
    if params[:commit] == 'Finalizar Relatório' &&
            @student_report.update_attributes(params[:student_report])
      @rep_with_deadline.status = 2 # completed
      @rep_with_deadline.save
      redirect_to edit_course_student_report_url(params[:course_id], params[:id])
      return
    end

    respond_to do |format|
      if @student_report.update_attributes(params[:student_report])
        flash[:notice] = 'StudentReport was successfully updated.'
        format.json { render :json => @student_report }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_report.errors, :status => :unprocessable_entity }
      end
    end
  end

private
    def get_rep_with_deadline(num)
      arr = current_user.reports_with_deadlines.select {|r| r.report.report_type == 3 }
      arr = arr.sort {|l, r| l.report_id <=> r.report_id}
      arr[num.to_i - 1]
    end

    def init_state
      @rep_with_deadline = get_rep_with_deadline(params[:id])
      @student_report = StudentReport.find(@rep_with_deadline.actual_report_id)
      @semester_no = params[:id]
      throw Exception.new("Value out of range.") if ![1, 2, 3].member?(params[:id].to_i)
    end

    def authorize
      require_user_role [:student]
    end
end
