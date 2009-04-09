class School < ActiveRecord::Base
  has_many :courses
  belongs_to :coordinator, :class_name => 'Coordinator', :foreign_key => 'coordinator_user_id'
end
