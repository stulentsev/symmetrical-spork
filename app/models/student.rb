class Student < ActiveRecord::Base
  belongs_to :language
  belongs_to :schooling
  belongs_to :user
  belongs_to :course

  has_attached_file :photo, :styles => { :thumb => "78x78#", :profile => "117x117#" }

  validates_presence_of :name, :email, :language_id
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


end
