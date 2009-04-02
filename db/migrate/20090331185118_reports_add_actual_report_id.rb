class ReportsAddActualReportId < ActiveRecord::Migration
  def self.up
    add_column :reports_with_deadlines, :actual_report_id, :integer
  end

  def self.down
    remove_column :reports_with_deadlines, :actual_report_id
  end
end
