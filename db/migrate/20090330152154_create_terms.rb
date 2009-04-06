class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.integer :course_id
      t.integer :number
      t.date    :period_from
      t.date    :period_to
      t.integer :months_long

      t.timestamps
    end
  end

  def self.down
    drop_table :terms
  end
end
