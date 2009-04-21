class ProjectTeamMembersController < ApplicationController
  include UsersHelper
  before_filter :require_user, :get_course

  def edit
    @project_team_member = ProjectTeamMember.find(params[:id])
  end

  def create
    @project_team_member = ProjectTeamMember.new(params[:project_team_member])
    @project_team_member.course = @course

    if @project_team_member.valid?
      user = find_or_create_user_by_login(@project_team_member.email, 2)
      user.setup_reports_for_course(@course)

      unless user.valid?
        user.errors.each {|attr, msg| @project_team_member.errors.add(attr, msg)}
#        render :action => :new
        return
      end

      @project_team_member.user = user
      @project_team_member.save

      UserMailer.deliver_new_password_notification(@project_team_member) if @project_team_member.user.password
      render :action => :new
    end
  end

  def update
    @project_team_member = ProjectTeamMember.find(params[:id])
    @project_team_member.update_attributes(params[:project_team_member])
  end

  def destroy
    @project_team_member = ProjectTeamMember.find(params[:id])
    @project_team_member.destroy
  end

  def show
    @project_team_member = ProjectTeamMember.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'profile'}
      format.xml  { render :xml => @project_team_member }
    end
  end

  private
  def get_course
    @course = Course.find_by_id params[:course_id]
  end
end

