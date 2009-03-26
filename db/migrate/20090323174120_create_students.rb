class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.string :application_number
      t.string :photo_file
      t.integer :schooling_id
      t.integer :language_id
      t.text :technical_expertise_degree
      t.text :why_oi_kabum
      t.text :observed_characteristics
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
