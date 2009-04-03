class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :user_type_id
      t.integer :report_type
      t.string  :name
      t.string  :link
      t.integer :actual_report_id

      t.timestamps
    end

    # ooordenadores
    Report.create(:user_type_id => 1, :name => 'Marco Zero',
                  :link => 'edit_course_path(params[:course_id] || params[:id])')
    Report.create(:user_type_id => 1, :name => 'Escolha das linguagens',
                  :link => 'language_choice_course_path(params[:course_id] || params[:id])')

    Report.create(:user_type_id => 1, :name => 'Relatório – 1º Trimestre',
                  :link => 'edit_course_coordinator_trimestrial_report_url(params[:id], 1)')
    Report.create(:user_type_id => 1, :name => 'Relatório – 2º Trimestre',
                  :link => 'edit_course_coordinator_trimestrial_report_url(params[:id], 2)')
    Report.create(:user_type_id => 1, :name => 'Relatório – 3º Trimestre',
                  :link => 'edit_course_coordinator_trimestrial_report_url(params[:id], 3)')
    Report.create(:user_type_id => 1, :name => 'Relatório – 4º Trimestre',
                  :link => 'edit_course_coordinator_trimestrial_report_url(params[:id], 4)')
    Report.create(:user_type_id => 1, :name => 'Relatório – 5º Trimestre',
                  :link => 'edit_course_coordinator_trimestrial_report_url(params[:id], 5)')
    Report.create(:user_type_id => 1, :name => 'Relatório – 6º Trimestre',
                  :link => 'edit_course_coordinator_trimestrial_report_url(params[:id], 6)')

    Report.create(:user_type_id => 1, :name => 'Relatório final',
                  :link => 'edit_course_final_report_path(params[:course_id] || params[:id])')

    # educadores de linguagens
    Report.create(:user_type_id => 2, :name => 'Relatório – 1º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 1)')
    Report.create(:user_type_id => 2, :name => 'Relatório – 2º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 2)')
    Report.create(:user_type_id => 2, :name => 'Relatório – 3º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 3)')
    Report.create(:user_type_id => 2, :name => 'Relatório – 4º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 4)')
    Report.create(:user_type_id => 2, :name => 'Relatório – 5º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 5)')
    Report.create(:user_type_id => 2, :name => 'Relatório – 6º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 6)')

    # educadores transversais
    Report.create(:user_type_id => 3, :name => 'Relatório – 1º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 1)')
    Report.create(:user_type_id => 3, :name => 'Relatório – 2º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 2)')
    Report.create(:user_type_id => 3, :name => 'Relatório – 3º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 3)')
    Report.create(:user_type_id => 3, :name => 'Relatório – 4º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 4)')
    Report.create(:user_type_id => 3, :name => 'Relatório – 5º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 5)')
    Report.create(:user_type_id => 3, :name => 'Relatório – 6º Trimestre',
                  :link => 'edit_course_educator_report_url(params[:id], 6)')

    # educandos
    Report.create(:user_type_id => 4, :name => 'Relatório – 1º Semestre')
    Report.create(:user_type_id => 4, :name => 'Relatório – 2º Semestre')
    Report.create(:user_type_id => 4, :name => 'Relatório – 3º Semestre')

    # gestor
    # no reports with deadlines for gestores


  end

  def self.down
    drop_table :reports
  end
end
