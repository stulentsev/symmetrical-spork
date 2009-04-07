class StudentProfessionalProfilesController < ApplicationController
  def edit
    @student = Student.find(params[:id])
    @job_record = JobRecord.new(:student_id => @student.id)
  end
end
