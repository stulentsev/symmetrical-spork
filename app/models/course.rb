class Course < ActiveRecord::Base
  belongs_to :student_profile, :class_name => 'CourseStudentProfile'
end
