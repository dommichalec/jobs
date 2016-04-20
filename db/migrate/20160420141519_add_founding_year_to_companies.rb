class AddFoundingYearToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :founded_in, :integer
  end
end
