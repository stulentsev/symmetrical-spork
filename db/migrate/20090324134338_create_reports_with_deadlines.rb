class CreateReportsWithDeadlines < ActiveRecord::Migration
  def self.up
    create_table :reports_with_deadlines do |t|
      t.integer :report_id
      t.integer :course_id
      t.integer :user_id
      t.date    :deadline
      t.integer :status # 0 - awaiting manager, 1 - ongoing,
                        # 2 - completed, 3 - blank
                        # 4 - incomplete
      t.string  :name # optional
      t.integer :actual_report_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reports_with_deadlines
  end
end
