class CreateProjectTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :project_team_members do |t|
      t.string  :name
      t.string  :function
      t.text    :competencies
      t.text    :curriculum_summary
      t.string  :email
      t.integer :course_id
      t.integer :language_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_team_members
  end
end
