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
                                      :course_id => course.id,
                                      :name => rt.name)
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

  def domain_id
    case self.user_type_id
    when 1 # coordinator
      self.id
    when 2, 3
      ProjectTeamMember.find_by_user_id(self.id).id
    when 4
      Student.find_by_user_id(self.id).id
    end
  end

private
  def create_actual_report(type_id, course)
    case type_id
    when 3..8
      CoordinatorTrimestrialReport.create(:trimester_id => course.trimesters[type_id - 3].id).id
    when 10..15
      EducatorReport.create(:trimester_id => course.trimesters[type_id - 10].id).id
    when 16..21
      EducatorReport.create(:trimester_id => course.trimesters[type_id - 16].id).id
    when 22..24
      @student_report ||= StudentReport.create
      @student_report.id
    #else
    #  throw Exception.new "Unexpected report type: #{type_id}"
    end
  end

end
