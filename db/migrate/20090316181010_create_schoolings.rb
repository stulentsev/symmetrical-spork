class CreateSchoolings < ActiveRecord::Migration
  def self.up
    create_table :schoolings do |t|
      t.string :name

      t.timestamps
    end
    
    Schooling.create(:name => 'Fundamental incompleto')
    Schooling.create(:name => 'Fundamental completo')
    Schooling.create(:name => 'Ensino medio incompleto')
    Schooling.create(:name => 'Ensino medio completo')
  end

  def self.down
    drop_table :schoolings
  end
end
