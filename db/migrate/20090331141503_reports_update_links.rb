class ReportsUpdateLinks < ActiveRecord::Migration
  def self.up
    Report.connection.execute("
    update reports
    set link = concat('edit_course_coordinator_trimestrial_report_url(params[:id], ', (id - 4), ')')
    where id between 5 and 10;")
  end

  def self.down
  end
end
