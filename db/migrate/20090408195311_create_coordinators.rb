class CreateCoordinators < ActiveRecord::Migration
  def self.up
    create_table :coordinators do |t|
      t.string :name
      t.string :city
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :coordinators
  end
end
