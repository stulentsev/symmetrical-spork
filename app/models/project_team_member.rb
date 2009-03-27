class ProjectTeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates_presence_of :name, :email
end
