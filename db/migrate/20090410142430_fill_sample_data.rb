class FillSampleData < ActiveRecord::Migration
  def self.up
    config = Rails::Configuration.new
    if config.environment == 'development'
      # create course
      course = Course.create(:period_from => Date.today,
                             :period_to => 18.months.from_now,
                             :school_id => 3 # Rio de Janeiro
                            )

      # create trimesters for course
      6.times do |num|
        trim = Term.create(:course_id => course.id,
                           :number => num + 1,
                           :months_long => 3)
        course.trimesters << trim
        course.save
      end
      # create semesters
      3.times do |num|
        trim = Term.create(:course_id => course.id,
                           :number => num + 1,
                           :months_long => 6)
        course.semesters << trim
        course.save
      end

      # create gestor
      gestor = User.create( :user_type_id => 5, # gestor
                            :login => 'gestor',
                            :email => 'gestor@oikabum.com',
                            :password => 'gestor',
                            :password_confirmation => 'gestor')

      # create coordinators
      rio_user = User.create( :user_type_id => 1, # coordinator
                            :login => 'rio_cord',
                            :email => 'rio_cord@oikabum.com',
                            :password => 'rio_cord',
                            :password_confirmation => 'rio_cord')
      rio_coord= Coordinator.create(:name => 'Rio Coordenador',
                                        :city => 'Rio de Janeiro',
                                        :user_id => rio_user.id)
      rio_user.setup_reports_for_course(course)

      belo_user = User.create(:user_type_id => 1, # coordinator
                          :login => 'belo_cord',
                          :email => 'belo_cord@oikabum.com',
                          :password => 'belo_cord',
                          :password_confirmation => 'belo_cord')
      belo_coord = Coordinator.create(:name => 'Belo Horiznote Coordenador',
                                       :city => 'Belo Horiznote',
                                       :user_id => belo_user.id)
      belo_user.setup_reports_for_course(course)

      # set coordinators for schools
      school = School.find(3) # Rio de Janeiro
      school.coordinator = rio_coord
      school.save

      school = School.find(1) # Belo Horiznote
      school.coordinator = belo_coord
      school.save

      # create educadores
      4.times {|num| create_language_educator(num + 1, course)}

      transversal_user = User.create(:user_type_id => 3, # educador transversal
                          :login => 'transversal',
                          :email => 'transversal@oikabum.com',
                          :password => 'transversal',
                          :password_confirmation => 'transversal')
      transversal = ProjectTeamMember.create(:course_id => course.id,
                                          :user_id => transversal_user.id,
                                          :language_id => 0, # to pass validation
                                          :name => "Educador Transversal",
                                          :email => 'transversal@oikabum.com')
      transversal_user.setup_reports_for_course(course)

      # create students
      50.times do |number|
        student_user = User.create( :user_type_id => 4, # educando
                                    :login => "student#{number}",
                                    :email => "student#{number}@oikabum.com",
                                    :password => "student#{number}",
                                    :password_confirmation => "student#{number}")
        student = Student.create(:name => "Learnable organism \##{number}",
                                 :email => "student#{number}@oikabum.com",
                                 :language_id => 1 + rand(Language.count),
                                 :schooling_id => 1 + rand(Schooling.count),
                                 :user_id => student_user.id,
                                 :course_id => course.id,
                                 :birthday => Date.civil(1982, 1 + rand(12), 1 + rand(28))
                                )
        student_user.setup_reports_for_course(course)

      end
      # Open all reports
      ReportsWithDeadline.connection.execute("UPDATE reports_with_deadlines SET status = 1")
    end

  end

  def self.down
  end

private
  def self.create_language_educator(number, course)
    specific_user = User.create(:user_type_id => 2, # educador especifico
                        :login => "especifico#{number}",
                        :email => "especifico#{number}@oikabum.com",
                        :password => "especifico#{number}",
                        :password_confirmation => "especifico#{number}")
    specific = ProjectTeamMember.create(:course_id => course.id,
                                        :user_id => specific_user.id,
                                        :language_id => number,
                                        :name => "Educador Especifico",
                                        :email => "especific#{number}@oikabum.com")
    specific_user.setup_reports_for_course(course)
  end
end

