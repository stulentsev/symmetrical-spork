module CoursesHelper
  def remote_submit_for_team_member member
    if member.new_record?
      url = {:controller => 'project_team_members', :action => 'create', :_method => :post}
    else
      url = project_team_member_path(member)
    end
    submit_to_remote 'project_team_member', 'Salvar', :url => url
  end
end