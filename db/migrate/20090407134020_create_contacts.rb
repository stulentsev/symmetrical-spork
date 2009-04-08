class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :student_id
      t.string :contact_type
      t.string :contact_name
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
