class ReportsAddLinkColumn < ActiveRecord::Migration
  def self.up
    add_column :reports, :link, :string

    report = Report.find_by_name('Marco Zero')
    report.link = 'edit_course_path(params[:course_id] || params[:id])'
    report.save

    report = Report.find_by_name('Escolha das linguagens')
    report.link = 'language_choice_course_path(params[:course_id] || params[:id])'
    report.save

    report = Report.find_by_name('Relatório final')
    report.link = 'edit_course_final_report_path(params[:course_id] || params[:id])'
    report.save
  end

  def self.down
    remove_column :reports, :link
  end
end
