class Course < ActiveRecord::Base
  belongs_to :student_profile, :class_name => 'CourseStudentProfile'
  has_many :team_members, :class_name => "ProjectTeamMember"
  has_many :activities
  has_many :partners
  has_one :first_week_methodology
end
