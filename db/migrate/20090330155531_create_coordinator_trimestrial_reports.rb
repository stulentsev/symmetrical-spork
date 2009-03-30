class CreateCoordinatorTrimestrialReports < ActiveRecord::Migration
  def self.up
    create_table :coordinator_trimestrial_reports do |t|
      t.text :method_format
      t.integer :attendance_score
      t.integer :punctuality_score
      t.integer :proactivity_score
      t.integer :interdisciplinary_working_score
      t.integer :student_involvement_score
      t.text :comment
      t.integer :trimester_id

      t.timestamps
    end
  end

  def self.down
    drop_table :coordinator_trimestrial_reports
  end
end
