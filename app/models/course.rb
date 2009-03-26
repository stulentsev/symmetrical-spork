class Course < ActiveRecord::Base
  belongs_to :student_profile, :class_name => 'CourseStudentProfile'
  has_many :team_members, :class_name => "ProjectTeamMember"
  has_many :activities
  has_many :partners
  has_one :first_week_methodology
  has_one :rotate_methodology

  def after_initialize
    self.first_week_methodology ||= FirstWeekMethodology.new()
    self.rotate_methodology ||= RotateMethodology.new()
    self.student_profile ||=  CourseStudentProfile.new
  end
end
