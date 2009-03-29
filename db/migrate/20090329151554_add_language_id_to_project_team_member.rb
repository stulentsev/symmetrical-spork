class AddLanguageIdToProjectTeamMember < ActiveRecord::Migration
  def self.up
    add_column :project_team_members, :language_id, :integer
  end

  def self.down
    remove_column :project_team_members, :language_id
  end
end
