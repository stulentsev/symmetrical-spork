class EducatorReport < ActiveRecord::Base
  belongs_to :trimester, :class_name => 'Term'
end
