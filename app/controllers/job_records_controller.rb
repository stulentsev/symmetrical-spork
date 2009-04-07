class JobRecordsController < ApplicationController
  def show
    @job_record = JobRecord.find(params[:id])
  end

  def new
    @job_record = JobRecord.new
  end

  def edit
    @job_record = JobRecord.find(params[:id])
  end

  def create
    @job_record = JobRecord.new(params[:job_record])
    if !@job_record.save
      render :action => :create
    end
  end

  def update
    @job_record = JobRecord.find(params[:id])
    if !@job_record.update_attributes(params[:job_record])
      render :action => :edit
    end

  end

  def destroy
    @job_record = JobRecord.find(params[:id])
    @job_record.destroy
  end
end
