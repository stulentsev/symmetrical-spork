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
end
