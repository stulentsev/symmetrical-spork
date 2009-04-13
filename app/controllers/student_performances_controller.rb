class StudentPerformancesController < ApplicationController
  before_filter :init_state, :only => [:edit]
  layout 'student'

  def edit
  end

  def update
    @student_performance = StudentPerformance.find(params[:id])

    respond_to do |format|
      if @student_performance.update_attributes(params[:student_performance])
        flash[:notice] = 'StudentPerformance was successfully updated.'
        format.html { redirect_to(@student_performance) }
        format.xml  { head :ok }
        format.json { render :json => @student_performance}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_performance.errors, :status => :unprocessable_entity }
      end
    end
  end

private
  def init_state
    @student = Student.find(params[:id])
    @educator = ProjectTeamMember.find(params[:educator_id])
    @trimester = Term.find(params[:trimester_id])

    @student_performance = StudentPerformance.find(:first, :conditions => {:student_id => @student.id,
                                                                           :project_team_member_id => @educator.id,
                                                                           :trimester_id => @trimester.id})
    unless @student_performance
      @student_performance = StudentPerformance.create(:student_id => @student.id,
                                                       :project_team_member_id => @educator.id,
                                                       :trimester_id => @trimester.id)
    end
  end
end
