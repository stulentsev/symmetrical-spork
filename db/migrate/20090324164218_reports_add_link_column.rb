class ReportsAddLinkColumn < ActiveRecord::Migration
  def self.up
    add_column :reports, :link, :string

    Report.connection.execute("update reports set link = 'edit_course_url(params[:id])'")
  end

  def self.down
    remove_column :reports, :link
  end
end
