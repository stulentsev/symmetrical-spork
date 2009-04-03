class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.string  :name
      t.text    :purpose
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :partners
  end
end
