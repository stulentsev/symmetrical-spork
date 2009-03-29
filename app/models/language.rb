class Language < ActiveRecord::Base
  has_many :activities
  has_many :students
  has_many :project_team_members
end
