class ProjectTeamMembersAddUserId < ActiveRecord::Migration
  def self.up
    add_column :project_team_members, :user_id, :integer
  end

  def self.down
    remove_column :project_team_members, :user_id
  end
end
