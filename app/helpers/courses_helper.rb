module CoursesHelper
  def remote_submit_for_team_member member
    if member.new_record?
      url = {:controller => 'project_team_members', :action => 'create', :course_id => member.course_id, :_method => :post}
    else
      url = course_project_team_member_path(member.course_id)
    end
    submit_to_remote 'project_team_member', 'Salvar', :url => url
  end

  def remote_submit_for_object obj, label, controller_name = obj.class.name.tableize
    if obj.new_record?
      url = {:controller => controller_name, :action => 'create', :_method => :post}
    else
      url = {:controller => controller_name, :action => 'update', :_method => :put}
#      url = project_team_member_path(obj)
    end
    submit_to_remote controller_name.singularize, label, :url => url
  end

  def get_css_class_by_report_status status
    {0 => 'desabilitado',
     1 => 'pendente',
     2 => 'preenchido',
     3 => 'em-branco',
     4 => 'atencao'
    }[status]
  end

  def get_label_by_report_status status
    {0 => 'aguardando gestor',
     1 => 'em andamento',
     2 => 'preenchido',
     3 => 'em branco',
     4 => 'incompleto'
    }[status]
  end

  def get_markup_for_rwd rwd, link_text = nil
    return '' unless rwd
    link_text ||= "#{rwd.name}<small>#{get_label_by_report_status rwd.status}</small>"
    html =  if rwd.status != 0
              link_to link_text,
                      eval(rwd.report.link || '')
            else
              link_text
    end
    return  "<li class='#{get_css_class_by_report_status(rwd.status)}'>#{html}</li>"
  end

  def educator_report_review_navigation
    students = @educator.student_performances.
            select{|sp| sp.trimester.number.to_s == params[:trimester_id]}.
            map{|sp| sp.student} if @educator
    render :partial => 'courses/educator_report_sidebar',
           :locals => {:students => students  }
  end

  def languages_select_box language_type
    # 1 - specific
    # 2 - transversal
    options = [['Selecione a Linguagem', 0]]
    Language.find(:all, :conditions => {:kind => language_type}).
             map{|l| [l.name, l.id]}.
             each {|opt| options << opt}

    select_tag 'navigation_language_id',
               options_for_select(options,
                                  params[:language_id].to_i),
               :class => 'navigation_ddl'
  end
end
