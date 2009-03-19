class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @saved_activity = session[:saved_activity]
    @activity = Activity.new(:course_id => @saved_activity.course_id)
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])
    if @activity.valid? && @activity.save
      session[:saved_activity] = @activity
      redirect_to :action => :new
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to(@activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end
end
