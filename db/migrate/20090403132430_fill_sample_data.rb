class FillSampleData < ActiveRecord::Migration
  def self.up
    # create course
    course = Course.create(:period_from => Date.today,
                           :period_to => 18.months.from_now)

    # create trimesters for course
    6.times do |num|
      trim = Trimester.create(:course_id => course.id,
                              :number => num + 1)
      course.trimesters << trim
      course.save
    end

    # create coordinators
    sergei = User.create( :user_type_id => 1, # coordinator
                          :login => 'sergei',
                          :email => 'sergei.tulentsev@gmail.com',
                          :password => 'sergei',
                          :password_confirmation => 'sergei')
    murad = User.create(:user_type_id => 1, # coordinator
                        :login => 'murad',
                        :email => 'marcelo.murad@gmail.com',
                        :password => 'murad123',
                        :password_confirmation => 'murad123')
    sergei.setup_reports_for_course(course)
    murad.setup_reports_for_course(course)

    # create educadores
    4.times {|num| create_language_educator(num + 1, course)}

    transversal_user = User.create(:user_type_id => 3, # educador transversal
                        :login => 'transversal',
                        :email => 'transversal@mylo.com',
                        :password => 'transversal',
                        :password_confirmation => 'transversal')
    transversal = ProjectTeamMember.create(:course_id => course.id,
                                        :user_id => transversal_user.id,
                                        :language_id => 1, # to pass validation
                                        :name => "Andrew Romashkin (educador transversal para teste)",
                                        :email => 'transversal@mylo.com')
    transversal_user.setup_reports_for_course(course)

    # create students
    50.times do |number|
      student_user = User.create( :user_type_id => 4, # educando
                                  :login => "student#{number}",
                                  :email => "student#{number}@mylo.com",
                                  :password => "student#{number}",
                                  :password_confirmation => "student#{number}")
      student = Student.create(:name => "Learnable organism \##{number}",
                               :email => "student#{number}@mylo.com",
                               :language_id => 1 + rand(Language.count),
                               :schooling_id => 1 + rand(Schooling.count),
                               :user_id => student_user.id,
                               :course_id => course.id,
                               :birthday => Date.civil(1982, 1 + rand(12), 1 + rand(28))
                              )
      #student_user.setup_reports_for_course(course)

      # Open all reports
      ReportsWithDeadline.connection.execute("UPDATE reports_with_deadlines SET status = 1")
    end

  end

  def self.down
  end

private
  def self.create_language_educator(number, course)
    specific_user = User.create(:user_type_id => 2, # educador especifical
                        :login => "specific#{number}",
                        :email => "specific#{number}@mylo.com",
                        :password => "specific#{number}",
                        :password_confirmation => "specific#{number}")
    specific = ProjectTeamMember.create(:course_id => course.id,
                                        :user_id => specific_user.id,
                                        :language_id => number,
                                        :name => "Mark Swift #{number} (educador especifical para teste)",
                                        :email => "specific#{number}@mylo.com")
    specific_user.setup_reports_for_course(course)
  end
end
