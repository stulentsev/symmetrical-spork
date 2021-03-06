class SchoolsController < ApplicationController
  # GET /schools
  # GET /schools.xml
  def index
    @schools = School.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /schools/1
  # GET /schools/1.xml
  def show
    @school = School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.xml
  def new
    @school = School.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.xml
  def create
    @school = School.new(params[:school])

    respond_to do |format|
      if @school.save
        flash[:notice] = 'School was successfully created.'
        format.html { redirect_to(@school) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.xml
  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'School was successfully updated.'
        format.html { redirect_to :action => :index }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.xml
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to(schools_url) }
      format.xml  { head :ok }
    end
  end

  def assign_coordinator
    @school = School.find_by_id(params[:id])
    @coordinator = Coordinator.new
    @coordinator_user = User.new

    if request.post?
      @coordinator.attributes = params[:coordinator]

      coordinator_user = User.new(params[:user])
      coordinator_user.user_type_id = 1 # coordinators
      coordinator_user.save_without_session_maintenance

      @coordinator.user = coordinator_user
      @coordinator.save!

      @school.coordinator_user_id = @coordinator.id
      @school.save!

      redirect_to :action => :index
    end
  end

  def remove_coordinator
    @school = School.find_by_id(params[:id])
    Rails.logger.info "Still in common part"
    if request.post?
      Rails.logger.info "Already in post part"
      @school.coordinator_user_id = nil
      @school.save!
      redirect_to :action => :index
    end
  end
end
