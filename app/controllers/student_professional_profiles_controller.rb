class StudentProfessionalProfilesController < ApplicationController
  def edit
    @student = Student.find(params[:id])
  end
end
