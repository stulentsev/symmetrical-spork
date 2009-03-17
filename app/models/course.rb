class Course < ActiveRecord::Base
  belongs_to :student_profile, :class_name => 'CourseStudentProfile'
  has_many :team_members, :class_name => "ProjectTeamMember"
end
