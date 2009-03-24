class CreateReportsWithDeadlines < ActiveRecord::Migration
  def self.up
    create_table :reports_with_deadlines do |t|
      t.integer :report_id
      t.integer :course_id
      t.integer :user_id
      t.date    :deadline
      t.integer :status # 0 - uknown, 1 - open, 2 - finalized (no more editing)
      t.string  :name # optional

      t.timestamps
    end
  end

  def self.down
    drop_table :reports_with_deadlines
  end
end
