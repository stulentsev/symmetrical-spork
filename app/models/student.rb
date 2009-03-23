class Student < ActiveRecord::Base
  belongs_to :language
  belongs_to :schooling
  belongs_to :user
end
