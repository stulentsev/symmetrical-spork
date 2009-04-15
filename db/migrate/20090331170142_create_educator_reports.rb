class CreateEducatorReports < ActiveRecord::Migration
  def self.up
    create_table :educator_reports do |t|
      t.text    :content_description
      t.text    :methods_used
      t.text    :observations
      t.integer :trimester_id
      t.text    :coordinator_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :educator_reports
  end
end
