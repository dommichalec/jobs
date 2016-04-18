class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :how_apply
      t.boolean :available

      t.timestamps null: false
    end
  end
end
