class Course < ActiveRecord::Base
  belongs_to :student_profile, :class_name => 'CourseStudentProfile'
  has_many :team_members, :class_name => "ProjectTeamMember"
  has_many :activities
  has_many :partners
  has_one :first_week_methodology
  has_one :rotate_methodology
  has_many :students
  has_many :trimesters, :class_name => 'Term', :conditions => {:months_long => 3}
  has_many :semesters, :class_name => 'Term', :conditions => {:months_long => 6}
  belongs_to :school
  has_many :reports_with_deadlines

  def after_create
    self.student_profile ||=  CourseStudentProfile.create
    self.first_week_methodology ||= FirstWeekMethodology.create
    self.rotate_methodology ||= RotateMethodology.create
    self.save
  end
end
