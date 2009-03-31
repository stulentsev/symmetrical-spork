class EducatorReportsController < ApplicationController
  # GET /educator_reports
  # GET /educator_reports.xml
  def index
    @educator_reports = EducatorReport.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @educator_reports }
    end
  end

  # GET /educator_reports/1
  # GET /educator_reports/1.xml
  def show
    @educator_report = EducatorReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @educator_report }
    end
  end

  # GET /educator_reports/new
  # GET /educator_reports/new.xml
  def new
    @educator_report = EducatorReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @educator_report }
    end
  end

  # GET /educator_reports/1/edit
  def edit
    @educator_report = EducatorReport.find(params[:id])
  end

  # POST /educator_reports
  # POST /educator_reports.xml
  def create
    @educator_report = EducatorReport.new(params[:educator_report])

    respond_to do |format|
      if @educator_report.save
        flash[:notice] = 'EducatorReport was successfully created.'
        format.html { redirect_to(@educator_report) }
        format.xml  { render :xml => @educator_report, :status => :created, :location => @educator_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @educator_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /educator_reports/1
  # PUT /educator_reports/1.xml
  def update
    @educator_report = EducatorReport.find(params[:id])

    respond_to do |format|
      if @educator_report.update_attributes(params[:educator_report])
        flash[:notice] = 'EducatorReport was successfully updated.'
        format.html { redirect_to(@educator_report) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @educator_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /educator_reports/1
  # DELETE /educator_reports/1.xml
  def destroy
    @educator_report = EducatorReport.find(params[:id])
    @educator_report.destroy

    respond_to do |format|
      format.html { redirect_to(educator_reports_url) }
      format.xml  { head :ok }
    end
  end
end
