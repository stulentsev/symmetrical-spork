class CoordinatorTrimestrialReportsController < ApplicationController
  # GET /coordinator_trimestrial_reports
  # GET /coordinator_trimestrial_reports.xml
  def index
    @coordinator_trimestrial_reports = CoordinatorTrimestrialReport.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coordinator_trimestrial_reports }
    end
  end

  # GET /coordinator_trimestrial_reports/1
  # GET /coordinator_trimestrial_reports/1.xml
  def show
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coordinator_trimestrial_report }
    end
  end

  # GET /coordinator_trimestrial_reports/new
  # GET /coordinator_trimestrial_reports/new.xml
  def new
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coordinator_trimestrial_report }
    end
  end

  # GET /coordinator_trimestrial_reports/1/edit
  def edit
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(params[:id])
  end

  # POST /coordinator_trimestrial_reports
  # POST /coordinator_trimestrial_reports.xml
  def create
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.new(params[:coordinator_trimestrial_report])

    respond_to do |format|
      if @coordinator_trimestrial_report.save
        flash[:notice] = 'CoordinatorTrimestrialReport was successfully created.'
        format.html { redirect_to(@coordinator_trimestrial_report) }
        format.xml  { render :xml => @coordinator_trimestrial_report, :status => :created, :location => @coordinator_trimestrial_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coordinator_trimestrial_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coordinator_trimestrial_reports/1
  # PUT /coordinator_trimestrial_reports/1.xml
  def update
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(params[:id])

    respond_to do |format|
      if @coordinator_trimestrial_report.update_attributes(params[:coordinator_trimestrial_report])
        flash[:notice] = 'CoordinatorTrimestrialReport was successfully updated.'
        format.html { redirect_to(@coordinator_trimestrial_report) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coordinator_trimestrial_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinator_trimestrial_reports/1
  # DELETE /coordinator_trimestrial_reports/1.xml
  def destroy
    @coordinator_trimestrial_report = CoordinatorTrimestrialReport.find(params[:id])
    @coordinator_trimestrial_report.destroy

    respond_to do |format|
      format.html { redirect_to(coordinator_trimestrial_reports_url) }
      format.xml  { head :ok }
    end
  end
end
