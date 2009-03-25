class ReportsMoreTypes < ActiveRecord::Migration
  def self.up
    # update report lists for coordinators
    Report.find_by_name('Relatórios de conteúdo').destroy

    Report.create(:user_type_id => 1, :name => 'Relatório – 1º Trimestre')
    Report.create(:user_type_id => 1, :name => 'Relatório – 2º Trimestre')
    Report.create(:user_type_id => 1, :name => 'Relatório – 3º Trimestre')
    Report.create(:user_type_id => 1, :name => 'Relatório – 4º Trimestre')
    Report.create(:user_type_id => 1, :name => 'Relatório – 5º Trimestre')
    Report.create(:user_type_id => 1, :name => 'Relatório – 6º Trimestre')

    # educadores de linguagens
    Report.create(:user_type_id => 2, :name => 'Relatório – 1º Trimestre')
    Report.create(:user_type_id => 2, :name => 'Relatório – 2º Trimestre')
    Report.create(:user_type_id => 2, :name => 'Relatório – 3º Trimestre')
    Report.create(:user_type_id => 2, :name => 'Relatório – 4º Trimestre')
    Report.create(:user_type_id => 2, :name => 'Relatório – 5º Trimestre')
    Report.create(:user_type_id => 2, :name => 'Relatório – 6º Trimestre')

    # educadores transversais
    Report.create(:user_type_id => 3, :name => 'Relatório – 1º Trimestre')
    Report.create(:user_type_id => 3, :name => 'Relatório – 2º Trimestre')
    Report.create(:user_type_id => 3, :name => 'Relatório – 3º Trimestre')
    Report.create(:user_type_id => 3, :name => 'Relatório – 4º Trimestre')
    Report.create(:user_type_id => 3, :name => 'Relatório – 5º Trimestre')
    Report.create(:user_type_id => 3, :name => 'Relatório – 6º Trimestre')

    # educandos
    Report.create(:user_type_id => 4, :name => 'Relatório – 1º Semestre')
    Report.create(:user_type_id => 4, :name => 'Relatório – 2º Semestre')
    Report.create(:user_type_id => 4, :name => 'Relatório – 3º Semestre')

    # gestor
    # no reports with deadlines for gestores
  end

  def self.down
  end
end
