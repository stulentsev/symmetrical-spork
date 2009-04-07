class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string    :name
      t.string    :application_number
      t.integer   :schooling_id
      t.integer   :language_id
      t.text      :technical_expertise_degree
      t.text      :why_oi_kabum
      t.text      :observed_characteristics
      t.integer   :user_id
      t.integer   :course_id
      t.date      :birthday
      t.string    :email
      t.string    :photo_file_name
      t.string    :photo_content_type
      t.string    :photo_file_size

      t.string    :address1
      t.string    :address2
      t.string    :building_no
      t.string    :compl
      t.string    :estado
      t.string    :uf
      t.string    :cep
      t.text      :custom_message

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
