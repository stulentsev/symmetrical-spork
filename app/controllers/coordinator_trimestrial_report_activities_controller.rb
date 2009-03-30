class CoordinatorTrimestrialReportActivitiesController < ApplicationController
  def edit
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])
  end

  def create
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.new(params[:coordinator_trimestrial_report_activity])
    @coordinator_trimestrial_report_activity.save
  end

  def update
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])
    @coordinator_trimestrial_report_activity.update_attributes(params[:coordinator_trimestrial_report_activity])
  end

  def destroy
    @coordinator_trimestrial_report_activity = CoordinatorTrimestrialReportActivity.find(params[:id])
    @coordinator_trimestrial_report_activity.destroy
  end
end
