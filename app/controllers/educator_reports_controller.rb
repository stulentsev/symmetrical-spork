class EducatorReportsController < ApplicationController
  before_filter :init_state


  def edit
  end

  def update
    if params[:commit] == 'Finalizar Relatório' &&
            @educator_report.update_attributes(params[:educator_report])
      @rep_with_deadline.status = 2 # completed
      @rep_with_deadline.save
      redirect_to edit_course_educator_report_url(params[:id])
      return
    end

    respond_to do |format|
      if @educator_report.update_attributes(params[:educator_report])
        flash[:notice] = 'EducatorReport was successfully updated.'
        format.html { redirect_to(@educator_report) }
        format.xml  { head :ok }
        format.json { render :json => @educator_report}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @educator_report.errors, :status => :unprocessable_entity }
      end
    end
  end
private
  def get_rep_with_deadline(num)
    range = case current_user.user_type_id
    when 2
      (11..16) # relatorios de educador de linguagem
    when 3
      (17..22) # relatorios trimestriais des educadores transversais
    else
      throw Exception.new 'Not educator user'
    end

    arr = current_user.reports_with_deadlines.select {|r| range.member?(r.report_id) }
    arr = arr.sort {|l, r| l.report_id <=> r.report_id}
    arr[num.to_i - 1]
  end

  def init_state()
    @rep_with_deadline = get_rep_with_deadline(params[:id])
    @educator_report = EducatorReport.find(@rep_with_deadline.actual_report_id)
  end

end
