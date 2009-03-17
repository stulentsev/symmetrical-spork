class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.date :period_from
      t.date :period_to
      t.text :objectives
      t.text :results
      t.text :professors_selection_process
      t.text :students_selection_process
      t.text :communities

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
