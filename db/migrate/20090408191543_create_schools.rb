class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name
      t.integer :coordinator_user_id

      t.timestamps
    end

    School.create(:name => 'Belo Horizonte')
    School.create(:name => 'Recife')
    School.create(:name => 'Rio de Janeiro')
    School.create(:name => 'Salvador')
  end

  def self.down
    drop_table :schools
  end
end
