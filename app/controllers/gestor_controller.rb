class GestorController < ApplicationController
  def index
  end

  def view_reports
  end

  def create_reports
  end

  def monitor_students
  end

  def report_search_results
    temp_course = Course.new(params[:period])
    @report_search_results = {}
    School.find(:all).each do |s|
      @report_search_results[s.name] = []
      if (params[:balch]["school_#{s.id}"] == '1')
        conditions = ["course_id in (?) and deadline > ? and deadline < ?",
                s.courses.map{|c| c.id}.join(', '),
                temp_course.period_from,
                temp_course.period_to]
        if params[:balch][:include_current_period] == '1' && s.current_course
          conditions[0] << " or course_id = ? and deadline > ? and deadline < ?"
          conditions << s.current_course.id
          conditions << s.current_course.period_from
          conditions << s.current_course.period_to
        end
        ReportsWithDeadline.find(:all,
                                 :conditions => conditions).
                select{|rwd| params[:selected_reports].member?(rwd.report_id.to_s)}.
                each{|rwd| @report_search_results[s.name] << rwd}
      end
    end
  end

  def monitor_students
    if request.post?

      temp_course = Course.new(params[:period])
      @student_search_results = {}
      School.find(:all).each do |s|
        @student_search_results[s.name] = []
        if (params[:balch]["school_#{s.id}"] == '1')
          conditions = ["course_id in (?) and (
                        courses.period_from > ? and courses.period_from < ? or
                        courses.period_to > ? and courses.period_to < ? or
                        courses.period_from < ? and courses.period_to > ? or
                        courses.period_from > ? and courses.period_to < ?
                         ) and
                        language_id = ?",
                  s.courses.map{|c| c.id}.join(', '),
                  temp_course.period_from,
                  temp_course.period_to,
                  temp_course.period_from,
                  temp_course.period_to,
                  temp_course.period_from,
                  temp_course.period_to,
                  temp_course.period_from,
                  temp_course.period_to,
                  params[:language_id]
                  ]

          if params[:balch][:include_current_period] == '1' && s.current_course
            conditions[0] << " or course_id = ? and language_id = ?"
            conditions << s.current_course.id
            conditions << params[:language_id]
          end
          Student.find(:all,
                       :joins=>"JOIN courses ON students.course_id=courses.id",
                       :select=>"students.*",
                       :conditions => conditions).
                  each{|st| @student_search_results[s.name] << st}
        end
      end
      render :action => :student_search_results
    end
  end


  def generate_reports
    if request.post?
      temp_course = Course.new(params[:period])
      @student_search_results = {}
      School.find(:all).each do |s|
        @student_search_results[s.name] = []
        if (params[:balch]["school_#{s.id}"] == '1')
          conditions = ["course_id in (?) and (
                        courses.period_from > ? and courses.period_from < ? or
                        courses.period_to > ? and courses.period_to < ? or
                        courses.period_from < ? and courses.period_to > ? or
                        courses.period_from > ? and courses.period_to < ?
                         )",
                  s.courses.map{|c| c.id}.join(', '),
                  temp_course.period_from,
                  temp_course.period_to,
                  temp_course.period_from,
                  temp_course.period_to,
                  temp_course.period_from,
                  temp_course.period_to,
                  temp_course.period_from,
                  temp_course.period_to
                  ]

          if params[:balch][:include_current_period] == '1' && s.current_course
            conditions[0] << " or course_id = ? "
            conditions << s.current_course.id
          end
          Student.find(:all,
                       :joins=>"JOIN courses ON students.course_id=courses.id",
                       :select=>"students.*",
                       :conditions => conditions).
                  each{|st| @student_search_results[s.name] << st}
        end
      end

      @results = {}
      @student_search_results.each do |name, studs|
        @results[name] ||= {
                :void => true
                }
        next if studs.length == 0

        studs.group_by(&:course).each do |course, studs|
          @results[name][course] ||= {}

          @results[name].delete(:void)

          #add_piece_of_information(@results[name][course], :include_percentage_sex, calculate_sex_percentage(studs))
          @results[name][course][:include_percentage_sex] = calculate_sex_percentage studs
          @results[name][course][:include_percentage_schooling] = calculate_schooling_percentage studs
          @results[name][course][:include_average_age] = calculate_average_age studs

          @results[name][course][:include_how_many_finished] = course.how_many_finished
          @results[name][course][:include_how_many_are_employed] = course.how_many_are_employed
          @results[name][course][:include_how_many_will_act] = course.how_many_will_act
          @results[name][course][:include_how_many_keep_studying] = course.how_many_continue_studying

          @results[name][course][:include_difficulties] = calculate_difficulties_percentage studs
          @results[name][course][:include_if_kabum_helped] = calculate_oi_kabum_help studs
        end
      end

      render :action => :generate_report_results
    end
  end

  def get_reports_for_user
    user_id = params.select {|k, v| v == nil && k.to_i.to_s == k}.first
    reports = Report.find(:all,
                          :conditions => {:user_type_id => user_id})

    render :partial => 'gestor/report_comboboxes',
           :locals => {:reports => reports}
  end

  private
  def calculate_average_age studs
    studs.inject(0){|sum, stud| sum += ((Date.today - stud.birthday).to_i / 365)} / studs.length
  end
  def calculate_sex_percentage studs
    {:masculino => 'n/a', :feminino => 'n/a'}
  end

  def calculate_schooling_percentage studs
    results = [0, 0, 0, 0]
    studs.each do |st|
      if st.schooling_id
        results[st.schooling_id - 1] += 1
      end
    end
    {:fundamental_incompleto => results[0] * 100 / studs.length,
     :fundamental_completo => results[1] * 100 / studs.length,
     :medio_incompleto => results[2] * 100 / studs.length,
     :medio_completo => results[3] * 100 / studs.length}
  end

  def calculate_difficulties_percentage studs
    results = [0, 0, 0, 0, 0]
    studs.each do |st|
      rep = st.semestrial_report
      if rep.language_techniques
        results[0] += 1
      end
      if rep.equipment
        results[0] += 1
      end
      if rep.school_didactics
        results[0] += 1
      end
      if rep.relationships_with_professors
        results[0] += 1
      end
      if rep.relationships_with_students
        results[0] += 1
      end
    end

    {:language_techniques => results[0] * 100 / studs.length,
     :equipment => results[1] * 100 / studs.length,
     :school_didactics => results[2] * 100 / studs.length,
     :relationships_with_professors => results[3] * 100 / studs.length,
     :relationships_with_students => results[4] * 100 / studs.length
    }
  end

  def calculate_oi_kabum_help studs
    yeses = 0
    nos = 0
    studs.each do |st|
      rep = st.semestrial_report
      case rep.s1_oi_kabum_helped
      when 0
        nos += 1
      when 1
        yeses += 1
      end
    end
    {:yes => yeses * 100 / studs.length, :no => nos * 100 / studs.length}
  end

  def add_piece_of_information data_name, where_to_put, data
    where_to_put[data_name] = data if params[:data_name] == '1'
  end

end
