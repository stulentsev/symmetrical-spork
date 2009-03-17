class CreateProjectTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :project_team_members do |t|
      t.string :name
      t.string :function
      t.text :competencies
      t.text :curriculum_summary
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :project_team_members
  end
end
