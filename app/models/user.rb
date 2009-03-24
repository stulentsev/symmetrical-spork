class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :user_type
  has_many :reports_with_deadlines

  def assign_random_password
    pwd = random_password
    self.password = pwd
    self.password_confirmation = pwd
  end

  private

  def random_password(size = 8)
    chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
    (1..size).collect{|a| chars[rand(chars.size)] }.join
  end

end
