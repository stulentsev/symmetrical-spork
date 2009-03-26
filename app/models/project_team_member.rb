class ProjectTeamMember < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :email
end
