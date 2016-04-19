class AddOfficeTimeExpectationToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :time_spent_in_office, :integer
  end
end
