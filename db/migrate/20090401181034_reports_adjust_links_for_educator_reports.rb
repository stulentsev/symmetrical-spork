class ReportsAdjustLinksForEducatorReports < ActiveRecord::Migration
  def self.up
    Report.connection.execute("
UPDATE reports
SET link = CONCAT('edit_course_educator_report_url(params[:id], ', id - 10, ')')
WHERE id BETWEEN 11 AND 16;
")
    Report.connection.execute("
UPDATE reports
SET link = CONCAT('edit_course_educator_report_url(params[:id], ', id - 16, ')')
WHERE id BETWEEN 17 AND 22;
")
  end

  def self.down
  end
end
