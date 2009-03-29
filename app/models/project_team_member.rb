class ProjectTeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :language
  validates_presence_of :name, :email
end
