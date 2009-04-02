class StudentPerformance < ActiveRecord::Base
  belongs_to :student
  belongs_to :trimester
  belongs_to :project_team_member
end
