class Term < ActiveRecord::Base
  has_many :coordinator_reports, :class_name => 'CoordinatorTrimestrialReport'
  belongs_to :course
end
