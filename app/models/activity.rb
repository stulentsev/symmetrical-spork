class Activity < ActiveRecord::Base
  belongs_to :language
  belongs_to :course
end
