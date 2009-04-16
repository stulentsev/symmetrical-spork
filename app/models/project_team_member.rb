class ProjectTeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :language
  validates_presence_of :name, :email, :language

  has_many :student_performances

  def transversal?
    self.user.user_type_id == 3
  end
end
