class CoursesController < ApplicationController
  
  def index
  end
  
  def marco_zero
    @course = Course.new
    
  end
end
