class AddPhotoToStudent < ActiveRecord::Migration
  def self.up
    remove_column :students, :photo_file
    add_column :students, :photo_file_name, :string
    add_column :students, :photo_content_type, :string
    add_column :students, :photo_file_size, :integer
  end

  def self.down
    add_column :students, :photo_file, :string
    remove_column :students, :photo_file_size
    remove_column :students, :photo_content_type
    remove_column :students, :photo_file_name
  end
end
