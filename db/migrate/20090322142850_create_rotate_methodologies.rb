class CreateRotateMethodologies < ActiveRecord::Migration
  def self.up
    create_table :rotate_methodologies do |t|
      t.text :description
      t.date :date_from
      t.date :date_to
      t.text :estrategy
      t.text :aspects
      t.text :difficulties
      t.text :sugestion
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :rotate_methodologies
  end
end
