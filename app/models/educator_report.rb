class EducatorReport < ActiveRecord::Base
  belongs_to :trimester, :class_name => 'Term'
  belongs_to :project_team_member
end
