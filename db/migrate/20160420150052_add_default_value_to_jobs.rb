class AddDefaultValueToJobs < ActiveRecord::Migration
  def change
    change_column(:jobs, :available, :boolean, :default => true)
  end
end
