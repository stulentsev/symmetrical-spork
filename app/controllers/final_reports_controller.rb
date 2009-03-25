class FinalReportsController < ApplicationController

  def update
    @course = Course.find_by_id(params[:course_id])
    @course.update_attributes params[:course]

    respond_to do |format|
      #format.html # Whatever
      format.json { render :json => @course }
    end
  end

  def show
  end

  def edit
    @course = Course.find_by_id(params[:course_id])
  end

end
