class Course < ActiveRecord::Base
  belongs_to :student_profile, :class_name => 'CourseStudentProfile'
  has_many :team_members, :class_name => "ProjectTeamMember"
  has_many :activities
  has_many :partners
  has_one :first_week_methodology
  has_one :rotate_methodology
  has_many :students
  has_many :trimesters

  def after_initialize
    self.student_profile ||=  CourseStudentProfile.create
    self.first_week_methodology ||= FirstWeekMethodology.create
    self.rotate_methodology ||= RotateMethodology.create
    self.save
  end
end
