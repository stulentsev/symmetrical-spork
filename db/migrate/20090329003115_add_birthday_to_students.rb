class AddBirthdayToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :birthday, :date
  end

  def self.down
    remove_column :students, :birthday
  end
end
