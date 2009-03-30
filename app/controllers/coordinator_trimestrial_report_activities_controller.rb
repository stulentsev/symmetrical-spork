class CoordinatorTrimestrialReportActivitiesController < ApplicationController
  # GET /coordinator_trimestrial_report_activities
  # GET /coordinator_trimestrial_report_activities.xml
  def index
    @coordinator_trimestrial_report_activities = CoordinatorTrimestrialReportActivity.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coordinator_trimestrial_report_activities }
    end
  end

  # GET /coordinator_trimestrial_report_activities/1
  # GET /coordinator_trimestrial_report_activities/1.xml
  def show
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coordinator_trimestrial_report_activity }
    end
  end

  # GET /coordinator_trimestrial_report_activities/new
  # GET /coordinator_trimestrial_report_activities/new.xml
  def new
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coordinator_trimestrial_report_activity }
    end
  end

  # GET /coordinator_trimestrial_report_activities/1/edit
  def edit
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])
  end

  # POST /coordinator_trimestrial_report_activities
  # POST /coordinator_trimestrial_report_activities.xml
  def create
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.new(params[:coordinator_trimestrial_report_activity])

    respond_to do |format|
      if @coordinator_trimestrial_report_activity.save
        flash[:notice] = 'CoordinatorTrimestrialReportActivity was successfully created.'
        format.html { redirect_to(@coordinator_trimestrial_report_activity) }
        format.xml  { render :xml => @coordinator_trimestrial_report_activity, :status => :created, :location => @coordinator_trimestrial_report_activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coordinator_trimestrial_report_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coordinator_trimestrial_report_activities/1
  # PUT /coordinator_trimestrial_report_activities/1.xml
  def update
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])

    respond_to do |format|
      if @coordinator_trimestrial_report_activity.update_attributes(params[:coordinator_trimestrial_report_activity])
        flash[:notice] = 'CoordinatorTrimestrialReportActivity was successfully updated.'
        format.html { redirect_to(@coordinator_trimestrial_report_activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coordinator_trimestrial_report_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinator_trimestrial_report_activities/1
  # DELETE /coordinator_trimestrial_report_activities/1.xml
  def destroy
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])
    @coordinator_trimestrial_report_activity.destroy

    respond_to do |format|
      format.html { redirect_to(coordinator_trimestrial_report_activities_url) }
      format.xml  { head :ok }
    end
  end
end
