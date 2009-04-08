class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :user_type_id
      t.integer :report_type
      t.string  :name
      t.string  :link

      t.timestamps
    end

    # ooordenadores
    Report.create(:user_type_id => 1, :name => 'Marco Zero', :report_type => 1,
                  :link => 'edit_course_path(params[:course_id] || params[:id])')
    Report.create(:user_type_id => 1, :name => 'Escolha das linguagens', :report_type => 1,
                  :link => 'language_choice_course_path(params[:course_id] || params[:id])')

    6.times do |num|
      Report.create(:user_type_id => 1, :name => "Relatório – #{num + 1}º Trimestre", :report_type => 2,
                    :link => "edit_course_coordinator_trimestrial_report_url(params[:course_id] || params[:id], #{num + 1})")
    end

    Report.create(:user_type_id => 1, :name => 'Relatório final', :report_type => 1,
                  :link => 'edit_course_final_report_path(params[:course_id] || params[:id])')

    # educadores de linguagens
    6.times do |num|
      Report.create(:user_type_id => 2, :name => "Relatório – #{num + 1}º Trimestre", :report_type => 2,
                    :link => "edit_course_educator_report_url(params[:course_id] || params[:id], #{num + 1})")
    end

    # educadores transversais
    6.times do |num|
      Report.create(:user_type_id => 3, :name => "Relatório – #{num + 1}º Trimestre", :report_type => 2,
                    :link => "edit_course_educator_report_url(params[:course_id] || params[:id], #{num + 1})")
    end

    # educandos
    3.times do |num|
      Report.create(:user_type_id => 4,
                    :name => "Relatório – #{num + 1}º Semestre",
                    :report_type => 3,
                    :link => "edit_course_student_report_url(params[:course_id] || params[:id], #{num + 1})")

    end

    # gestor
    # no reports with deadlines for gestores


  end

  def self.down
    drop_table :reports
  end
end
