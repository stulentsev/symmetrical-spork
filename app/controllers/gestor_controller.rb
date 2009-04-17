class GestorController < ApplicationController
  def index
  end

  def view_reports

  end

  def create_reports
  end

  def monitor_students
  end

  def get_reports_for_user
    user_id = params.select {|k, v| v == nil && k.to_i.to_s == k}.first
    reports = Report.find(:all,
                          :conditions => {:user_type_id => user_id})

    render :partial => 'gestor/report_comboboxes',
           :locals => {:reports => reports}
  end

end
