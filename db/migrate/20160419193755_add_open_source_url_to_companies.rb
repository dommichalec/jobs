class AddOpenSourceUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :open_source_projects_url, :string
  end
end
