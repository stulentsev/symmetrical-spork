class StudentPerformance < ActiveRecord::Base
  belongs_to :student
  belongs_to :Term
  belongs_to :project_team_member
end
