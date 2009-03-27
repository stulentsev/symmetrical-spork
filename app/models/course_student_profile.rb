class CourseStudentProfile < ActiveRecord::Base
  has_one :course
end
