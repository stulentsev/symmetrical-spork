class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :user_type
  has_many :reports_with_deadlines

  def assign_random_password
    pwd = random_password
    self.password = pwd
    self.password_confirmation = pwd
  end

  def setup_reports_for_course(course)
    if self.valid? && self.user_type_id && self.reports_with_deadlines.empty?
      report_templates = Report.find_all_by_user_type_id(self.user_type_id)
      report_templates.each do |rt|
        rwd = ReportsWithDeadline.new(:report_id => rt.id,
                                      :user_id => self.id,
                                      :status => 0,
                                      :name => rt.name) # TODO: fill course_id
        rwd.actual_report_id = create_actual_report(rt.id, course)
        self.reports_with_deadlines << rwd
        rwd.save
        self.save_without_session_maintenance
      end
    end

  end

  def random_password(size = 8)
    chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
    (1..size).collect{|a| chars[rand(chars.size)] }.join
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end

private
  def create_actual_report(type_id, course)
    case type_id
    when 5..10
      CoordinatorTrimestrialReport.create(:trimester_id => course.trimesters[type_id - 5].id).id
    when 11..16
      EducatorReport.create(:trimester_id => course.trimesters[type_id - 11].id).id
    when 17..22
      EducatorReport.create(:trimester_id => course.trimesters[type_id - 17].id).id
    when 23..25
      throw Exception.new 'Not implemented yet: Student semestrial report'
    else
      throw Exception.new "Unexpected report type: #{type_id}"
    end
  end

end
