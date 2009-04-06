class CreateStudentReports < ActiveRecord::Migration
  def self.up
    create_table :student_reports do |t|
      t.text    :s1_what_enjoyed_to_learn
      t.string  :s1_difficulties
      t.text    :s1_difficulties_text
      t.text    :s1_opinion_on_educators
      t.text    :s1_opinion_on_coordination
      t.text    :s1_selfevaluation
      t.text    :s1_how_can_improve
      t.integer :s1_oi_kabum_helped
      t.text    :s1_oi_kabum_helped_text
      t.text    :s1_family_relationship_changed
      t.text    :s1_former_expectations
      t.text    :s1_current_expectations
      t.text    :s1_what_want_from_future
      t.text    :s1_free_thoughts
      t.text    :s2_what_learned
      t.text    :s2_opinion_on_educators
      t.text    :s2_relationship_with_coordination
      t.text    :s2_selfevaluation
      t.text    :s2_how_can_improve
      t.text    :s2_what_could_be_better
      t.text    :s3_what_learned
      t.text    :s3_what_kabum_means
      t.text    :s3_noticed_difference
      t.text    :s3_self_evaluation
      t.text    :s3_whats_next

      t.timestamps
    end
  end

  def self.down
    drop_table :student_reports
  end
end
