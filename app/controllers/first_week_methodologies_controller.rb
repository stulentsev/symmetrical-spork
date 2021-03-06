class FirstWeekMethodologiesController < ApplicationController
  # PUT /first_week_methodologies/1
  # PUT /first_week_methodologies/1.xml
  def update
    @first_week_methodology = FirstWeekMethodology.find_by_course_id(params[:course_id])

    respond_to do |format|
      @first_week_methodology.update_attributes(params[:first_week_methodology])
      flash[:notice] = 'Course was successfully updated.'
      format.json { render :json => @first_week_methodology }
    end

  end

end
