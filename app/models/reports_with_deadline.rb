class ReportsWithDeadline < ActiveRecord::Base
  belongs_to :course
  belongs_to :report
  belongs_to :user
end
