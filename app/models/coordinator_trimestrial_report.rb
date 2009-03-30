class CoordinatorTrimestrialReport < ActiveRecord::Base
  has_many :activities, :class_name => 'CoordinatorTrimestrialReportActivity'
  belongs_to :trimester
end
