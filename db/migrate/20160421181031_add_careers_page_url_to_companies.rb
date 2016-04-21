class AddCareersPageUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :careers_page_url, :string
  end
end
