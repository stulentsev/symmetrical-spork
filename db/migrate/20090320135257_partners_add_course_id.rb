class PartnersAddCourseId < ActiveRecord::Migration
  def self.up
    add_column :partners, :course_id, :integer
  end

  def self.down
    remove_column :partners, :course_id
  end
end
