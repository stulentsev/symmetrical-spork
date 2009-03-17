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
    @project_team_member = ProjectTeamMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_team_member }
    end
  end

  # GET /project_team_members/1/edit
  def ajax_edit
    @project_team_member = ProjectTeamMember.find(params[:id])
  end

  # POST /project_team_members
  # POST /project_team_members.xml
  def create
    @project_team_member = ProjectTeamMember.create(params[:project_team_member])
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

  def show_for_course
    @project_team_member = ProjectTeamMember.new
    @members = Course.find(params[:course_id]).team_members
  end
end
