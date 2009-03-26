class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :user_type_id
      t.integer :report_type
      t.string :name

      t.timestamps
    end

    Report.create(:user_type_id => 1, :name => 'Marco Zero')
    Report.create(:user_type_id => 1, :name => 'Escolha das linguagens')
    Report.create(:user_type_id => 1, :name => 'Relatórios de conteúdo')
    Report.create(:user_type_id => 1, :name => 'Relatório final')

  end

  def self.down
    drop_table :reports
  end
end
