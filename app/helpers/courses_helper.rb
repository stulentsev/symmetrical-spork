module CoursesHelper
  def remote_submit_for_team_member member
    if member.new_record?
      method = :post
      action = :create
    else
      method = :put
      action = :update
    end
    submit_to_remote 'project_team_member', 'Salvar', :url => {:_method => method,
                                                               :controller => :project_team_members,
                                                               :action => action }
  end
end
