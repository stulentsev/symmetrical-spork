module CoursesHelper
  def remote_submit_for_team_member member

    if member.new_record?
      url = project_team_members_path
      #url = {:controller => :project_team_members, :action => :create}
      submit_to_remote 'project_team_member', 'Salvar', :controller => :project_team_members, :action => :create,
                       :method => :post
    else
      url = project_team_member_path(member)
      submit_to_remote 'project_team_member', 'Salvar', :url => url
    end
  end
end
