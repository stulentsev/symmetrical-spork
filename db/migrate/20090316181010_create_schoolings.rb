class CreateSchoolings < ActiveRecord::Migration
  def self.up
    create_table :schoolings do |t|
      t.string :name

      t.timestamps
    end

    Schooling.create(:name => 'Fundamental Incompleto')
    Schooling.create(:name => 'Fundamental Completo')
    Schooling.create(:name => 'Médio Incompleto')
    Schooling.create(:name => 'Médio Completo')
  end

  def self.down
    drop_table :schoolings
  end
end
