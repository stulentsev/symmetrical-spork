class ProjectTeamMembersController < ApplicationController
  # GET /project_team_members
  # GET /project_team_members.xml
  def index
    @project_team_members = ProjectTeamMember.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_team_members }
    end
  end

  # GET /project_team_members/1
  # GET /project_team_members/1.xml
  def show
    @project_team_member = ProjectTeamMember.new
    @members = Course.find(params[:course_id]).team_members

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_team_member }
    end
  end

  # GET /project_team_members/new
  # GET /project_team_members/new.xml
  def new
    @project_team_member = ProjectTeamMember.new(:course_id => params[:course_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_team_member }
    end
  end

  # GET /project_team_members/1/edit
  def edit
    @project_team_member = ProjectTeamMember.find(params[:id])
  end

  # POST /project_team_members
  # POST /project_team_members.xml
  def create
    @project_team_member = ProjectTeamMember.create(params[:project_team_member])

    user = User.find_by_login @project_team_member.email
    unless user
      user ||= User.new(:login => @project_team_member.email)
      user.assign_random_password
      user.save
    end

    @project_team_member.user = user
    @project_team_member.save

    UserMailer.deliver_new_password_notification(@project_team_member)
  end

  # PUT /project_team_members/1
  # PUT /project_team_members/1.xml
  def update
    @project_team_member = ProjectTeamMember.find(params[:id])
    @project_team_member.update_attributes(params[:project_team_member])
  end

  # DELETE /project_team_members/1
  # DELETE /project_team_members/1.xml
  def destroy
    @project_team_member = ProjectTeamMember.find(params[:id])
    @project_team_member.destroy
  end
end
