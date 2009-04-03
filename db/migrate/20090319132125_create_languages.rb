class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.integer :kind
      t.string :name

      t.timestamps
    end

    Language.create(:kind => 1, :name => 'Vídeo')
    Language.create(:kind => 1, :name => 'Fotografia')
    Language.create(:kind => 1, :name => 'Design')
    Language.create(:kind => 1, :name => 'Comp. gráfica')
    Language.create(:kind => 1, :name => 'Webdesign')
  end

  def self.down
    drop_table :languages
  end
end
