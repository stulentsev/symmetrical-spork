class CreateCoordinatorTrimestrialReportActivities < ActiveRecord::Migration
  def self.up
    create_table :coordinator_trimestrial_report_activities do |t|
      t.string :name
      t.date :date
      t.text :observations
      t.integer :coordinator_trimestrial_report_id

      t.timestamps
    end
  end

  def self.down
    drop_table :coordinator_trimestrial_report_activities
  end
end
