class CoursesController < ApplicationController

  def index
  end

  def marco_zero
    @course ||= Course.new

    if request.post?
      @course.attributes = params[:course]
      prof = params[:student_profile]

      profile = CourseStudentProfile.new(prof)
      @course.student_profile = profile
      profile.save
      @course.save
      redirect_to :action => :index
    end
  end
end
