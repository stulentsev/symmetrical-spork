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
    @project_team_member = ProjectTeamMember.find(params[:id])

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
  def edit
    @project_team_member = ProjectTeamMember.find(params[:id])
  end

  # POST /project_team_members
  # POST /project_team_members.xml
  def create
    @project_team_member = ProjectTeamMember.new(params[:project_team_member])

    respond_to do |format|
      if @project_team_member.save
        flash[:notice] = 'ProjectTeamMember was successfully created.'
        format.html { redirect_to(@project_team_member) }
        format.xml  { render :xml => @project_team_member, :status => :created, :location => @project_team_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_team_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_team_members/1
  # PUT /project_team_members/1.xml
  def update
    @project_team_member = ProjectTeamMember.find(params[:id])

    respond_to do |format|
      if @project_team_member.update_attributes(params[:project_team_member])
        flash[:notice] = 'ProjectTeamMember was successfully updated.'
        format.html { redirect_to(@project_team_member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_team_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_team_members/1
  # DELETE /project_team_members/1.xml
  def destroy
    @project_team_member = ProjectTeamMember.find(params[:id])
    @project_team_member.destroy

    respond_to do |format|
      format.html { redirect_to(project_team_members_url) }
      format.xml  { head :ok }
    end
  end
end
