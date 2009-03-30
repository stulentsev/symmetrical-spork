class Student < ActiveRecord::Base
  belongs_to :language
  belongs_to :schooling
  belongs_to :user
  belongs_to :course

  has_attached_file :photo, :styles => { :thumb => "78x78#" }
end
