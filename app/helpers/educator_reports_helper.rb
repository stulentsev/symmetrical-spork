module EducatorReportsHelper
  def student_onclick_func(student)
    h('alert("' + @educator.name + ' reports: this is ' + student.name + ' on trimester ' + @educator_report.trimester.id.to_s + '"); return false;')
  end
end
