class CreateJobRecords < ActiveRecord::Migration
  def self.up
    create_table :job_records do |t|
      t.string :company_name
      t.string :company_url
      t.string :function
      t.date :period_from
      t.date :period_to
      t.text :description
      t.integer :student_id
      t.integer :is_current

      t.timestamps
    end
  end

  def self.down
    drop_table :job_records
  end
end
