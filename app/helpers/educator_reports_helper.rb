module EducatorReportsHelper
  def educator_report_student_href(student)
    edit_student_performance_url(student,
                                 :trimester_id => @educator_report.trimester.id,
                                 :educator_id => @educator.id)
  end

  def render_students(language)
    render :partial => 'students/language',
           :object => language,
           :locals => {:students => language.students,
                       :href_func => method(:educator_report_student_href)}

  end
end
