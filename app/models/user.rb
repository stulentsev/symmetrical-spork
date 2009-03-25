class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :user_type
  has_many :reports_with_deadlines

  def assign_random_password
    pwd = random_password
    self.password = pwd
    self.password_confirmation = pwd
  end

  def after_create
    if self.user_type_id
      report_templates = Report.find_all_by_user_type_id(self.user_type_id)
      report_templates.each do |rt|
        rwd = ReportsWithDeadline.new(:report_id => rt.id,
                                      :user_id => self.id,
                                      :status => 0,
                                      :name => rt.name) # TODO: fill course_id
        self.reports_with_deadlines << rwd
        rwd.save
        self.save
      end
    end
  end

  private

  def random_password(size = 8)
    chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
    (1..size).collect{|a| chars[rand(chars.size)] }.join
  end

end
