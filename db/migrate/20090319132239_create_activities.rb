class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.date :period_from
      t.date :period_to
      t.text :propositions
      t.text :methodology
      t.integer :language_id
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
