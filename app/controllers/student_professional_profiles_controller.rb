class StudentProfessionalProfilesController < ApplicationController
  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student_professional_profile.update_attributes(params[:student_professional_profile])
        flash[:notice] = 'StudentProfessionalProfile was successfully updated.'
        format.html { redirect_to(@student_professional_profile) }
        format.xml  { head :ok }
        format.json { render :json => @student }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_professional_profile.errors, :status => :unprocessable_entity }
      end
    end
  end
end
