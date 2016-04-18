class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :headquarters_location
      t.string :url
      t.string :stack
      t.integer :size

      t.timestamps null: false
    end
  end
end
