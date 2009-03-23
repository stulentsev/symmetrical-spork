class RotateMethodologiesController < ApplicationController
  # PUT /rotate_methodologies/1
  # PUT /rotate_methodologies/1.xml
  def update
    @rotate_methodology = RotateMethodology.find_by_course_id(params[:course_id])

    @rotate_methodology.update_attributes(params[:rotate_methodology])
  end

end
