class CreateStudentPerformances < ActiveRecord::Migration
  def self.up
    create_table :student_performances do |t|
      t.integer :student_id
      t.text :progress_achieved
      t.text :tools_learned
      t.integer :project_team_member_id
      t.integer :trimester_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_performances
  end
end
