class StudentReportsController < ApplicationController
  # GET /student_reports
  # GET /student_reports.xml
  def index
    @student_reports = StudentReport.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_reports }
    end
  end

  # GET /student_reports/1
  # GET /student_reports/1.xml
  def show
    @student_report = StudentReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_report }
    end
  end

  # GET /student_reports/new
  # GET /student_reports/new.xml
  def new
    @student_report = StudentReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_report }
    end
  end

  # GET /student_reports/1/edit
  def edit
    @student_report = StudentReport.find(params[:id])
  end

  # POST /student_reports
  # POST /student_reports.xml
  def create
    @student_report = StudentReport.new(params[:student_report])

    respond_to do |format|
      if @student_report.save
        flash[:notice] = 'StudentReport was successfully created.'
        format.html { redirect_to(@student_report) }
        format.xml  { render :xml => @student_report, :status => :created, :location => @student_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_reports/1
  # PUT /student_reports/1.xml
  def update
    @student_report = StudentReport.find(params[:id])

    respond_to do |format|
      if @student_report.update_attributes(params[:student_report])
        flash[:notice] = 'StudentReport was successfully updated.'
        format.html { redirect_to(@student_report) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_reports/1
  # DELETE /student_reports/1.xml
  def destroy
    @student_report = StudentReport.find(params[:id])
    @student_report.destroy

    respond_to do |format|
      format.html { redirect_to(student_reports_url) }
      format.xml  { head :ok }
    end
  end
end
