class ProjectTeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :language
  validates_presence_of :name, :email, :language

  def transversal?
    self.user.user_type_id == 3
  end
end
