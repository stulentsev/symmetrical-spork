class CoursesFinalReportFields < ActiveRecord::Migration
  def self.up
    add_column :courses, :how_many_finished,                      :integer
    add_column :courses, :how_many_are_employed,                  :integer
    add_column :courses, :resource_application,                   :text
    add_column :courses, :how_many_will_act,                      :integer
    add_column :courses, :how_many_continue_studying,             :integer
    add_column :courses, :reflections_on_evolution_of_objectives, :text
    add_column :courses, :results_expected_not_achieved,          :text
    add_column :courses, :results_not_expected_achieved,          :text
    add_column :courses, :internship_experience_report,           :text
    add_column :courses, :conclusions,                            :text
  end

  def self.down
    remove_column :courses, :how_many_finished
    remove_column :courses, :how_many_are_employed
    remove_column :courses, :resource_application
    remove_column :courses, :how_many_will_act
    remove_column :courses, :how_many_continue_studying
    remove_column :courses, :reflections_on_evolution_of_objectives
    remove_column :courses, :results_expected_not_achieved
    remove_column :courses, :results_not_expected_achieved
    remove_column :courses, :internship_experience_report
    remove_column :courses, :conclusions
  end
end
