class Language < ActiveRecord::Base
  has_many :activities
  has_many :students
end
