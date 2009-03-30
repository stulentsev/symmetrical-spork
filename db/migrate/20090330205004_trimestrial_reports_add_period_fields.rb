class TrimestrialReportsAddPeriodFields < ActiveRecord::Migration
  def self.up
    add_column :coordinator_trimestrial_reports, :period_from, :date
    add_column :coordinator_trimestrial_reports, :period_to, :date
  end

  def self.down
    remove_column :coordinator_trimestrial_reports, :period_from
    remove_column :coordinator_trimestrial_reports, :period_to
  end
end
