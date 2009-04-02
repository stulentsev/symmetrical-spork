module EducatorReportsHelper
  def student_href_func(student)
    edit_student_performance_url(student,
                                 :trimester_id => @educator_report.trimester.id,
                                 :educator_id => @educator.id)
  end

  def student_onclick_func(student)
    return ''
    #h('alert("' + @educator.name + ' reports: this is ' + student.name + ' on trimester ' + @educator_report.trimester.id.to_s + '"); return false;')
  end
end
