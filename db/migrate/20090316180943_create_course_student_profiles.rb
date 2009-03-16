class CreateCourseStudentProfiles < ActiveRecord::Migration
  def self.up
    create_table :course_student_profiles do |t|
      t.string :sex
      t.integer :age_from
      t.integer :age_to
      t.integer :schooling_id
      t.text :observations

      t.timestamps
    end
  end

  def self.down
    drop_table :course_student_profiles
  end
end
