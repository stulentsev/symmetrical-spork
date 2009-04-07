class JobRecordsController < ApplicationController
  # GET /job_records
  # GET /job_records.xml
  def index
    @job_records = JobRecord.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_records }
    end
  end

  # GET /job_records/1
  # GET /job_records/1.xml
  def show
    @job_record = JobRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_record }
    end
  end

  # GET /job_records/new
  # GET /job_records/new.xml
  def new
    @job_record = JobRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_record }
    end
  end

  # GET /job_records/1/edit
  def edit
    @job_record = JobRecord.find(params[:id])
  end

  # POST /job_records
  # POST /job_records.xml
  def create
    @job_record = JobRecord.new(params[:job_record])

    respond_to do |format|
      if @job_record.save
        flash[:notice] = 'JobRecord was successfully created.'
        format.html { redirect_to(@job_record) }
        format.xml  { render :xml => @job_record, :status => :created, :location => @job_record }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_records/1
  # PUT /job_records/1.xml
  def update
    @job_record = JobRecord.find(params[:id])

    respond_to do |format|
      if @job_record.update_attributes(params[:job_record])
        flash[:notice] = 'JobRecord was successfully updated.'
        format.html { redirect_to(@job_record) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_records/1
  # DELETE /job_records/1.xml
  def destroy
    @job_record = JobRecord.find(params[:id])
    @job_record.destroy

    respond_to do |format|
      format.html { redirect_to(job_records_url) }
      format.xml  { head :ok }
    end
  end
end
